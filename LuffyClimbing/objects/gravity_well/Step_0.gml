if(point_distance(x,y,player.x,player.y) < range && not shut_down){
	var dir = point_direction(player.x,player.y,x,y);
	dir = degtorad(dir);
	
	var spd = suck_strength;
	
	player.xvel += cos(dir) * spd;
	player.yvel += sin(dir) * -spd;
	
	player.xvel *= 0.98;
	player.yvel *= 0.98;
}
if(point_distance(x,y,player.x,player.y) < 3 && not shut_down){
	if(keyboard_check(ord("E"))){
		player.xvel = 0;
		player.yvel = 0;
		
		player.yvel -= the_pop;
		player.xvel += hori_pop;
		
		shut_down = true;
	}
	if(keyboard_check(ord("W"))){
		player.xvel = 0;
		player.yvel = 0;
		
		player.yvel -= the_pop;
		player.xvel -= hori_pop;
	
		shut_down = true;
	}
}

if(shut_down){
	poop += 1;
	if(poop > 30){
		shut_down = false;
	}
}
