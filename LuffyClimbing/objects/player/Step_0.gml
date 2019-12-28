//standard tracking
camx = x - (view_wport[0] / 2);
camy = y - (view_hport[0]*1.7 / 3);

camera_set_view_pos(view_camera[0],camx,camy);

//uuuhhhh flywretch camera
//var desx = x + xvel * 8 - (view_wport[0]/2);
//var desy = y + yvel * 8 - (view_hport[0]/2);

//var ang_to_des = point_direction(camx, camy, desx, desy);
//var dist_to_des = point_distance(camx, camy, desx, desy);

//camx += cos(degtorad(ang_to_des)) * dist_to_des; //min(cam_spd, dist_to_des);
//camy -= sin(degtorad(ang_to_des)) * dist_to_des; //min(cam_spd, dist_to_des);


camera_set_view_pos(view_camera[0], camx, camy);

if(keyboard_check(ord("P"))){
	room_restart();
}
if(mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) and not winned){
	audio_play_sound(grab,1,false);
	start = true;
}

if(not die){

shoulder_tension(h_left);
shoulder_tension(h_right);

//reactivates player's hands after being stunned
//hand_snapping_tick();

//hop
if((keyboard_check_released(ord(h_left.key)) or keyboard_check_released(ord(h_right.key))) and (h_right.gripping or h_left.gripping) and vector_magnitude(xvel,yvel) > hop_speed_threshold){

	var dir = vector_angle(xvel,yvel)
		
	var spd = hop_speed_burst;
	
	xvel += cos(dir) * spd;
	yvel += sin(dir) * -spd;
}

//animation states
if(h_left.gripping and h_right.gripping and not winned and h_left.gripping and h_right.gripping){
	state = both;
	var dap = damp;
	hold_t += 1;
	if(yvel < 0.5 and xvel < 0.5 and xvel > -0.5 and yvel > -0.5 and hold_t > hold_max){
		//var dap = 0;
	}
}else if(not h_left.gripping and not h_right.gripping and not winned){
	var dap = damp;
	hold_t = 0;
	if(yvel < 10){
		state = neutral;
	}else{
		state = fall;
	}
	
}else if(h_right.gripping){
	state = gright;
}else if(h_left.gripping){
	state = gleft;
}else{
	var dap = damp;
	hold_t = 0;
}

//body speed
xvel = clamp(xvel, -max_spd, max_spd);
yvel = clamp(yvel, -max_spd, max_spd);

//the damp
var dir = vector_angle(xvel,yvel)

xvel -= sign(xvel)*(sqr(xvel))*(quad_damp);
yvel -= sign(yvel)*(sqr(yvel))*(quad_damp);


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

if(start){
//BODY MOVEMENT
	x += xvel;
	y += yvel;
}else{
	xvel = 0;
	yvel = 0;
}

/*for (var i = 0; i < abs(xvel); i++){
	x += sign(xvel);
}

for (var i = 0; i < abs(yvel); i++){
	y += sign(yvel);
}*/

//alive if statement

//Camera
//camera_set_view_pos(view_camera[0],x-(view_wport[0]/2),y-(view_hport[0]/2));
}