package game;

import flash.display.Bitmap;
import flash.events.Event;
import flash.net.URLRequest;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxGradient;
import flixel.util.FlxMath;

import flixel.addons.ui.FlxInputText;
import flixel.util.FlxPoint;

import flash.display.Loader;

class Player extends FlxSprite {
	/** test */
	public var tweakable:Array<String>;
	public var derpus:Int = 44;

	public var menuVisible = false;

	private var debuggingMenu:FlxSprite;
	private var debuggingItems:Array<DebugVariable>;

	public function new(x:Int, y:Int) {
		super(x, y);

		this.tweakable = ["x", "y", "velocity", "drag"];

		this.loadGraphic("images/tileset.png");

		this.drag.x = 2000;
		this.drag.y = 2000;

		buildDebuggingMenu();
	}	

	public function buildDebuggingMenu() {
		var currentHeight:Float = this.y;
		var inspectedObject = this;
		var menu:FlxSprite = new FlxSprite(this.x + this.width + 15, this.y - 5);

		this.debuggingMenu = menu;
		this.debuggingItems = [];

		FlxG.state.add(menu);

		for (fieldName in this.tweakable) {
			// Determine the type of the field.
			var value:Dynamic = Reflect.field(inspectedObject, fieldName);
			var variableType = Type.getClassName(Type.getClass(value));
			if (variableType == null) {
				variableType = Std.string(Type.typeof(value));
			}

			var dbg:DebugVariable;

			if (variableType.indexOf("Int") != -1 || variableType.indexOf("String") != -1) {
				 dbg = new DebugNumber(this.x + this.width + 20, currentHeight, fieldName, inspectedObject);
			} else if (variableType.indexOf("FlxPoint") != -1) {
				 dbg = new DebugPoint(this.x + this.width + 20, currentHeight, fieldName, inspectedObject);
			} else {
				continue;
				dbg = null; // catchall for the compiler's sake
			}

			this.debuggingItems.push(dbg);

			currentHeight += dbg.height + 10;
		}	

		menu.makeGraphic(Std.int(this.width + 70 + 50), Std.int(currentHeight), 0x66444444);

		hideDebuggingMenu();
	}

	public function hideDebuggingMenu() {
		for (item in this.debuggingItems) {
			item.hide();
		}

		this.debuggingMenu.visible = false;
		this.menuVisible = false;
	}

	public function showDebuggingMenu() {
		// reposition to be in the correct place

		for (dbg in debuggingItems) {
			dbg.reorientTo(this, debuggingMenu);
			dbg.show();
		}

		// update menu last, since the other items currently need to refer to its old position. 
		debuggingMenu.x = this.x + this.width + 15;
		debuggingMenu.y = this.y - 5;

		this.updateDebuggingMenu();

		this.debuggingMenu.visible = true;
		this.menuVisible = true;
	}

	public function updateDebuggingMenu() {
		for (item in this.debuggingItems) {
			item.updateValues();
		}
	}

	public function reloadGraphic() {
		var loader:Loader = new Loader();
		var sprite:Player = this;

		function loadComplete(e:Event) {
		    var loadedBitmap:Bitmap = cast(e.currentTarget.loader.content, Bitmap);
		    sprite.loadGraphic(loadedBitmap.bitmapData);
		}

		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
		loader.load(new URLRequest("../../../../../../../assets/images/tileset.png"));
	}


	public override function update() {
		super.update();

		if (FlxG.keys.pressed.A) {
			this.velocity.x = -300;
		} 
		if (FlxG.keys.pressed.D) {
			this.velocity.x = 300;
		}

		if (FlxG.keys.pressed.W) {
			this.velocity.y = -300;
		}
		if (FlxG.keys.pressed.S) {
			this.velocity.y = 300;
		}

		if (FlxG.keys.justPressed.R) {
			reloadGraphic();
		}

		if (this.menuVisible) {
			updateDebuggingMenu();
		}

		if (FlxG.mouse.justPressed){
			if (this.overlapsPoint(FlxG.mouse)) {
				showDebuggingMenu();
			} else if (!this.debuggingMenu.overlapsPoint(FlxG.mouse)) {
				hideDebuggingMenu();
			}
		}

		// this.acceleration.y = 100;
	}
}
