/// @description curve_get_value(path, path_pos, path_max)
/// @function curve_get_value
/// @param  path_curve
/// @param  path_pos
/// @param  path_max
//Get the total number of points on the path
path_point_count = path_get_number(argument0) - 1;
//Work our min/max scale into the path scale
linear_scale = (argument1 / argument2) * path_point_count;
//Determine the minimum point and difference
min_point = floor(linear_scale);
diff = linear_scale - min_point
if(diff > 0){
    //if there was a difference interpolate between this point and the
    //next point by a factor of difference
    cur_point = -path_get_point_y(argument0, min_point);
    next_point = -path_get_point_y(argument0, min_point + 1);
    ret_val = lerp(cur_point, next_point, diff);
}else{
    //otherwise we are bang on a point return the value at the point
    ret_val = -path_get_point_y(argument0, min_point);
}
//return the result for usage in your game.
return ret_val
