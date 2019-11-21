var or_x = argument0;
var or_y = argument1;
var n_x = argument2;
var n_y = argument3;

var dir = point_direction(n_x, n_y, or_x, or_y);
dir = degtorad(dir);

var spd = tension * (point_distance(n_x, n_y, or_x, or_y)/100);

ret_xvel = cos(dir) * -spd;
ret_yvel = sin(dir) * spd;

t_xvel = cos(dir) * spd;
t_yvel = sin(dir) * -spd;