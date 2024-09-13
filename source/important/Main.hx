package important;



class Main extends Sprite
{
	private var assetCache:AssetCache;

	public function new()
	{
		super();

		addChild(new FlxGame(0, 0, BootingState));
		assetCache = new AssetCache();
		ThemeManager.initThemeData();
		var fps_mem:FPS_Mem = new FPS_Mem(10, 10, 0x837DDD);

		addChild(fps_mem);
		
	}
}
