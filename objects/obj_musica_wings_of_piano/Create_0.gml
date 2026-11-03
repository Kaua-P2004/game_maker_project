
// Carrega as notas do arquivo JSON
json = "";
file = file_text_open_read("wings_of_piano.json");

while(!file_text_eof(file)) {
	json += file_text_readln(file);
}

file_text_close(file);

data = json_parse(json);

// Inicializa os dados
global.game_started = false;

json_pos = 0;
next_time_to_spwan = data[json_pos][$ "time"];
note_speed = data[json_pos][$ "speed"];

// Aguarda um segundo antes de iniciar a música
delay_sec = 1
alarm[0] = delay_sec * room_speed;
current_music_position = -delay_sec;

// Cria filas para armazenar as notas ativas na tela
global.queue_notes_1 = ds_queue_create();
global.queue_notes_2 = ds_queue_create();
global.queue_notes_3 = ds_queue_create();
global.queue_notes_4 = ds_queue_create();
