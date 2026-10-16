/// @description fight rhythm input listener

if (keyboard_check_pressed(ord("A"))) {
	global.player_move = "jab";
	global.last_action = "Jab";
	check_accuracy_1(global.queue_notes_1);
}

if (keyboard_check_pressed(ord("S"))) {
	global.player_move = "straight";
	global.last_action = "Straight";
	check_accuracy_1(global.queue_notes_2);
}

if (keyboard_check_pressed(ord("K"))) {
	global.player_move = "dodge_left";
	global.last_action = "Dodge left";
	check_accuracy_1(global.queue_notes_3);
}

if (keyboard_check_pressed(ord("L"))) {
	global.player_move = "dodge_right";
	global.last_action = "Dodge right";
	check_accuracy_1(global.queue_notes_4);
}

if (keyboard_check(ord("A"))) {
	check_accuracy_2(global.queue_notes_1);
}

if (keyboard_check(ord("S"))) {
	check_accuracy_2(global.queue_notes_2);
}

if (keyboard_check(ord("K"))) {
	check_accuracy_2(global.queue_notes_3);
}

if (keyboard_check(ord("L"))) {
	check_accuracy_2(global.queue_notes_4);
}

if (!keyboard_check(ord("A")) && !keyboard_check(ord("S")) && !keyboard_check(ord("K")) && !keyboard_check(ord("L"))) {
	global.player_move = "idle";
	global.last_action = "Waiting for the next move";
}

if (global.combo > global.max_combo)
    global.max_combo = global.combo;

if (keyboard_check_pressed(vk_enter)) {
	room_restart();
}

if (keyboard_check_pressed(vk_escape)) {
	audio_stop_all();
	room_goto(rm_game);
}
