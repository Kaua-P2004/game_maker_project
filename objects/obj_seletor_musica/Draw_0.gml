
draw_sprite_cover(id_preview_spr_map[current_selection], 0, 0, room_width, room_height, 0.2);

draw_set_font(fnt_nome_musica);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(80, 95, "ESCOLHA SUA MÚSICA");
draw_set_font(fnt_texto_pequeno);
draw_set_color(make_color_rgb(185, 205, 230));
draw_text(80, 145, "CIMA / BAIXO para escolher   -   ENTER para lutar");
draw_text(80, 170, "Derrote o inimigo para liberar a próxima fase");

for (var i = 0; i < array_length(data); i++) {
	var row_y = 275 + 72 * i;
	if (current_selection == i) {
		draw_set_color(make_color_rgb(20, 28, 48));
		draw_roundrect(65, row_y - 10, 530, row_y + 54, false);
		draw_set_color(make_color_rgb(70, 220, 255));
		draw_sprite(spr_seta_direita, 0, 82, row_y + 12);
	}

	draw_set_color(c_white);
	draw_text(150, row_y, data[i][$ "name"]);
	if (i <= global.unlocked_phase) {
		draw_set_color(make_color_rgb(190, 200, 220));
		draw_text(150, row_y + 30, data[i][$ "composer"] + "   |   NÍVEL " + string(data[i][$ "level"]));
	} else {
		draw_set_color(make_color_rgb(120, 130, 150));
		draw_text(150, row_y + 30, "BLOQUEADA");
	}
}

draw_set_color(c_white);
draw_set_color(make_color_rgb(12, 16, 29));
draw_rectangle(650, 200, 1270, 588, false);
draw_sprite_fit(id_preview_spr_map[current_selection], 0, 650, 200, 620, 388, 1);
draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(650, 535, 1270, 588, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_font(fnt_texto);
draw_text(960, 548, "ESC para voltar ao menu");
