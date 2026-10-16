/// @description legacy selector kept in case old rooms or tutorials are still used

if (keyboard_check_pressed(vk_enter)) {
	audio_stop_all();
	room_goto(rm_game);
}
