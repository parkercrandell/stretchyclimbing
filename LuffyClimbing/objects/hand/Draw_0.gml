image_xscale = player.size;
image_yscale = player.size;

var dir = point_direction(x, y, sxd, sy);
dir = degtorad(dir);
var dist = point_distance(x, y, sxd, sy);

if(point_distance(x, y, sx, sy) < player.max_len){
	draw_set_color(c_white);
} else {
	draw_set_color(c_red)
}

for(var i = 0; i < player.arm_thicc; i++){
	draw_circle(sxd-cos(dir)*dist*(i/player.arm_thicc),sy+sin(dir) *dist*(i/player.arm_thicc),player.armr,false);
}

draw_set_color(c_white);

var dir = point_direction(sxd, sy, x, y);

if(gripping){
	draw_sprite_ext(spr,2,x,y,0.7*player.size,0.7*player.size,dir-90,c_white,1);
}else{
	draw_sprite_ext(spr,1,x,y,0.7*player.size,0.7*player.size,dir-90,c_white,1);
}