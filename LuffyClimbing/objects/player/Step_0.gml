camx = x - (view_wport[0] / 2);
camy = y - (view_hport[0] / 2);

camera_set_view_pos(view_camera[0],camx,camy);

if(keyboard_check(ord("P"))){
	room_restart();
}
if((keyboard_check_pressed(ord("E")) or keyboard_check_pressed(ord("W"))) and not winned){
	audio_play_sound(grab,1,false);
}

if(not die){

shoulderTension(h_left);
shoulderTension(h_right);

//hop
if((keyboard_check_released(ord(h_left.key)) or keyboard_check_released(ord(h_right.key))) and (h_right.gripping or h_left.gripping) and vector_magnitude(xvel,yvel) > hop_speed_threshold){

	var dir = vector_angle(xvel,yvel)
		
	var spd = hop_speed_burst;
	
	xvel += cos(dir) * spd;
	yvel += sin(dir) * -spd;
}

//animation states
if(keyboard_check(ord("E")) and keyboard_check(ord("W"))and not winned and h_left.gripping and h_right.gripping){
	state = both;
	var dap = damp;
	hold_t += 1;
	if(yvel < 0.5 and xvel < 0.5 and xvel > -0.5 and yvel > -0.5 and hold_t > hold_max){
		//var dap = 0;
	}
}else if(not keyboard_check(ord("E")) and not keyboard_check(ord("W")) and not winned){
	var dap = damp;
	hold_t = 0;
	if(yvel < 10){
		state = neutral;
	}else{
		state = fall;
	}
	
}else{
	var dap = damp;
	hold_t = 0;
}

//body speed
xvel = clamp(xvel, -max_spd, max_spd);
yvel = clamp(yvel, -max_spd, max_spd);

//the damp
//xvel *= dap;
//yvel *= dap;


//grav
if(not winned){
	yvel += grav;
}else{
	yvel += grav*2.5;
}


//detect death
if( y > death.y +100){
	die = true;
	with object6{
		off = false;
		state = 1;
	}
	room_restart();
}

//BODY MOVEMENT
x += xvel;
y += yvel;
/*for (var i = 0; i < abs(xvel); i++){
	x += sign(xvel);
}

for (var i = 0; i < abs(yvel); i++){
	y += sign(yvel);
}*/

//alive if statement
}
//Camera
//camera_set_view_pos(view_camera[0],x-(view_wport[0]/2),y-(view_hport[0]/2));
