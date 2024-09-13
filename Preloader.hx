

class Preloader extends flixel.system.FlxBasePreloader {
    public function new(time = 0,?allowedUrls) {
        super(time,allowedUrls);
        trace("Starting APP...");
    }
}