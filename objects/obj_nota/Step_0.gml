/// @description Desaparece gradualmente quando a nota é errada

if (sprite_index == spr_nota_errada) {
	image_alpha -= 0.1;
	if (image_alpha <= 0)
		instance_destroy();
}
