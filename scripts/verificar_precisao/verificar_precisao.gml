
function draw_sprite_cover(_sprite, _x, _y, _width, _height, _alpha) {
	var image_w = sprite_get_width(_sprite);
	var image_h = sprite_get_height(_sprite);
	var scale = max(_width / image_w, _height / image_h);
	var draw_x = _x + _width / 2 + (sprite_get_xoffset(_sprite) - image_w / 2) * scale;
	var draw_y = _y + _height / 2 + (sprite_get_yoffset(_sprite) - image_h / 2) * scale;
	draw_sprite_ext(_sprite, 0, draw_x, draw_y, scale, scale, 0, c_white, _alpha);
}

function draw_sprite_fit(_sprite, _subimage, _x, _y, _width, _height, _alpha) {
	var image_w = sprite_get_width(_sprite);
	var image_h = sprite_get_height(_sprite);
	var scale = min(_width / image_w, _height / image_h);
	var draw_x = _x + _width / 2 + (sprite_get_xoffset(_sprite) - image_w / 2) * scale;
	var draw_y = _y + _height / 2 + (sprite_get_yoffset(_sprite) - image_h / 2) * scale;
	draw_sprite_ext(_sprite, _subimage, draw_x, draw_y, scale, scale, 0, c_white, _alpha);
}

function combat_damage_player(_amount) {
	if (global.game_over || global.run_completed)
		return;

	global.player_hp = max(0, global.player_hp - _amount);
	global.player_flash = 10;

	if (global.player_hp <= 0) {
		global.game_over = true;
		audio_stop_all();
		if (global.song_to_play == obj_musica_desordem)
			video_close();
		room_goto(rm_resultado);
	}
}

function combat_hit_enemy(_amount, _score_amount) {
	if (global.game_over || global.run_completed || global.enemy_hp <= 0)
		return;

	global.enemy_hp = max(0, global.enemy_hp - _amount);
	global.enemy_flash = 8;
	global.combo++;
	global.score += _score_amount * global.combo;
	global.max_combo = max(global.max_combo, global.combo);

	if (global.enemy_hp <= 0) {
		global.enemies_defeated++;
		global.phase_cleared = true;
		global.run_completed = true;
		global.unlocked_phase = max(global.unlocked_phase, min(global.current_selection + 1, 2));
		audio_stop_all();
		if (global.song_to_play == obj_musica_desordem)
			video_close();
		room_goto(rm_resultado);
	}
}

function combat_prepare_enemy(_chart_data) {
	var chart_note_count = 0;
	for (var i = 0; i < array_length(_chart_data); i++)
		chart_note_count += array_length(_chart_data[i][$ "notes"]);

	global.enemy_max_hp = ceil(chart_note_count * 34 * 0.4);
	global.enemy_hp = global.enemy_max_hp;
}

// Verifica a precisão das notas do tipo 1
function verificar_precisao_1(_queue) {
	if (!ds_queue_empty(_queue)) {
		var inst = ds_queue_head(_queue);

		if (inst.type == 1) {
			
			// Verifica a precisão pela distância entre a nota e a linha de julgamento
			if ((global.judgement_line_y - inst.y >= 150 && global.judgement_line_y - inst.y <= 220) || (inst.y - global.judgement_line_y >= 80 && inst.y - global.judgement_line_y <= 100)) {
			
				ds_queue_dequeue(_queue);
				instance_create_layer(inst.x, global.judgement_line_y, "camada_notas", obj_acerto_bom);
				instance_destroy(inst);
				
				combat_hit_enemy(22, 25);
				
				//show_debug_message("BOM");
			
			} else if ((global.judgement_line_y - inst.y >= 0 && global.judgement_line_y - inst.y < 150) || (inst.y - global.judgement_line_y >= 0 && inst.y - global.judgement_line_y < 80)) {
			
				ds_queue_dequeue(_queue);
				instance_create_layer(inst.x, global.judgement_line_y, "camada_notas", obj_acerto_perfeito);
				instance_destroy(inst);
				
				combat_hit_enemy(34, 50);
				
				//show_debug_message("PERFEITO");
			
			
			} else if ((global.judgement_line_y - inst.y > 220 && global.judgement_line_y - inst.y < 300)|| inst.y - global.judgement_line_y > 100) {
			
				ds_queue_dequeue(_queue);
				
				inst.sprite_index = spr_nota_errada;  // para desaparecer gradualmente
				//instance_destroy(inst);
				
				global.combo = 0;
				global.last_action = "ERROU! -" + "12 VIDA";
				combat_damage_player(12);
				
				//show_debug_message("ERROU");
			}

		}
	}
}

// Verifica a precisão das notas do tipo 2
function verificar_precisao_2(_queue) {
	if (!ds_queue_empty(_queue)) {
		var inst = ds_queue_head(_queue);
		
		if (inst.type == 2) {
			
			if ((global.judgement_line_y - inst.y >= 0 && global.judgement_line_y - inst.y < 50) || (inst.y - global.judgement_line_y >= 0 && inst.y - global.judgement_line_y < 50)) {
				ds_queue_dequeue(_queue);
				instance_create_layer(inst.x, global.judgement_line_y, "camada_notas", obj_acerto_perfeito);
				instance_destroy(inst);
				
				combat_hit_enemy(34, 50);
				
				//show_debug_message("SUSTENTADA PERFEITA");
			}
		}
	}
}
