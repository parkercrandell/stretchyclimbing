//x = player.x;
//y = player.y;

var xpos = camera_get_view_x(view_camera[0])/(room_width-view_wport[0]);
var ypos =  camera_get_view_y(view_camera[0])/(room_height-view_hport[0]);

x = lerp(0, room_width - sprite_width, xpos);
y = lerp(0, room_height - sprite_height, ypos);

show_debug_message(x);