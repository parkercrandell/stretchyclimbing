//called from player
h = argument0;


if(h.gripping){
	if(point_distance(x, y, h.x, h.y) >  0){		
		if(max_pull_delay < max_pull_delay_t){
			var loosen = 0.42;
			
			xvel *= 0.99;
			yvel *= 0.99;
		}else if (max_pull_delay/2 < max_pull_delay_t){
			var loosen = 1 - (max_pull_delay_t/60)*0.1;
			xvel *= 0.99;
			yvel *= 0.99;
		}else {
			var loosen = 1;
		}
		max_pull_delay_t += 1;
		
		var dir = point_direction(x, y, h.x, h.y);
		dir = degtorad(dir);
			
		var spd = tension*loosen*(point_distance(h.x, h.y, h.sx, h.sy)/max_dist);
		
		
		xvel += cos(dir) * spd;
		yvel += sin(dir) * -spd;

	}
	state = h.s;
	if(keyboard_check_released(ord(h.key))){
	max_pull_delay_t = 0;
	
	var dir = vector_angle(player.xvel,player.yvel);
	var spd = vector_magnitude(player.xvel,player.yvel)*0.6;
	
	h.xvel += cos(dir) * spd;
	h.yvel += sin(dir) * -spd;
	}
}
