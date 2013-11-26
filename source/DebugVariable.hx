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
import flixel.util.FlxPoint;


// Yeah... I should really be using inheritance...
class DebugVariable extends FlxSprite {
	var variableType:String;
	var fieldName:String;
	var inspectedObject:Dynamic;

	var displayType:String = "";

	var firstInput:FlxInputText;
	var secondInput:FlxInputText;
	var label:FlxText;

	public function new(x:Float, y: Float, fieldName:String, inspectedObject:Dynamic) {
		super();

		var value:Dynamic = Reflect.field(inspectedObject, fieldName);
		this.variableType = Type.getClassName(Type.getClass(value));
		this.inspectedObject = inspectedObject;
		this.fieldName = fieldName;

		if (this.variableType == null) {
			this.variableType = Std.string(Type.typeof(value));
		}

		label = new FlxText(x, y, 50, fieldName);
		Reg.state.add(label);

		if (variableType == "TInt" || variableType == "TFloat" || variableType == "String") {
			displayType = "single";

			firstInput = new FlxInputText(x + label.width, y, 50, value);

			Reg.state.add(firstInput);

			this.height = firstInput.height;

			firstInput.enterCallBack = function(_:String) {
				if (firstInput.text != "") {
					Reflect.setField(inspectedObject, fieldName, Std.parseInt(firstInput.text));

					firstInput.hasFocus = false;
				}
			}
		} else if (variableType.indexOf("FlxPoint") != -1) {
			displayType = "point";

			var vel:FlxPoint = Reflect.field(inspectedObject, fieldName);

			firstInput = new FlxInputText(x + 5 + label.width, y, 50, Std.string(vel.x));
			secondInput = new FlxInputText(x + 5 + label.width, firstInput.y + firstInput.height + 10, 50, Std.string(vel.y));
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

		if (displayType == "single") {
			debuggingItems = [firstInput];
		} else {
			debuggingItems = [firstInput, secondInput];
		}

		for (item in debuggingItems) {
			repositionObject(item);
		}
	}

	public function updateValues() {
		if (displayType == "single") {
			if (!this.firstInput.hasFocus) {
				this.firstInput.text = Reflect.field(this.inspectedObject, this.fieldName);
			}
		} else if (displayType == "point"){
			if (!this.firstInput.hasFocus) {
				this.firstInput.text  = Reflect.field(Reflect.field(this.inspectedObject, this.fieldName), "x");
			}

			if (!this.secondInput.hasFocus) {
				this.secondInput.text = Reflect.field(Reflect.field(this.inspectedObject, this.fieldName), "y");
			}
		}
	}

	public function hide() {
		label.visible = false;

		if (displayType == "single") {
			firstInput.visible = false;
		} else if (displayType == "point") {
			firstInput.visible = false;
			secondInput.visible = false;
		}
	}

	public function show() {
		label.visible = true;

		if (displayType == "single") {
			firstInput.visible = true;
		} else if (displayType == "point") {
			firstInput.visible = true;
			secondInput.visible = true;
		}
	}
}