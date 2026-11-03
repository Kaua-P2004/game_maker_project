/// @description Lê os comandos de combate rítmico

if (keyboard_check_pressed(ord("A"))) {
	global.player_move = "jab";
	global.last_action = "Soco";
	verificar_precisao_1(global.queue_notes_1);
}

if (keyboard_check_pressed(ord("S"))) {
	global.player_move = "straight";
	global.last_action = "Direto";
	verificar_precisao_1(global.queue_notes_2);
}

if (keyboard_check_pressed(ord("K"))) {
	global.player_move = "dodge_left";
	global.last_action = "Esquiva à esquerda";
	verificar_precisao_1(global.queue_notes_3);
}

if (keyboard_check_pressed(ord("L"))) {
	global.player_move = "dodge_right";
	global.last_action = "Esquiva à direita";
	verificar_precisao_1(global.queue_notes_4);
}

if (keyboard_check(ord("A"))) {
	verificar_precisao_2(global.queue_notes_1);
}

if (keyboard_check(ord("S"))) {
	verificar_precisao_2(global.queue_notes_2);
}

if (keyboard_check(ord("K"))) {
	verificar_precisao_2(global.queue_notes_3);
}

if (keyboard_check(ord("L"))) {
	verificar_precisao_2(global.queue_notes_4);
}

if (!keyboard_check(ord("A")) && !keyboard_check(ord("S")) && !keyboard_check(ord("K")) && !keyboard_check(ord("L"))) {
	global.player_move = "idle";
	global.last_action = "Aguardando o próximo movimento";
}

if (global.combo > global.max_combo)
    global.max_combo = global.combo;

if (global.enemy_flash > 0)
    global.enemy_flash--;
if (global.player_flash > 0)
    global.player_flash--;

if (keyboard_check_pressed(vk_enter)) {
	audio_stop_all();
	if (global.song_to_play == obj_musica_desordem)
		video_close();
	room_restart();
}

if (keyboard_check_pressed(vk_escape)) {
	audio_stop_all();
	if (global.song_to_play == obj_musica_desordem)
		video_close();
	room_goto(rm_selecao_musica);
}
