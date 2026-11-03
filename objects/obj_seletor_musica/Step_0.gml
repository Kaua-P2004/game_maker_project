if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	current_selection = (current_selection + array_length(data) - 1) mod array_length(data);
}

if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	current_selection = (current_selection + 1) mod array_length(data);
}

if (current_selection != global.current_selection) {
	audio_stop_sound(preview_song);
	global.current_selection = current_selection;
	preview_from = data[current_selection][$ "previewFromPos"];
	preview_to = data[current_selection][$ "previewToPos"];
	preview_song = audio_play_sound(id_song_map[current_selection], 10, false);
	audio_sound_set_track_position(preview_song, preview_from);
}

if (audio_is_playing(preview_song) && audio_sound_get_track_position(preview_song) >= preview_to) {
	audio_sound_set_track_position(preview_song, preview_from);
}

if (keyboard_check_pressed(vk_enter)) {
	audio_stop_all();
	global.song_to_play = id_song_obj_map[current_selection];
	global.image_to_display = id_preview_spr_map[current_selection];
	room_goto(rm_jogo);
}

if (keyboard_check_pressed(vk_escape)) {
	audio_stop_all();
	room_goto(rm_tela_inicial);
}
