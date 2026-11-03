
if (global.game_started)
    current_music_position = audio_sound_get_track_position(global.game_music);
else
    current_music_position += 1 / room_speed;

// Cria as notas
if (json_pos >= 0 && next_time_to_spwan - current_music_position <= global.judgement_line_y / note_speed / room_speed) {
	
	for (var i = 0; i < array_length(data[json_pos][$ "notes"]); i++) {
		note_pos = data[json_pos][$ "notes"][i][$ "pos"] * 278;
		
		if (data[json_pos][$ "notes"][i][$ "type"] == 1) {
			inst = instance_create_layer(note_pos, 0, "camada_notas", obj_nota);
		} else if (data[json_pos][$ "notes"][i][$ "type"] == 2) {
			inst = instance_create_layer(note_pos, 0, "camada_notas", obj_nota_sustentada);
		}
		
		inst.pos = data[json_pos][$ "notes"][i][$ "pos"];
		with (inst) {
			vspeed = other.note_speed;
		}
		
		// Adiciona à fila
		switch (data[json_pos][$ "notes"][i][$ "pos"]) {
			case 1:
			ds_queue_enqueue(global.queue_notes_1, inst);
			break;
			
			case 2:
			ds_queue_enqueue(global.queue_notes_2, inst);
			break;
			
			case 3:
			ds_queue_enqueue(global.queue_notes_3, inst);
			break;
			
			case 4:
			ds_queue_enqueue(global.queue_notes_4, inst);
		}
	}
	
	// Encontra a próxima nota a processar
	json_pos++;
	
	if (array_length(data) > json_pos) {
		next_time_to_spwan = data[json_pos][$ "time"];
		note_speed = data[json_pos][$ "speed"];
	} else {
		// Encerra o processamento do JSON
		json_pos = -1;
	}
}

// A reprodução terminou
if (global.game_started && !audio_is_playing(global.game_music)) {
	video_close();
	global.image_to_display = spr_fundo_passo_final;
	global.run_completed = true;
	room_goto(rm_resultado);
}
