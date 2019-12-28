//bod part update
image_xscale = size;
image_yscale = size;

if not start {
	draw_sprite_ext(sunset24,state,x,y+200+200,2,2,0,c_white,1);
	draw_sprite_ext(fuckofftoplay23,state,x,y,1,1,0,c_white,1);
}
draw_sprite_ext(head,state,x,y-5,0.5*player.size,0.5*player.size,0,c_white,1);

