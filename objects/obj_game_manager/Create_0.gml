
global.judgement_line_y = 680;

global.player_move = "idle";
global.last_action = "Waiting for the next move";
global.player_hp = 100;
global.enemy_hp = 100;

sprite_idle = spr_player_idle;
sprite_jab = spr_player_jab;
sprite_straight = spr_player_straight;
sprite_dodge_left = spr_player_dodge_left;
sprite_dodge_right = spr_player_dodge_right;

key_names = ["A - Jab", "S - Straight", "K - Dodge L", "L - Dodge R"];

global.score = 0;
global.combo = 0;
global.max_combo = 0;

global.note_full_score = 1000000;

if (!variable_global_exists("song_to_play"))
    global.song_to_play = obj_music_wings_of_piano;

instance_create_layer(1, 1, "controller_layer", global.song_to_play);
