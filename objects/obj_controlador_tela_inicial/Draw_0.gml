draw_set_halign(fa_center);
draw_set_font(fnt_titulo);

var ui_x = room_width * 0.72;
var ui_y = room_height / 2;
var button_width = min(440, room_width * 0.38);

draw_set_color(c_white);
draw_text(ui_x, ui_y - 125, "Punch n'beat");

draw_set_font(fnt_texto);
draw_set_color(make_color_rgb(180, 220, 255));
draw_text(ui_x, ui_y - 55, "LUTE NO RITMO. SOBREVIVA À LUTA.");

draw_set_color(make_color_rgb(20, 24, 42));
draw_roundrect(ui_x - button_width / 2, ui_y + 15, ui_x + button_width / 2, ui_y + 95, false);
draw_set_color(c_white);
draw_text(ui_x, ui_y + 38, "ENTER  -  COMEÇAR");
draw_set_font(fnt_texto_pequeno);
draw_set_color(make_color_rgb(210, 210, 225));
draw_text(ui_x, ui_y + 125, "A / S: socos     K / L: esquivas");
