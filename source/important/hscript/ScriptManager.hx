package important.hscript;

import sys.FileSystem;
import sys.io.File;
import haxe.Log;

class ScriptManager
{
	private var scripts:Array<String> = [];

	public function new() {}

	public function addScript(script:String):Void
	{
		scripts.push(script);
	}

	public function execute():Void
	{
		var parser = new Parser();
		var interp = new Interp();
		interp.setVar('FlxG', FlxG);
		interp.allowPublicVariables = true;
		interp.allowStaticVariables = true;
		interp.variables.set("trace", Log);
		for (script in scripts)
		{
			try
			{
				var ast = parser.parseString(script);
				interp.execute(ast);
				// trace(result);  // Use FlxG.log for logging in HaxeFlixel
			}
			catch (e:Dynamic)
			{
				FlxG.log.error('Error executing script: $e');
			}
		}
	}

	public function loadScriptsFromDirectory(directory:String):Void
	{
		try
		{
			var files:Array<String> = FileSystem.readDirectory(directory);
			for (file in files)
			{
			
                    
					var script:String = File.getContent(file);
                    trace(script);
					addScript(script);
				
			}
		}
		catch (e:Dynamic)
		{
			FlxG.log.error('Error loading scripts from directory: $e');
		}
	}
}
