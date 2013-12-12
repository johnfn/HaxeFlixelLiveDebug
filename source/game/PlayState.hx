package game;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.FlxCamera;


// ctrl-i generate import statement.

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	public var level:TiledLevel;

    public function checkUpdateScreen() {
        var change:Bool = false;

        if (Reg.player.x > (Reg.mapX + 1) * Reg.mapWidth) {
                Reg.mapX++;
                change = true;
        }

        if (Reg.player.x < Reg.mapX * Reg.mapWidth) {
                Reg.mapX--;
                change = true;
        }

        if (Reg.player.y > (Reg.mapY + 1) * Reg.mapHeight) {
                Reg.mapY++;
                change = true;
        }

        if (Reg.player.y < Reg.mapY * Reg.mapHeight) {
                Reg.mapY--;
                change = true;
        }

        if (change) {
            FlxG.camera.setBounds(Reg.mapX * Reg.mapWidth, Reg.mapY * Reg.mapHeight, Reg.mapWidth, Reg.mapHeight, true);
        }
    }


	override public function create():Void {
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end

		super.create();

		var b:Block = new Block();
		this.add(b);

		Reg.state = this;

		var p:Player = new Player(50, 50);
		this.add(p);

        level = new TiledLevel("data/map.tmx", "images/tileset.png", 25);
        add(level.foregroundTiles);
        add(level.backgroundTiles);
        level.loadObjects(this);

        Reg.map = level;

        Reg.player = p;

        FlxG.camera.follow(Reg.player, FlxCamera.STYLE_PLATFORMER);

	}

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void {
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void {
		super.update();

		checkUpdateScreen();

#if debug
		if (FlxG.keys.justPressed.R) {
			this.remove(level.foregroundTiles);
			this.remove(level.backgroundTiles);

	        level = new TiledLevel("data/map.tmx", "images/tileset.png", 25);
	        add(level.foregroundTiles);
	        add(level.backgroundTiles);
	        level.loadObjects(this);
		}
#end
	}	
}