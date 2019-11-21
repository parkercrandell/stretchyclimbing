//called from player
h = argument0;


if(h.gripping){
	if(point_distance(x, y, h.x, h.y) >  0){		
		if(max_pull_delay < max_pull_delay_t){
			
			var loosen = 1;
			
			xvel *= 0.985;
			yvel *= 0.985;
			
		}else if (max_pull_delay/2 < max_pull_delay_t){
			
			var loosen = 1;
			
			xvel *= 0.99;
			yvel *= 0.99;
			
		}else {
			var loosen = 1;
		}
		max_pull_delay_t += 1;
		
		var dir = point_direction(x, y, h.x, h.y);
		dir = degtorad(dir);
			
		var spd = tension*loosen*(point_distance(h.x, h.y, h.sx, h.sy));
		
		
		xvel += cos(dir) * spd;
		yvel += sin(dir) * -spd;
		
		var damp_mag = dot_product(cos(dir), -sin(dir), xvel, yvel) ;
		damp_mag *= (point_distance(h.x, h.y, h.sx, h.sy) > max_len && damp_mag < 0) ? .2 : (1-damp);
		xvel -= cos(dir) * damp_mag;
		yvel -= -sin(dir) * damp_mag;
		dir = point_direction(h.sx, h.sy, h.x, h.y);
		dir = degtorad(dir);
			
		if (point_distance(h.x, h.y, h.sx, h.sy) > max_len) {
			des_posx = h.x - cos(dir) * max_len;
			des_posy = h.y + sin(dir) * max_len;
		
			x += (des_posx - h.sx) ;
			y += (des_posy - h.sy) ;
		}
		
	}
	state = h.s;
	if(keyboard_check_released(ord(h.key))){
		max_pull_delay_t = 0;
	
		var dir = vector_angle(player.xvel,player.yvel);
		var spd = vector_magnitude(player.xvel,player.yvel);
	
		//h.xvel += cos(dir) * spd;
		//h.yvel += sin(dir) * -spd;
	}
}
