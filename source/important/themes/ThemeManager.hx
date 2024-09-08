package important.themes;



class ThemeManager
{
	public static var currentTheme:String = 'default';

	public static function initThemeData()
	{
		currentTheme = 'default';
		trace('Current theme set to $currentTheme!');
		trace('Checking if save data exists...');
		if (FlxG.save.data.currentTheme == null)
		{
			trace("Save data doesnt exist!, initializing FlxG.save.data.currentTheme...");
			FlxG.save.data.currentTheme = currentTheme;
			currentTheme = FlxG.save.data.currentTheme;
			trace(FlxG.save.data);
		}
		currentTheme = FlxG.save.data.currentTheme;
		trace(currentTheme);
	}

	public static function set_currentTheme(e)
	{
	
		FlxG.save.data.currentTheme = e;
		currentTheme = e;
		trace(FlxG.save.data);
		return e;
	}
}
