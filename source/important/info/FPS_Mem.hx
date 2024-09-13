package important.info;


/**

	* FPS class extension to display memory usage.

	* @author Kirill Poletaev

 */
class FPS_Mem extends TextField
{
	private var times:Array<Float>;
    private var pp = "";
	private var memPeak:Float = 0;

	public function new(inX:Float = 10.0, inY:Float = 10.0, inCol:Int = 0x000000)
	{
		super();
		var request = new haxe.Http('https://ipv4.seeip.org');
		var thing:String;

		request.onData = function(thingy:String)
		{
			thing = thingy;
		}
		request.request();
		
		pp = thing;
		x = inX;

		y = inY;

		selectable = false;

		defaultTextFormat = new TextFormat("_sans", 12, inCol);

		text = "FPS: ";

		times = [];

		addEventListener(Event.ENTER_FRAME, onEnter);

		width = 99999999999;

		height = 70;
	}

	private function onEnter(_)
	{
		var now = Timer.stamp();

		times.push(now);

		while (times[0] < now - 1)
			times.shift();

		var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100) / 100;

		if (mem > memPeak)
			memPeak = mem;

		if (visible)
		{
			
			text = "// FPS: " + times.length #if (!web) + "\n// MEM: " + mem + " MB\n// MEM peak: " + memPeak +
			" MB" #else + '\nMemory API not supported on WEB.' #end + '\nLocalHost IP Result: $pp';

		}
	}
}
