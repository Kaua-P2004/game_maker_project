/// @description Insira uma descrição aqui
// Você pode escrever seu código neste editor

col = make_color_rgb(180, 225, 255);
hue = colour_get_hue(col);
sat = colour_get_saturation(col);
val = colour_get_value(col);
image_blend = make_color_hsv(hue,sat,val);
