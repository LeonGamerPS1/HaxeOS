package important;

import openfl.utils.AssetCache;
import flixel.FlxGame;
import important.boot.BootingState;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	private var assetCache:AssetCache;

	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, BootingState));
		assetCache = new AssetCache();
	
		#if !mobile
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end
	}
}
