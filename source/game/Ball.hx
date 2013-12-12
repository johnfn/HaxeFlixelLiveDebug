package game;

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

class Ball extends FlxSprite {

	public function new(x:Int, y:Int) {
		super(x, y);

		this.makeGraphic(25, 25, 0xff00ff00);
	}

	public override function update() {
		this.velocity.y = 100;

		super.update();

		Reg.map.collideWithLevel(this);
	}
}