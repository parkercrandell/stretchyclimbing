surf = surface_create(sprite_width,sprite_height);
var sprite = 0;
surface_set_target(surf);

//clear surface - just in case
draw_clear_alpha(c_white, 0);

//draw texture
gpu_set_colorwriteenable( true, true, true, false);
draw_sprite(sprite10, 1, 0, 0);

//activate texture with sprite
gpu_set_colorwriteenable( false, false, false, true );
draw_sprite(fuckoff, sprite,  0, 0);

//use white pixels of sprite to burn texture
gpu_set_colorwriteenable( true, true, true, false );
gpu_set_blendmode(bm_subtract);
draw_sprite(fuckoff, sprite,  0, 0);

//wrap up 
gpu_set_blendmode(bm_normal);
surface_reset_target();
gpu_set_colorwriteenable( true, true, true, true);

//draw result
draw_surface(surf, x, y);

//destroy surface if you don't need it
surface_free(surf);