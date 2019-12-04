//called from player
h = argument0;


if(h.gripping){
	if(point_distance(x, y, h.x, h.y) >  0){		
		if(max_pull_delay < max_pull_delay_t){
			
			var loosen = 0.6;
			
			xvel *= 0.95;
			yvel *= 0.95;
			
		}else if (max_pull_delay/2 < max_pull_delay_t){
			
			var loosen = 0.8;
			
			xvel *= 0.98;
			yvel *= 0.98;
			
		}else {
			var loosen = 1;
		}
		max_pull_delay_t += 1;
		
		var dir = point_direction(x, y, h.x, h.y);
		dir = degtorad(dir);
			
		var spd = tension*loosen*(point_distance(h.x, h.y, h.sx, h.sy));
		
		
		xvel += cos(dir) * spd;
		yvel += sin(dir) * -spd;
		
		//Snapping TURNED ON CURRENTLY
		if(false && vector_magnitude(xvel,yvel) > snapping_threshold && point_distance(h.x, h.y, h.sx, h.sy) > max_len){			
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
		damp_mag *= (point_distance(h.x, h.y, h.sx, h.sy) > max_len && damp_mag < 0) ? 0.5 : (1-damp);
		
		//add damp to player velocity
		xvel -= cos(dir) * damp_mag;
		yvel -= -sin(dir) * damp_mag;
		//xvel *= .98;
		//yvel *= .98;
		//dir is shoulder to hand
		dir = point_direction(h.sx, h.sy, h.x, h.y);
		dir = degtorad(dir);
			
		//if arm is extended past max len then move it into range
		//the value added is a buffer before I snap stuff back to pos
		var buffer = 50;
		if (point_distance(h.x, h.y, h.sx, h.sy) > max_len+buffer) {
			des_posx = h.x - cos(dir) * (max_len + buffer);
			des_posy = h.y + sin(dir) * (max_len + buffer);
		
			x += (des_posx - h.sx) ;
			y += (des_posy - h.sy) ;
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
		max_pull_delay_t = 0;
	
		var dir = vector_angle(player.xvel,player.yvel);
		var spd = vector_magnitude(player.xvel,player.yvel);
	
		//h.xvel += cos(dir) * spd;
		//h.yvel += sin(dir) * -spd;
	}
}
