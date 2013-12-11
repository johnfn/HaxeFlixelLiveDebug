package game;

import openfl.Assets;
import haxe.io.Path;
import haxe.xml.Parser;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectGroup;
import flixel.addons.editors.tiled.TiledTileSet;
import haxe.macro.Context;

/*
        NOTE

        If you want to use this class, you're going to have to add 2 lines to your openfl xml project file:

        <haxeflag name="--remap flash:flash" />
        <haxeflag name="--macro include('<package>')" /> // this is the package that your classes are in.

        This is to explicitly reference all the classes in <package>, so that Type.resolveClass can resolve them from strings. Unfortunately you
        can't just do import package.*, since that doesn't bring in anything except the classes you reference in this file. 

*/

/**
 * @author Samuel Batista
 * With additions from @johnfn
 */
class TiledLevel extends TiledMap
{
        // For each "Tile Layer" in the map, you must define a "tileset" property which contains the name of a tile sheet image 
        // used to draw tiles in that layer (without file extension). The image file must be located in the directory specified bellow.
        private inline static var c_PATH_LEVEL_TILESHEETS = "images/";

        // Array of tilemaps used for collision
        public var foregroundTiles:FlxGroup;
        public var backgroundTiles:FlxGroup;
        public var tileSheet:String;
        public var tileSize:Int;
        private var collidableTileLayers:Array<FlxTilemap>;

        public function new(tiledLevel:Dynamic, tileSheet:String, tileSize:Int) {
                super(tiledLevel);
                this.collidableTileLayers = [];
                this.tileSheet = tileSheet;
                this.tileSize = tileSize;

                foregroundTiles = new FlxGroup();
                backgroundTiles = new FlxGroup();

                FlxG.camera.setBounds(0, 0, fullWidth, fullHeight, true);

                var layer:FlxTilemap = loadLayer("Map");
                collidableTileLayers.push(layer);
                foregroundTiles.add(layer);

                var bglayer:FlxTilemap = loadLayer("nocollide");
                backgroundTiles.add(bglayer);
        }

        public function loadLayer(layer:String):FlxTilemap {
                var result:FlxTilemap;

                for ( tileLayer in layers ) {
                        if (tileLayer.name != layer) continue;

                        var imagePath                 = new Path(tileSheet);
                        var processedPath         = c_PATH_LEVEL_TILESHEETS + imagePath.file + "." + imagePath.ext;

                        var tilemap:FlxTilemap = new FlxTilemap();
                        tilemap.widthInTiles = width;
                        tilemap.heightInTiles = height;
                        tilemap.loadMap(tileLayer.tileArray, processedPath, tileSize, tileSize, 0, 1, 1, 1);

                        return tilemap;
                }

                throw 'Couldn\'t find layer named $layer';
                return null;
        }

        public function loadObjects(state:PlayState) {
                for (group in objectGroups) {
                        for (o in group.objects) {
                                loadObject(o, group, state);
                        }
                }
        }

        private function loadObject(o:TiledObject, g:TiledObjectGroup, state:PlayState) {
                var x:Int = o.x;
                var y:Int = o.y;

                // objects in tiled are aligned bottom-left (top-left in flixel)
                if (o.gid != -1)
                        y -= g.map.getGidOwner(o.gid).tileHeight;

                var instance = Type.createInstance(Type.resolveClass("game." + o.type), [x, y]);
                FlxG.state.add(instance);
        }

        public function collideWithLevel(obj:FlxObject, ?notifyCallback:FlxObject->FlxObject->Void, ?processCallback:FlxObject->FlxObject->Bool):Bool
        {
                if (collidableTileLayers != null)
                {
                        for ( map in collidableTileLayers)
                        {
                                // IMPORTANT: Always collide the map with objects, not the other way around. 
                                //                          This prevents odd collision errors (collision separation code off by 1 px).
                                return FlxG.overlap(map, obj, notifyCallback, processCallback != null ? processCallback : FlxObject.separate);
                        }
                }
                return false;
        }
}
