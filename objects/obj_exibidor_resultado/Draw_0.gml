draw_sprite_cover(global.image_to_display, 0, 0, room_width, room_height, 0.2);
draw_set_halign(fa_center);
draw_set_alpha(0.82);
draw_set_color(c_black);
draw_roundrect(room_width/2 - 360, 140, room_width/2 + 360, 625, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_titulo);
if (global.game_over)
	draw_text(room_width/2, 205, "FIM DE JOGO");
else if (global.phase_cleared)
	draw_text(room_width/2, 205, "FASE CONCLUÍDA");
else
	draw_text(room_width/2, 205, "FASE NÃO CONCLUÍDA");

draw_set_font(fnt_texto_grande);
draw_set_color(make_color_rgb(255, 211, 100));
draw_text(room_width/2, 315, "SCORE: " + string(global.score));
draw_set_color(make_color_rgb(180, 220, 255));
draw_text(room_width/2, 375, "MAIOR COMBO: " + string(global.max_combo));
draw_set_color(c_white);
if (global.game_over)
	draw_text(room_width/2, 445, "Sua vida chegou a zero.");
else if (global.phase_cleared && global.current_selection < 2)
	draw_text(room_width/2, 445, "A próxima fase foi liberada!");
else if (global.phase_cleared)
	draw_text(room_width/2, 445, "Você concluiu todas as fases!");
else
	draw_text(room_width/2, 445, "Derrote o inimigo para liberar a próxima fase.");

draw_set_font(fnt_texto);
draw_text(room_width/2, 535, "ENTER - tentar esta fase ou escolher outra");
draw_text(room_width/2, 575, "ESC - voltar ao menu");
