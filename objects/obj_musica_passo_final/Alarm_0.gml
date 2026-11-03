/// @description Inicia a contagem regressiva

global.game_music = audio_play_sound(snd_passo_final, 1, false);
audio_sound_gain(global.game_music, 0.7, 0);

global.game_started = true;
