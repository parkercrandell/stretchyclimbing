//called from player
h = argument0;


if(h.gripping){
	var doop = damp;
	if(true){		
		if(h.max_pull_delay < h.max_pull_delay_t){
			//full time
			var loosen = 0.9;
			xvel *= 0.99;
			
		}else if (h.max_pull_delay/2 < h.max_pull_delay_t){
			//half time
			var loosen = 1;

		}else {
			//no time
			var dir = point_direction(x, y, h.x, h.y);
			var rree = 25;
			if(dir > 90 - rree and dir < 90 + rree ){
				var loosen = 1.5;
			}else{
				loosen = 1;
			}
		}
		h.max_pull_delay_t += 1;
		show_debug_message(h.max_pull_delay_t);
		//+(h.s_xoffd*h.side)
		var dir = point_direction(x, y, h.x, h.y);
		dir = degtorad(dir);
			
		var spd = tension*loosen*(point_distance(h.x, h.y, x, y));
		
		
		xvel += cos(dir) * spd;
		yvel += sin(dir) * -spd;
		
		//Snapping TURNED OFF CURRENTLY
		if(false && vector_magnitude(xvel,yvel) > snapping_threshold && point_distance(h.x, h.y, x, y) > max_len){			
			hand_snapping_start();
			
			var snap_dir = point_direction(x,y, h.x, h.y);
			snap_dir = degtorad(snap_dir);
			var snap_spd = vector_magnitude(xvel,yvel)*snapping_factor*2;
		}else{
			var snap_dir = 0;
			var snap_spd = 0;
		}
		
		//dir is player to hand
		var dir = point_direction(x, y, h.x, h.y);
		dir = degtorad(dir);
		
		//damp_mag is finding the overlap between the player vector and the hand pulling vector (normalized)
		var damp_mag = dot_product(cos(dir), -sin(dir), xvel, yvel);
		
		//if the player vect is going against the pull vect and the arm is extended past the max len then 
		//add a really hard damp otherwise use your passive damp
		//0 is off  1 is like a rod
		damp_mag *= (point_distance(h.x, h.y, x, y) > max_len && damp_mag < 0) ? 0.5 : (1-doop);
		
		//add damp to player velocity
		xvel -= cos(dir) * damp_mag;
		yvel -= -sin(dir) * damp_mag;
		//xvel *= .98;
		//yvel *= .98;
		//dir is player to hand
		dir = point_direction(x, y, h.x, h.y);
		dir = degtorad(dir);
			
		//if arm is extended past max len then move it into range
		//the value added is a buffer before I snap stuff back to pos
		var buffer = h.s_xoff;
		if (point_distance(h.x, h.y, x, y) > max_len+buffer) {
			des_posx = h.x - cos(dir) * (max_len + buffer);
			des_posy = h.y + sin(dir) * (max_len + buffer);
		
			x += (des_posx - x) ;
			y += (des_posy - y) ;
			if(hand_snapped){
				xvel += cos(snap_dir) * snap_spd;
				yvel += -sin(snap_dir) * snap_spd;
				
				//xvel *= -snapping_factor;
				//yvel *= -snapping_factor;
			}
		}
		
	}
	state = h.s;
	if(keyboard_check_released(ord(h.key))){
		//adds player velocity to hand after release TURNED OFF
		h.max_pull_delay_t = 0;
		var dir = vector_angle(player.xvel,player.yvel);
		var spd = vector_magnitude(player.xvel,player.yvel);
	
		//h.xvel += cos(dir) * spd;
		//h.yvel += sin(dir) * -spd;
	}
}else{
	h.max_pull_delay_t = 0;
}
