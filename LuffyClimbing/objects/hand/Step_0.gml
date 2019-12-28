sx = player.x + (s_xoff*side);
sy = player.y

sxd = player.x + (s_xoffd*side);



if(key_check(right) and place_meeting(x,y,cliff) and not player.winned){
	//Gripped
	xvel = 0;
	yvel = 0;
	gripping = true;
}else if(key_check(right) and place_meeting(x,y,goal) and not player.winned){
	//Grabbed Goal
	win();
}else{	
	//HAND MOVEMENT
	if(point_distance(x, y, sx, sy) > player.max_len and not out_of_bounds) {
		//too far movement
		var dir = point_direction(x, y, sx, sy);
		dir = degtorad(dir);
		
		var spd = (player.tension)*(point_distance(x, y, sx, sy));
		
		xvel += cos(dir) * spd;
		yvel += sin(dir) * -spd;

		var damp_mag = dot_product(cos(dir), -sin(dir), xvel, yvel)*.2;
		
		if(damp_mag < 0){
			xvel -= cos(dir) * damp_mag;
			yvel -= -sin(dir) * damp_mag;
		}
		
		des_posx = sx - cos(dir) * player.max_len;
		des_posy = sy + sin(dir) * player.max_len;
		
		x += des_posx - x;
		y += des_posy - y;

		//toggle effect
		//out_of_bounds = true;
		
	}else if(point_distance(x, y, sx, sy) < player.min_len){
		//too close movement
		var dir = point_direction(x, y, sx, sy);
		dir = degtorad(dir);
		
		var spd = (-player.tension)*point_distance(x, y, sx, sy)*0.1;//power(point_distance(x, y, sx, sy),1.2);
		
		xvel += cos(dir) * spd;
		yvel += sin(dir) * -spd;		
	}else{
		//neutral movement
		var dir = point_direction(x, y, sx, sy);
		dir = degtorad(dir);
		
		var spd = (player.tension)*point_distance(x, y, sx, sy);//power(point_distance(x, y, sx, sy),1.2);
		
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

	
