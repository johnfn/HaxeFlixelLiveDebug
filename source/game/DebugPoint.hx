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

class DebugPoint extends DebugVariable {
	var firstInput:FlxInputText;
	var secondInput:FlxInputText;

	public function new(x:Float, y: Float, fieldName:String, inspectedObject:Dynamic) {
		super(x, y, fieldName, inspectedObject);

		var vel:FlxPoint = Reflect.field(inspectedObject, fieldName);

		firstInput = new FlxInputText(x + 5 + 50, y, 50, Std.string(vel.x));
		secondInput = new FlxInputText(x + 5 + 50, firstInput.y + firstInput.height + 10, 50, Std.string(vel.y));
		Reg.state.add(firstInput);
		Reg.state.add(secondInput);

		for (input_field in [{input: firstInput, field: "x"}, {input: secondInput, field: "y"}]) {
			var input:FlxInputText = input_field.input;
			var innerfield:String = input_field.field;

			input.enterCallBack = function(_:String) {
				if (input.text != "") {
					var inner:FlxPoint = Reflect.field(inspectedObject, fieldName);
					Reflect.setField(inner, innerfield, Std.parseInt(input.text));
					Reflect.setField(inspectedObject, fieldName, inner);

					input.hasFocus = false;
				}
			}
		}

		this.height = firstInput.height * 2 + 10;
	}

	public override function updateValues() {
		if (!this.firstInput.hasFocus) {
			this.firstInput.text  = Reflect.field(Reflect.field(this.inspectedObject, this.fieldName), "x");
		}

		if (!this.secondInput.hasFocus) {
			this.secondInput.text = Reflect.field(Reflect.field(this.inspectedObject, this.fieldName), "y");
		}
	}

	public override function elements():Array<FlxSprite> {
		return super.elements().concat([firstInput, secondInput]);
	}
}