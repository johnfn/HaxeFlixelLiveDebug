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

class DebugNumber extends DebugVariable {
	var input:FlxInputText;

	public function new(x:Float, y: Float, fieldName:String, inspectedObject:Dynamic) {
		super(x, y, fieldName, inspectedObject);

		this.fieldName = fieldName;
		this.inspectedObject = inspectedObject;

		input = new FlxInputText(x + label.width, y, 50, Std.string(Reflect.field(inspectedObject, fieldName)));

		Reg.state.add(input);

		input.enterCallBack = function(_:String) {
			if (input.text != "") {
				Reflect.setField(inspectedObject, fieldName, Std.parseInt(input.text));

				input.hasFocus = false;
			}
		}

		this.height = input.height;
	}

	public override function updateValues() {
		if (!this.input.hasFocus) {
			this.input.text = Reflect.field(this.inspectedObject, this.fieldName);
		}
	}

	public override function elements():Array<FlxSprite> {
		return super.elements().concat([input]);
	}
}