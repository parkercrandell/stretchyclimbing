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
gright = 2;
gleft = 3; 
both = 4;

//camera
cam_spd = 0;
camx = 0;
camy = 0;

//player values
xvel = 0;
yvel = 0;
accel = 0.1;
max_spd = 400;
jump = 10;

start = false;
//---------------SHARED VALUES---------------//

//draw
size = 0.6;


//keeping the player still when they hold with both hands
hold_t = 0;
hold_max = 30;

//the hop
hop_speed_threshold = 13;
hop_speed_burst = 0;

//springyness
damp = 0.98//0.999;
quad_damp = 0.0000002;//0.0000000002;
hand_damp = 0.99;
tension = 0.007;
max_h_vel = 300000;

//distances
max_len = 350;
min_len = 50;

//snapping
snapping_threshold = 1;
snapping_factor = 1;
snapping_max_spd = 90;
snapping_grab_delay = 60;
snapping_grab_delay_t = 1000;
hand_snapped = true;




//Arm Drawing
arm_thicc = 20;  
armr = 15 * size;

//gravity
grav = 0.55;


active = true;