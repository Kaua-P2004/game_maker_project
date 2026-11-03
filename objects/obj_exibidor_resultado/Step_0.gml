
if (keyboard_check_pressed(vk_enter)) {
	audio_stop_sound(background_song);
	global.current_selection = 0;
	room_goto(rm_selecao_musica);
}

if (keyboard_check_pressed(vk_escape)) {
	audio_stop_sound(background_song);
	room_goto(rm_tela_inicial);
}
