package important;

import flixel.FlxGame;
import important.boot.BootingState;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, BootingState));

		#if !mobile
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end
	}
}
