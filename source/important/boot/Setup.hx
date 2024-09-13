package important.boot;



class Setup extends FlxState
{
	var cancelSprite:FlxButton;
	var bg:FlxSprite;

	override function create()
	{
     
		bg = new FlxSprite(0, 0);

		bg.loadGraphic('assets/images/setup_bg.png');
		bg.screenCenter();
		add(bg);

		cancelSprite = new FlxButton(0, 0, "", blabla);
      cancelSprite.updateHitbox();
		cancelSprite.loadGraphic('assets/images/x.png');
		cancelSprite.setGraphicSize(cancelSprite.width * 0.5);
		cancelSprite.updateHitbox();
		add(cancelSprite);
		super.create();
		trace("setup");
		FlxG.stage.addEventListener(MouseEvent.MOUSE_DOWN, balls);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);


	}

	function blabla()
	{
		cancelSprite.color = FlxColor.WHITE;
	}

	function balls(mouseshit)
	{
		if (FlxG.mouse.overlaps(cancelSprite))
			cancelSprite.color = FlxColor.GRAY;
	}
}
