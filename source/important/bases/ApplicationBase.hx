package important.bases;

class ApplicationBase extends FlxBasic
{
	public var name:String;
	public var icon:String;
	public var title:String;
	public var version:Int;

	public function new(name:String, icon:String, title:String, version:Int, startAutomaticly:Bool = true, updateAutomaticly:Bool = true)
	{
		super();
		this.name = name;
		this.icon = icon;
		this.title = title;
		this.version = version;
		if (startAutomaticly)
			start(this.name, this.version);
	}

	function start(name, version) {}
}
