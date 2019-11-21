//HAND1 Detection
var det = 200;
if(point_distance(mouse_x,mouse_y,h1x,h1y) > det and mouse_check_button(mb_left)){
	 h1_act = true;
}

if(point_distance(mouse_x,mouse_y,h2x,h2y) > det and mouse_check_button(mb_left)){
	 h2_act = true;
}

if(point_distance(mouse_x,mouse_y,f1x,f1y) > det and mouse_check_button(mb_left)){
	 f1_act = true;
}

if(point_distance(mouse_x,mouse_y,f2x,f2y) > det and mouse_check_button(mb_left)){
	 f2_act = true;
}

if(not mouse_check_button(mb_left)){
	h1_act = false;
	h2_act = false;
	f1_act = false;
	f2_act = false;
}
