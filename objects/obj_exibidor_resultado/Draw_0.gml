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
else
	draw_text(room_width/2, 205, "LUTA CONCLUÍDA");

draw_set_font(fnt_texto_grande);
draw_set_color(make_color_rgb(255, 211, 100));
draw_text(room_width/2, 315, "INIMIGOS DERROTADOS: " + string(global.enemies_defeated));
draw_set_color(make_color_rgb(180, 220, 255));
draw_text(room_width/2, 375, "MAIOR COMBO: " + string(global.max_combo));
draw_set_color(c_white);
if (global.game_over)
	draw_text(room_width/2, 445, "Sua vida chegou a zero.");
else
	draw_text(room_width/2, 445, "Você sobreviveu até o fim da música!");

draw_set_font(fnt_texto);
draw_text(room_width/2, 535, "ENTER - escolher outra música");
draw_text(room_width/2, 575, "ESC - voltar ao menu");
