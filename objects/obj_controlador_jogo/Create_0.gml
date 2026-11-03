
global.judgement_line_y = 680;

global.player_move = "idle";
global.last_action = "Prepare-se!";
global.player_hp = 100;
global.enemy_hp = 0;
global.enemy_max_hp = 0;
global.enemies_defeated = 0;
global.enemy_flash = 0;
global.player_flash = 0;
global.game_over = false;
global.run_completed = false;
global.phase_cleared = false;
global.score = 0;

sprite_idle = spr_jogador_parado;
sprite_jab = spr_jogador_soco;
sprite_straight = spr_jogador_direto;
sprite_dodge_left = spr_jogador_esquiva_esquerda;
sprite_dodge_right = spr_jogador_esquiva_direita;
enemy_sprite_ids = [spr_inimigo_rival, spr_inimigo_campeao, spr_inimigo_sombra];
enemy_names = ["Rival", "Campeão", "Sombra"];

key_names = ["A - Soco", "S - Direto", "K - Esquiva E", "L - Esquiva D"];

global.combo = 0;
global.max_combo = 0;
if (!variable_global_exists("unlocked_phase"))
    global.unlocked_phase = 0;
if (!variable_global_exists("current_selection"))
    global.current_selection = 0;

if (!variable_global_exists("song_to_play"))
    global.song_to_play = obj_musica_wings_of_piano;

if (!variable_global_exists("image_to_display"))
    global.image_to_display = spr_fundo_wings_of_piano;

instance_create_layer(1, 1, "camada_controladora", global.song_to_play);
