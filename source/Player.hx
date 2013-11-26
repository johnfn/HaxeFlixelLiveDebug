package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxGradient;
import flixel.util.FlxMath;

import flixel.addons.ui.FlxInputText;

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

		this.makeGraphic(25, 25, 0xff00ff00);

		this.drag.x = 2000;
		this.drag.y = 2000;

		buildDebuggingMenu();
	}	

	public function buildDebuggingMenu() {
		var currentHeight:Float = this.y;
		var inspectedObject = this;
		var menu:FlxSprite = new FlxSprite(this.x + this.width + 15, this.y - 5).makeGraphic(Std.int(this.width + 70 + 50), Std.int(this.tweakable.length * 20 + 20), 0x66444444);

		this.debuggingMenu = menu;
		this.debuggingItems = [];

		FlxG.state.add(menu);

		for (fieldName in this.tweakable) {
			var dbg:DebugVariable = new DebugVariable(this.x + this.width + 20, currentHeight, fieldName, inspectedObject);

			this.debuggingItems.push(dbg);

			currentHeight += dbg.height + 10;
		}	

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

	public override function update() {
		super.update();

		if (FlxG.keys.pressed.A) {
			this.velocity.x = -300;
		} 
		if (FlxG.keys.pressed.D) {
			this.velocity.x = 300;
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
