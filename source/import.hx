package important;

import flixel.addons.ui.FlxInputText;
import flixel.input.actions.FlxActionSet;
import flixel.math.FlxVelocity;
import flixel.math.FlxRect;
import openfl.events.MouseEvent;
import lime.tools.MetaData;
import flixel.math.FlxMath;
import haxe.Log;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
#if (!web)
import sys.Http;
import sys.io.File;
import sys.FileSystem;
import sys.net.Host;
#end
import flixel.input.actions.FlxActionInput.FlxInputDeviceObject;
import flixel.ui.FlxButton;
import important.themes.ThemeManager;
import important.boot.BootScreen;
import important.boot.BootingState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import openfl.events.UncaughtErrorEvent;
import lime.app.Application;
import flixel.FlxState;
import openfl.events.Event;
import important.info.FPS_Mem;
import important.themes.ThemeManager;
import openfl.utils.AssetCache;
import flixel.FlxGame;
import flixel.text.FlxText;
import important.boot.BootingState;
import openfl.display.FPS;
import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;
import openfl.display.Sprite;
import haxe.Timer;
import openfl.display.FPS;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;

using StringTools;