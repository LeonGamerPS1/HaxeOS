package important.desktop;







class Desktop extends FlxState
{
	var taskBar:FlxSprite;
	var startButton:FlxSprite;
	var bg:FlxSprite;

	var touchTracker:FlxSprite;
	var infoText:FlxButton;




	override function create()
	{
		

        
		FlxG.camera.flash(FlxColor.BLACK);
		bg = new FlxSprite(0, 0).loadGraphic('assets/images/themes/${ThemeManager.currentTheme}/background.png');

		bg.setGraphicSize(FlxG.width * 1.0, FlxG.height * 1.0);
		add(bg);
		add(taskBar);
		taskBar = new FlxSprite(0, FlxG.height).makeGraphic(FlxG.width, Std.int(FlxG.height * 0.07), FlxColor.GRAY);
		taskBar.y -= taskBar.height;
		add(taskBar);

		startButton = new FlxSprite(300, 300);
		startButton.scale.set(0.4, 0.4);
		startButton.loadGraphic('assets/images/themes/${ThemeManager.currentTheme}/me_dumb_if_loads.png');
		add(startButton);

		#if android
		touchTracker = new FlxSprite(0, 0).loadGraphic('assets/images/themes/${ThemeManager.currentTheme}/cursor.png');
		add(touchTracker);
		#end
		bg.updateHitbox();
		taskBar.updateHitbox();
		startButton.updateHitbox();
		super.create();
		postCreate();
	}

	function postCreate()
	{
		var infoText:FlxButton = new FlxButton(0, 0, "Reload", function()
		{
			FlxG.resetState();
		});
		add(infoText);
		var inputText = new FlxInputText(0, infoText.y + 20);
		inputText.callback = function(text, action)
		{
			ThemeManager.set_currentTheme(text.toLowerCase());
		};

		add(inputText);
	



	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		bg.screenCenter();
		
		if (taskBar != null)
			startButton.setPosition(taskBar.x, taskBar.y);
		#if android
		// Get the current touch position
		var touch = FlxG.touches.getFirst();

		if (touch != null)
		{
			// Update the position of the marker to follow the touch
			touchTracker.setPosition(touch.screenX, touch.screenY);

			// Show the marker when there is a touch
			touchTracker.visible = true;
		}
		else
		{
			touchTracker.visible = false;
		}
		if (FlxG.pixelPerfectOverlap(touchTracker, startButton))
			startButton.color = FlxColor.GRAY;
		else
			startButton.color = FlxColor.WHITE;
		#end
		#if (!android)
		if (FlxG.mouse.overlaps(startButton))
			startButton.color = FlxColor.GRAY;
		else
			startButton.color = FlxColor.WHITE;
		#if debug
		if (FlxG.keys.pressed.I)
			FlxG.camera.zoom += 0.05;
		if (FlxG.keys.pressed.O)
			FlxG.camera.zoom -= 0.05;
		#end
		#end

	}
}
