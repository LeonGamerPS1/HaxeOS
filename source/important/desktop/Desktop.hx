package important.desktop;

import flxanimate.FlxAnimate;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class Desktop extends FlxState
{
	var taskBar:FlxSprite;
	var startButton:FlxSprite;

	var touchTracker:FlxSprite;

	override function create()
	{
		taskBar = new FlxSprite(0, FlxG.height).makeGraphic(FlxG.width, Std.int(FlxG.height * 0.07), FlxColor.GRAY);
		taskBar.y -= taskBar.height;
		add(taskBar);

		startButton = new FlxSprite(300, 300);
		startButton.scale.set(0.4, 0.4);
		startButton.loadGraphic('assets/images/me_dumb_if_loads.png');
		add(startButton);

		#if android
		touchTracker = new FlxSprite(0, 0).makeGraphic(64, 64);
		add(touchTracker);
		#end
		super.create();
		var character:FlxAnimate = new FlxAnimate(500, 500, 'assets/images/pico');
		character.anim.addBySymbol('Pico dead loop','Pico dead loop',24);
		character.anim.play('Pico dead loop');
		add(character);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		startButton.setPosition(taskBar.x - 38, taskBar.y - 38);
		#if android
		if (FlxG.touches.getFirst().justPressed)
		{
			// Get the current touch position
			var touch = FlxG.touches.getFirst();

			if (touch != null)
			{
				// Update the position of the marker to follow the touch
				touchTracker.setPosition(touch.screenX, touch.screenY);

				// Show the marker when there is a touch
				touchTracker.visible = true;
			}
		}
		else
		{
			// Hide the marker when no touch is detected
			touchTracker.visible = false;
		}
		
		#end
	}
	} 
