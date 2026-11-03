/// @description Desenha a imagem de fundo

draw_set_alpha(0.35);

var video_data = video_draw();

var status = video_data[0];
if (status == 0) {
	var surf = video_data[1];
	draw_surface_stretched(surf, 0, 0, room_width, room_height);
}

if (!video_started_play) {
	video_pause();
	draw_sprite_cover(spr_fundo_desordem, 0, 0, room_width, room_height, 1);
}

draw_set_alpha(1);
