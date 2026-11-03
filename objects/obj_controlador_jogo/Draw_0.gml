
draw_sprite_cover(global.image_to_display, 0, 0, room_width, room_height, 1);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_font(fnt_texto);

draw_set_color(c_white);
draw_text(40, 120, "SUA VIDA");

// Fundo da barra
draw_set_color(make_color_rgb(42, 48, 65));
draw_rectangle(36, 154, 336, 178, false);

// Vida atual
draw_set_color(make_color_rgb(60, 225, 160));
draw_rectangle(36, 154, 36 + 3 * global.player_hp, 178, false);

// Porcentagem
draw_set_color(c_white);
draw_text(346, 151, string(global.player_hp) + "%");
if (global.player_flash > 0) {
	draw_set_alpha(0.35);
	draw_set_color(c_red);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
}

draw_set_halign(fa_center);
draw_set_font(fnt_texto_grande);
draw_set_color(c_white);
draw_text(room_width / 2, 20, global.last_action);
draw_set_font(fnt_texto);
draw_set_color(make_color_rgb(255, 215, 100));
draw_text(room_width / 2, 70, "FASE " + string(global.current_selection + 1) + " / 3");
draw_set_color(c_white);
draw_text(room_width / 2, 115, "SCORE: " + string(global.score));
if (global.combo >= 3) {
	draw_set_color(make_color_rgb(90, 225, 255));
	draw_text(room_width / 2, 145, "COMBO x" + string(global.combo));
}

var enemy_x = 680;
var enemy_base_y = 700;
var enemy_index = global.current_selection;
var enemy_base_sprite = enemy_sprite_ids[enemy_index];
var enemy_sprite = enemy_base_sprite;
if (global.player_move == "dodge_left")
	enemy_sprite = enemy_attack_right_ids[enemy_index];
else if (global.player_move == "dodge_right")
	enemy_sprite = enemy_attack_left_ids[enemy_index];
var enemy_scale = 0.88 * sprite_get_height(enemy_base_sprite) / sprite_get_height(enemy_sprite);
var enemy_tint = c_white;
if (global.enemy_flash > 0)
	enemy_tint = c_yellow;
draw_sprite_ext(enemy_sprite, 0, enemy_x, enemy_base_y, enemy_scale, enemy_scale, 0, enemy_tint, 1);
draw_set_color(c_white);
draw_set_font(fnt_texto);
draw_text(enemy_x, 217, enemy_names[global.current_selection]);
draw_set_color(c_white);
draw_set_color(make_color_rgb(45, 37, 51));
draw_rectangle(enemy_x - 111, 251, enemy_x + 111, 267, false);
draw_set_color(make_color_rgb(255, 85, 105));
draw_rectangle(enemy_x - 111, 251, enemy_x - 111 + 222 * global.enemy_hp / global.enemy_max_hp, 267, false);

draw_set_color(make_color_rgb(255, 255, 255));
draw_line(0, global.judgement_line_y, room_width, global.judgement_line_y);
for (var i = 1; i <= 4; i++) {
	var lane_x = i * 278;
	draw_set_color(make_color_rgb(75, 91, 125));
	draw_rectangle(lane_x - 104, global.judgement_line_y - 10, lane_x + 104, global.judgement_line_y + 5, false);
	draw_set_color(c_white);
	draw_text(lane_x, global.judgement_line_y + 12, key_names[i-1]);
}

var sprite_to_draw = sprite_idle;
var fighter_x = 700;
var fighter_y = 600;

switch (global.player_move) {
    case "jab":
        sprite_to_draw = sprite_jab;
        break;

    case "straight":
        sprite_to_draw = sprite_straight;
        break;

    case "dodge_left":
        sprite_to_draw = sprite_dodge_left;
        fighter_y = 660;
        break;

    case "dodge_right":
        sprite_to_draw = sprite_dodge_right;
        fighter_y = 660;
        break;

    default:
        sprite_to_draw = sprite_idle;
        break;
}

if (sprite_exists(sprite_to_draw)) {
	var fighter_scale = 0.78;
	var idle_origin_x = sprite_get_xoffset(sprite_idle);
	var idle_origin_y = sprite_get_yoffset(sprite_idle);
	var idle_draw_x = fighter_x + (idle_origin_x - sprite_get_width(sprite_idle) / 2) * fighter_scale;
	var idle_draw_y = 600 + (idle_origin_y - sprite_get_height(sprite_idle) / 2) * fighter_scale;
	var idle_center_x = idle_draw_x + ((sprite_get_bbox_left(sprite_idle) + sprite_get_bbox_right(sprite_idle)) / 2 - idle_origin_x) * fighter_scale;
	var idle_bottom_y = idle_draw_y + (sprite_get_bbox_bottom(sprite_idle) - idle_origin_y) * fighter_scale;
	var sprite_origin_x = sprite_get_xoffset(sprite_to_draw);
	var sprite_origin_y = sprite_get_yoffset(sprite_to_draw);
	var sprite_center_x = (sprite_get_bbox_left(sprite_to_draw) + sprite_get_bbox_right(sprite_to_draw)) / 2;
	var sprite_draw_x = idle_center_x - (sprite_center_x - sprite_origin_x) * fighter_scale;
	var sprite_draw_y = idle_bottom_y + fighter_y - 600 + (sprite_origin_y - sprite_get_bbox_bottom(sprite_to_draw)) * fighter_scale;
	draw_sprite_ext(sprite_to_draw, 0, sprite_draw_x, sprite_draw_y, fighter_scale, fighter_scale, 0, c_white, 1);
}
else
    draw_text(fighter_x, fighter_y, "Imagem ausente");

draw_set_halign(fa_left);
draw_set_font(fnt_texto_pequeno);
draw_set_color(make_color_rgb(205, 215, 235));
draw_text(34, room_height - 34, "A / S: atacar   |   K / L: esquivar   |   ENTER: reiniciar   |   ESC: sair");
