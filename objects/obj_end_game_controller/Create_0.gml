timer = room_speed * 2;

// sprite
if (global.end_game_result == "victory") {
    current_sprite = spr_winning_screen;
	
	scale_x = 1.012658;
	scale_y = 1;
} else {
    current_sprite = spr_defeat_screen;
	
	scale_x = 1.012658;
	scale_y = 1;
}
