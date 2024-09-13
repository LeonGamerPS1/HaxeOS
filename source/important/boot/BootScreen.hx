package important.boot;

class BootScreen extends FlxState
{
	var s:FlxSprite;
	var e:FlxText;
	var loadingCircle:FlxSprite;
	var switchState:FlxState;
	var windows11mode:Bool = true;

	override public function create():Void
	{
		#if (!android)
		var dump:FlxSprite;
		dump = new FlxSprite().loadGraphic('assets/images/themes/${ThemeManager.currentTheme}/cursor.png');
		FlxG.mouse.load(dump.pixels);
		#end
		super.create();

		s = new FlxSprite(0, 0).loadGraphic('assets/images/themes/${ThemeManager.currentTheme}/me_dumb_if_loads.png');

		add(s);
		e = new FlxText(0, 0, 0, "");
		if(FlxG.save.data.setup == null)
			e.text = 'Preparing Setup | Device Vendor: ${lime.system.System.deviceVendor}';
		add(e);

		e.setFormat('assets/fonts/SegoeUIVF.ttf', 35, FlxColor.WHITE);
		s.screenCenter();
		s.y -= s.height * 0.2;
        var frames = 115;
		var extension = '';
		if(windows11mode){
			frames = 110;
			extension = '-windows11';
		}
		loadingCircle = new FlxSprite().loadGraphic('assets/images/loading$extension.png', true, 128, 128);
		loadingCircle.animation.add('load', numArray(115), 30, true);
		loadingCircle.setGraphicSize(loadingCircle.width * 0.5);
		loadingCircle.animation.play('load');
		add(loadingCircle);

		new FlxTimer().start(5, function(s:FlxTimer)
		{
			FlxTween.tween(FlxG.camera, {alpha: 0}, 1);
			new FlxTimer().start(2, function(s:FlxTimer)
			{
				if(FlxG.save.data.setup != null)
					FlxG.switchState(new important.desktop.Desktop());
				else
					FlxG.switchState(new Setup());
				
			});
		});
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		loadingCircle.y = s.y + s.height * 1.5;

		
		e.y = loadingCircle.y + loadingCircle.height;
		// e.angle = s.angle;
		e.screenCenter(X);
		loadingCircle.x = s.x - 15;
		loadingCircle.offset.x = -15;
		loadingCircle.offset.y = -15;
	}
	/**
	 * Returns an array with numbers, starting from 0.
	 * @param int The numbers inside of the array.
	 * @return Array<Int>
	 */
	public static function numArray(int:Int):Array<Int>
	{
		var returnArray = [];

		for (i in 0...int)
		{
			returnArray.push(i);
		}

		return returnArray;
	}
}
