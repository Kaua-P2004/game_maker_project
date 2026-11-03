
draw_sprite_cover(global.image_to_display, 0, 0, room_width, room_height, 1);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_font(fnt_texto);
draw_set_color(c_white);
draw_text(36, 24, "SUA VIDA");
draw_set_color(make_color_rgb(42, 48, 65));
draw_rectangle(36, 54, 336, 78, false);
draw_set_color(make_color_rgb(60, 225, 160));
draw_rectangle(36, 54, 36 + 3 * global.player_hp, 78, false);
draw_set_color(c_white);
draw_text(346, 51, string(global.player_hp) + "%");
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
draw_text(room_width / 2, 60, "INIMIGOS DERROTADOS: " + string(global.enemies_defeated));
if (global.combo >= 3) {
	draw_set_color(make_color_rgb(90, 225, 255));
	draw_text(room_width / 2, 91, "COMBO x" + string(global.combo));
}

var enemy_x = 1080;
var enemy_base_y = 505;
var enemy_sprite = enemy_sprite_ids[global.enemy_variant mod array_length(enemy_sprite_ids)];
var enemy_tint = c_white;
if (global.enemy_flash > 0)
	enemy_tint = c_yellow;
draw_sprite_ext(enemy_sprite, 0, enemy_x, enemy_base_y, 0.88, 0.88, 0, enemy_tint, 1);
draw_set_color(c_white);
draw_set_font(fnt_texto);
draw_text(enemy_x, 67, "OPONENTE " + string(global.enemy_variant + 1));
draw_set_color(c_white);
draw_set_color(make_color_rgb(45, 37, 51));
draw_rectangle(enemy_x - 111, 101, enemy_x + 111, 117, false);
draw_set_color(make_color_rgb(255, 85, 105));
draw_rectangle(enemy_x - 111, 101, enemy_x - 111 + 222 * global.enemy_hp / global.enemy_max_hp, 117, false);

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
var fighter_x = 200;
var fighter_y = 500;

switch (global.player_move) {
    case "jab":
        sprite_to_draw = sprite_jab;
        break;
    case "straight":
        sprite_to_draw = sprite_straight;
        break;
    case "dodge_left":
        sprite_to_draw = sprite_dodge_left;
        break;
    case "dodge_right":
        sprite_to_draw = sprite_dodge_right;
        break;
    default:
        sprite_to_draw = sprite_idle;
        break;
}

if (sprite_exists(sprite_to_draw))
    draw_sprite_ext(sprite_to_draw, 0, fighter_x, fighter_y, 0.78, 0.78, 0, c_white, 1);
else
    draw_text(fighter_x, fighter_y, "Imagem ausente");

draw_set_halign(fa_left);
draw_set_font(fnt_texto_pequeno);
draw_set_color(make_color_rgb(205, 215, 235));
draw_text(34, room_height - 34, "A / S: atacar   |   K / L: esquivar   |   ENTER: reiniciar   |   ESC: sair");
