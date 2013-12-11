package game;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxGradient;
import flixel.util.FlxMath;

import flixel.addons.ui.FlxInputText;
import flixel.util.FlxPoint;

class DebugVariable extends FlxSprite {
	var label:FlxText;
	var fieldName:String;
	var inspectedObject:Dynamic;

	public function new(x:Float, y:Float, fieldName:String, inspectedObject:Dynamic) {
		super();

		this.fieldName  = fieldName;
		this.inspectedObject = inspectedObject;

		label = new FlxText(x, y, 50, fieldName);
		Reg.state.add(label);
	}

	public function elements():Array<FlxSprite> {
		return [label];
	}

	public function hide() {
		for (e in elements()) {
			e.visible = false;
		}
	}

	public function show() {
		for (e in elements()) {
			e.visible = true;
		}
	}

	public function reorientTo(target:FlxSprite, menu:FlxSprite) {
		var offsetX:Int = Std.int(menu.x);
		var offsetY:Int = Std.int(menu.y);

		function repositionObject(object:FlxSprite) {
			object.x -= offsetX;
			object.y -= offsetY;

			// could abstract this out better...
			object.x += target.x + target.width + 15;
			object.y += target.y - 5;
		}

		var debuggingItems:Array<FlxSprite>;

		for (item in this.elements()) {
			repositionObject(item);
		}
	}

	public function updateValues() { }
}