depth = 10;
var rocksize = sprite_get_height(fuck);

for(var j = rocksize/4; j < sprite_height; j += rocksize) {
	for (var i = rocksize/4; i < sprite_width; i += rocksize) {
		instance_create_depth(x-sprite_width/2+i+random_range(-rocksize/2,rocksize/2),y-sprite_height/2+j+random_range(-rocksize/2,rocksize/2),10,fuck);
	}
}