/// @description Lê os dados das músicas do arquivo JSON

json = "";
file = file_text_open_read("songs.json");

while(!file_text_eof(file)) {
	json += file_text_readln(file);
}

file_text_close(file);

data = json_parse(json);

// Relaciona os identificadores aos recursos
id_song_map = [
  snd_wings_of_piano,
  snd_passo_final,
  snd_desordem
];

id_preview_spr_map = [
  spr_fundo_wings_of_piano,
  spr_fundo_passo_final,
  spr_fundo_desordem
];

id_song_obj_map = [
  obj_musica_wings_of_piano,
  obj_musica_passo_final,
  obj_musica_desordem
];

if (!variable_global_exists("current_selection"))
  global.current_selection = 0;

current_selection = global.current_selection;

preview_from = data[current_selection][$ "previewFromPos"];
preview_to = data[current_selection][$ "previewToPos"];

preview_song = audio_play_sound(id_song_map[current_selection], 10, false);
audio_sound_set_track_position(preview_song, preview_from);
