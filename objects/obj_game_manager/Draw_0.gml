
draw_set_halign(fa_left);

draw_rectangle_color(20, 20, 320, 90, c_black, c_black, c_black, c_black, false);
draw_text(40, 30, "HP: " + string(global.player_hp));
draw_text(40, 55, "Enemy HP: " + string(global.enemy_hp));

draw_set_halign(fa_center);
draw_line(0, global.judgement_line_y, room_width, global.judgement_line_y);

draw_set_font(fnt_game_text_lg);
draw_text(room_width / 2, 20, "Action: " + global.last_action);

if (global.combo >= 5)
    draw_text(room_width / 2, 50, "Combo " + string(global.combo));

draw_set_font(fnt_game_text);
draw_text(room_width-100, 10, string_repeat("0", 7-string_length(string(int64(global.score)))) + string(int64(global.score)));

for (var i = 1; i <= 4; i++)
    draw_text(i*278, global.judgement_line_y-40, key_names[i-1]);

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
    draw_sprite_ext(sprite_to_draw, 0, fighter_x, fighter_y, 1, 1, 0, c_white, 1);
else
    draw_text(fighter_x, fighter_y, "Sprite missing");
