package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxGradient;
import flixel.util.FlxMath;

class Block extends FlxSprite {
	public function new() {
		super();

		this.makeGraphic(25, 25, 0xffff0000);
	}	

	public override function update() {
	}
}
