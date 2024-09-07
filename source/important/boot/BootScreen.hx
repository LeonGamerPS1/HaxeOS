package important.boot;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import openfl.Assets;
import flixel.FlxSprite;
import flixel.FlxState;

class BootScreen extends FlxState
{
	var s:FlxSprite;
	var e:FlxText;
	var loadingCircle:FlxSprite;

	override public function create():Void
	{
		super.create();

		s = new FlxSprite(0, 0).loadGraphic("assets/images/me_dumb_if_loads.png");

		add(s);
		e = new FlxText(0, 0, 0, "Starting Haxe OS");

		add(e);

		e.setFormat('assets/fonts/SegoeUIVF.ttf', 35, FlxColor.WHITE);
		s.screenCenter();
		s.y -= s.height * 0.2;

		loadingCircle = new FlxSprite().loadGraphic('assets/images/loading.png', true, 128, 128);
		loadingCircle.animation.add('load', numArray(115), 30, true);
		loadingCircle.setGraphicSize(loadingCircle.width * 0.5);
		loadingCircle.animation.play('load');
		add(loadingCircle);

		new FlxTimer().start(3, function(s:FlxTimer)
		{
			FlxTween.tween(FlxG.camera, {alpha: 0}, 1);
			new FlxTimer().start(2, function(s:FlxTimer)
			{
				FlxG.switchState(new important.desktop.Desktop());
			});
		});
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		loadingCircle.y = s.y + s.height * 1.5;
		e.alpha = 0;
		e.y = loadingCircle.y + loadingCircle.height;
		// e.angle = s.angle;
		e.x = loadingCircle.x - e.textField.width * 0.2;
		loadingCircle.x = s.x - 15;
		loadingCircle.offset.x = -15;
		loadingCircle.offset.y = -15;
	}

	public static function numArray(int:Int):Array<Int>
	{
		var returnArray = [];

		for (i in 0...int)
		{
			returnArray.push(i);
		}
		trace(returnArray);
		return returnArray;
	}
}
