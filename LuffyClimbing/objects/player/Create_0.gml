//player
p_size = 20;
winned = false;
boost = 50;
die = false;

//Create Hands
h_left = instance_create_depth(x-10,y,0,hand);
with (h_left){
	right = false;	
	allocate_hand();
}

h_right = instance_create_depth(x+10,y,0,hand);
with (h_right){
	right = true;
	allocate_hand();
}

//FACE STATES
state = 0;
neutral = 0;
fall = 1;
right = 2;
left = 3; 
both = 4;

//player values
xvel = 0;
yvel = 0;
accel = 0.1;
max_spd = 400;
jump = 10;

//---------------SHARED VALUES---------------//

//draw
size = 0.7;


//keeping the player still when they hold with both hands
hold_t = 0;
hold_max = 30;

//the hop
hop_speed_threshold = 13;
hop_speed_burst = 0;

//springyness
damp = 0.999;
hand_damp = 0.99;
tension = 0.9;
tension_far = 2;
tension_standard = 0.9;
max_h_vel = 300;

//distances
max_dist = 120;
max_pull_delay = 180;
max_pull_delay_t = 0;

max_len = 300;

//Arm Drawing
arm_thicc = 20;  
armr = 10 * size;

//gravity
grav = 0.55;


active = true;