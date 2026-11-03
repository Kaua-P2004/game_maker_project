
global.tutorial = false;
global.current_selection = 0;

background_song = audio_play_sound(snd_tela_inicial, 10, true);

var layerId = layer_get_id("Fundo");
var backgroundId = layer_background_get_id(layerId);

layer_background_alpha(backgroundId, 1);
