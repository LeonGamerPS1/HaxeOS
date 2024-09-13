package important.boot;

import utils.TypeUtils;



class BootingState extends FlxState
{
	public var statusText:FlxText;
	public var fileCont:Array<String>;
	
	// var dial:FlxPieDial;
	var loadedFiles:Bool = false;

	override public function create()
	{
		
	    trace(TypeUtils.isTrue(false));
		// dial = new FlxPieDial(FlxG.width * 0.85, 0, 200, FlxColor.WHITE, 36, FlxPieDialShape.CIRCLE, true, 10);
		// add(dial);
		loadedFiles = false;

		fileCont = new Array();

		statusText = new FlxText(20, 20,2, "Loading HaxeOS....");

		
		FlxG.switchState(new BootScreen());
		FlxG.sound.cacheAll();
	
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}


}
