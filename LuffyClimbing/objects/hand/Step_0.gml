sx = player.x + (s_xoff*side);
sy = player.y

sxd = player.x + (s_xoffd*side);

	


if(keyboard_check(ord(key)) and place_meeting(x,y,cliff) and not player.winned){
	//Gripped
	xvel = 0;
	yvel = 0;
	gripping = true;
}else if(keyboard_check(ord(key)) and place_meeting(x,y,goal) and not player.winned){
	//Grabbed Goal
	win();
}else{	
	
	//if(point_distance(x, y, sx, sy) > player.max_len and not out_of_bounds) {
	//	//stretched out relaxed movement
	//	var dir = point_direction(x, y, sx, sy);
	//	dir = degtorad(dir);
		
	//	var spd = (player.tension)*(point_distance(x, y, sx, sy)*3);
		
	//	xvel += cos(dir) * spd;
	//	yvel += sin(dir) * -spd;

	//	//toggle effect
	//	//out_of_bounds = true;
		
	//}else 
	if(point_distance(x, y, sx, sy) > player.max_dist){
		//relaxed movement
		var dir = point_direction(x, y, sx, sy);
		dir = degtorad(dir);
		
		var spd = (player.tension)*power(point_distance(x, y, sx, sy),1.2);
		
		xvel += cos(dir) * spd;
		yvel += sin(dir) * -spd;

		if(point_distance(x, y, sx, sy) < player.max_len){
			out_of_bounds = false;
			//player.tension = player.tension_standard;
		}
	}
			
	xvel *= player.hand_damp;
	yvel *= player.hand_damp;
	
	xvel = clamp(xvel,-player.max_h_vel, player.max_h_vel);
	yvel = clamp(yvel,-player.max_h_vel, player.max_h_vel);
	
	yvel += grav;
	
	
	gripping = false;
}


//HAND MOVEMENT

x += xvel;


y += yvel;

	
