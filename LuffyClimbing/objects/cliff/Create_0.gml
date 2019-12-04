depth = 10;
var rocksize = sprite_get_height(fuck);
surf = surface_create(abs(sprite_width),abs(sprite_height));
var sprite = 0;
surface_set_target(surf);

//clear surface - just in case
draw_clear_alpha(c_white, 0);

//draw texture
gpu_set_colorwriteenable( true, true, true, false);
    // code here

for(var i = 0; i < abs(sprite_width); i += sprite_get_width(sprite10)){
	for(var j = 0; j < abs(sprite_height); j += sprite_get_height(sprite10)){
		draw_sprite(sprite10, 1, i, j);
	}
}

//activate texture with sprite
gpu_set_colorwriteenable( false, false, false, true );
draw_sprite_ext(fuckoff, 0, 0, 0,image_xscale, image_yscale, 0,c_white,image_alpha);

//use white pixels of sprite to burn texture
gpu_set_colorwriteenable( true, true, true, false );
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(fuckoff, 0, 0, 0,image_xscale, image_yscale, 0,c_white,image_alpha);

//wrap up 
gpu_set_blendmode(bm_normal);
surface_reset_target();
gpu_set_colorwriteenable( true, true, true, true);

//for(var j = rocksize/4; j < sprite_height; j += rocksize) {
//	for (var i = rocksize/4; i < sprite_width; i += rocksize) {
//		instance_create_depth(x-sprite_width/2+i+random_range(-rocksize/2,rocksize/2),y-sprite_height/2+j+random_range(-rocksize/2,rocksize/2),10,fuck);
//	}
//}