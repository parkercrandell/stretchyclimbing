var left_keys = [ord("Q"),ord("W"),ord("E"),ord("R"),ord("T"),ord("A"),ord("S"),ord("D"),ord("F"),ord("G"),ord("Z"),ord("X"),ord("C"),ord("V"),ord("B")];
var right_keys = [ord("Y"),ord("U"),ord("I"),ord("O"),ord("P"),ord("H"),ord("J"),ord("K"),ord("L"),ord("N"),ord("M")];
var right1 = argument0;

if(right1){
	if(mouse_check_button(mb_right)){
		return true;
	}else{
		for (var i = 0; i < array_length_1d(right_keys)-1; ++i) {
		    if(keyboard_check(right_keys[i])){
				return true;
				break;
			}
		}
		return false;
	}
}else{
	if(mouse_check_button(mb_left)){
		return true;
	}else{
		for (var i = 0; i < array_length_1d(left_keys)-1; ++i) {
		    if(keyboard_check(left_keys[i])){
				return true;
				break;
			}
		}
		return false;
	}
}
