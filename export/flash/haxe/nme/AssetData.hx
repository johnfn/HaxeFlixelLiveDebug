package nme;


import openfl.Assets;


class AssetData {

	
	public static var className = new #if haxe3 Map <String, #else Hash <#end Dynamic> ();
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			className.set ("data/data-goes-here.txt", nme.NME_data_data_goes_here_txt);
			type.set ("data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("images/images-go-here.txt", nme.NME_images_images_go_here_txt);
			type.set ("images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("music/music-goes-here.txt", nme.NME_music_music_goes_here_txt);
			type.set ("music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("sounds/sounds-go-here.txt", nme.NME_sounds_sounds_go_here_txt);
			type.set ("sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/console.png", nme.NME_flixel_img_debugger_buttons_console_png);
			type.set ("flixel/img/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/logDebug.png", nme.NME_flixel_img_debugger_buttons_logdebug_png);
			type.set ("flixel/img/debugger/buttons/logDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/open.png", nme.NME_flixel_img_debugger_buttons_open_png);
			type.set ("flixel/img/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/pause.png", nme.NME_flixel_img_debugger_buttons_pause_png);
			type.set ("flixel/img/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/play.png", nme.NME_flixel_img_debugger_buttons_play_png);
			type.set ("flixel/img/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/record_off.png", nme.NME_flixel_img_debugger_buttons_record_off_png);
			type.set ("flixel/img/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/record_on.png", nme.NME_flixel_img_debugger_buttons_record_on_png);
			type.set ("flixel/img/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/restart.png", nme.NME_flixel_img_debugger_buttons_restart_png);
			type.set ("flixel/img/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/statsDebug.png", nme.NME_flixel_img_debugger_buttons_statsdebug_png);
			type.set ("flixel/img/debugger/buttons/statsDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/step.png", nme.NME_flixel_img_debugger_buttons_step_png);
			type.set ("flixel/img/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/stop.png", nme.NME_flixel_img_debugger_buttons_stop_png);
			type.set ("flixel/img/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/visualDebug.png", nme.NME_flixel_img_debugger_buttons_visualdebug_png);
			type.set ("flixel/img/debugger/buttons/visualDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/buttons/watchDebug.png", nme.NME_flixel_img_debugger_buttons_watchdebug_png);
			type.set ("flixel/img/debugger/buttons/watchDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/flixel.png", nme.NME_flixel_img_debugger_flixel_png);
			type.set ("flixel/img/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/debugger/windowHandle.png", nme.NME_flixel_img_debugger_windowhandle_png);
			type.set ("flixel/img/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/logo/default.png", nme.NME_flixel_img_logo_default_png);
			type.set ("flixel/img/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/logo/HaxeFlixel.svg", nme.NME_flixel_img_logo_haxeflixel_svg);
			type.set ("flixel/img/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("flixel/img/logo/logo.png", nme.NME_flixel_img_logo_logo_png);
			type.set ("flixel/img/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/preloader/corners.png", nme.NME_flixel_img_preloader_corners_png);
			type.set ("flixel/img/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/preloader/light.png", nme.NME_flixel_img_preloader_light_png);
			type.set ("flixel/img/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/tile/autotiles.png", nme.NME_flixel_img_tile_autotiles_png);
			type.set ("flixel/img/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/tile/autotiles_alt.png", nme.NME_flixel_img_tile_autotiles_alt_png);
			type.set ("flixel/img/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/analog/base.png", nme.NME_flixel_img_ui_analog_base_png);
			type.set ("flixel/img/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/analog/thumb.png", nme.NME_flixel_img_ui_analog_thumb_png);
			type.set ("flixel/img/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/button.png", nme.NME_flixel_img_ui_button_png);
			type.set ("flixel/img/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/cursor.png", nme.NME_flixel_img_ui_cursor_png);
			type.set ("flixel/img/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/fontData11pt.png", nme.NME_flixel_img_ui_fontdata11pt_png);
			type.set ("flixel/img/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/a.png", nme.NME_flixel_img_ui_virtualpad_a_png);
			type.set ("flixel/img/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/b.png", nme.NME_flixel_img_ui_virtualpad_b_png);
			type.set ("flixel/img/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/c.png", nme.NME_flixel_img_ui_virtualpad_c_png);
			type.set ("flixel/img/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/down.png", nme.NME_flixel_img_ui_virtualpad_down_png);
			type.set ("flixel/img/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/left.png", nme.NME_flixel_img_ui_virtualpad_left_png);
			type.set ("flixel/img/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/right.png", nme.NME_flixel_img_ui_virtualpad_right_png);
			type.set ("flixel/img/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/up.png", nme.NME_flixel_img_ui_virtualpad_up_png);
			type.set ("flixel/img/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/x.png", nme.NME_flixel_img_ui_virtualpad_x_png);
			type.set ("flixel/img/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/img/ui/virtualpad/y.png", nme.NME_flixel_img_ui_virtualpad_y_png);
			type.set ("flixel/img/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/snd/beep.wav", nme.NME_flixel_snd_beep_wav);
			type.set ("flixel/snd/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("flixel/snd/flixel.wav", nme.NME_flixel_snd_flixel_wav);
			type.set ("flixel/snd/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/box.png", nme.NME_flixel_flixel_ui_img_box_png);
			type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/button.png", nme.NME_flixel_flixel_ui_img_button_png);
			type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/button_thin.png", nme.NME_flixel_flixel_ui_img_button_thin_png);
			type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/button_toggle.png", nme.NME_flixel_flixel_ui_img_button_toggle_png);
			type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/check_box.png", nme.NME_flixel_flixel_ui_img_check_box_png);
			type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/check_mark.png", nme.NME_flixel_flixel_ui_img_check_mark_png);
			type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/chrome.png", nme.NME_flixel_flixel_ui_img_chrome_png);
			type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/chrome_flat.png", nme.NME_flixel_flixel_ui_img_chrome_flat_png);
			type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/chrome_inset.png", nme.NME_flixel_flixel_ui_img_chrome_inset_png);
			type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/dropdown_mark.png", nme.NME_flixel_flixel_ui_img_dropdown_mark_png);
			type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/hilight.png", nme.NME_flixel_flixel_ui_img_hilight_png);
			type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/invis.png", nme.NME_flixel_flixel_ui_img_invis_png);
			type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/radio.png", nme.NME_flixel_flixel_ui_img_radio_png);
			type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/radio_dot.png", nme.NME_flixel_flixel_ui_img_radio_dot_png);
			type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/tab.png", nme.NME_flixel_flixel_ui_img_tab_png);
			type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/img/tab_back.png", nme.NME_flixel_flixel_ui_img_tab_back_png);
			type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("flixel/flixel-ui/xml/default_popup.xml", nme.NME_flixel_flixel_ui_xml_default_popup_xml);
			type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("flixel/flixel-ui/xml/defaults.xml", nme.NME_flixel_flixel_ui_xml_defaults_xml);
			type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}


class NME_data_data_goes_here_txt extends flash.utils.ByteArray { }
class NME_images_images_go_here_txt extends flash.utils.ByteArray { }
class NME_music_music_goes_here_txt extends flash.utils.ByteArray { }
class NME_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
class NME_flixel_img_debugger_buttons_console_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_logdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_statsdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_visualdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_buttons_watchdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_debugger_windowhandle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_logo_haxeflixel_svg extends flash.utils.ByteArray { }
class NME_flixel_img_logo_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_preloader_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_preloader_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_tile_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_tile_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_analog_base_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_analog_thumb_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_down_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_left_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_right_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_img_ui_virtualpad_y_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_snd_beep_wav extends flash.media.Sound { }
class NME_flixel_snd_flixel_wav extends flash.media.Sound { }
class NME_flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray { }
class NME_flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray { }
