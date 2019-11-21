xvel = cos(ang) * 20;
yvel = sin(ang) * -20;

x += xvel;

yvel += grav;

y += yvel;

if(inc){
	image_xscale += shrink_rate*4;
	image_yscale += shrink_rate*4
	if(image_yscale > size){
		inc = false;
	}
}else{

	image_xscale -= shrink_rate;
	image_yscale -= shrink_rate;
	if(image_yscale < min_size){
		instance_destroy();
	}
}
