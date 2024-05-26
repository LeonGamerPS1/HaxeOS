package important.boot;

import flixel.FlxState;
import flixel.text.FlxText;

class BootingState extends FlxState
{
	public var statusText:FlxText;

	override public function create()
	{
		super.create();
		statusText = new FlxText(20, 20, "Loading HaxeOS....");
		add(statusText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
