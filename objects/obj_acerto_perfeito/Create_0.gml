/// @description Insira uma descrição aqui
// Você pode escrever seu código neste editor

col = make_color_rgb(255, 236, 160);
hue = colour_get_hue(col);
sat = colour_get_saturation(col);
val = colour_get_value(col);
image_blend = make_color_hsv(hue,sat,val);
