// gravità
y_speed += grav;

if (y_speed > term_vel) {
	y_speed = term_vel;
}

// collisione blocchi verticale
var _sub_pixel = 0.5;

if (place_meeting(x, y + y_speed, obj_algorithm_block) 
	|| place_meeting(x, y + y_speed, obj_backpack_block)
	|| place_meeting(x, y + y_speed, obj_book_block_1)
	|| place_meeting(x, y + y_speed, obj_book_block_2)
	|| place_meeting(x, y + y_speed, obj_book_block_3)
	|| place_meeting(x, y + y_speed, obj_bread_board_block)
	|| place_meeting(x, y + y_speed, obj_desk_block_1) 
	|| place_meeting(x, y + y_speed, obj_desk_block_2)
	|| place_meeting(x, y + y_speed, obj_desk_block_3)
	|| place_meeting(x, y + y_speed, obj_ethernet_cable_block)
	|| place_meeting(x, y + y_speed, obj_pc_block)
	|| place_meeting(x, y + y_speed, obj_rack_block)
	|| place_meeting(x, y + y_speed, obj_sink_block)
	|| place_meeting(x, y + y_speed, obj_switch_block)) {
		
    var _pixel_check = _sub_pixel * sign(y_speed);
    while (!place_meeting(x, y + _pixel_check, obj_algorithm_block) 
		&& !place_meeting(x, y + _pixel_check, obj_backpack_block)
		&& !place_meeting(x, y + _pixel_check, obj_book_block_1)
		&& !place_meeting(x, y + _pixel_check, obj_book_block_2)
		&& !place_meeting(x, y + _pixel_check, obj_book_block_3)
		&& !place_meeting(x, y + _pixel_check, obj_bread_board_block)
		&& !place_meeting(x, y + _pixel_check, obj_desk_block_1) 
		&& !place_meeting(x, y + _pixel_check, obj_desk_block_2)
		&& !place_meeting(x, y + _pixel_check, obj_desk_block_3)
		&& !place_meeting(x, y + _pixel_check, obj_ethernet_cable_block)
		&& !place_meeting(x, y + _pixel_check, obj_pc_block)
		&& !place_meeting(x, y + _pixel_check, obj_rack_block)
		&& !place_meeting(x, y + _pixel_check, obj_sink_block)
		&& !place_meeting(x, y + _pixel_check, obj_switch_block)) {
		y += _pixel_check;
	}
	
    y_speed = 0;
}

y += y_speed;

// collisione con player: il player guadagna una vita
if (!is_used && place_meeting(x, y, obj_player)) {
    var _player = instance_place(x, y, obj_player);

    if (_player != noone) {
        if (_player.n_lives < 3) { // aggiunge vita solo se minore di 3
            _player.n_lives += 1;
            global.player_lives = _player.n_lives;

            is_used = true;
			
            sprite_index = happy_spr;
            image_index = 0;
            image_speed = 1;
        }
    }
}


// gestione animazione
if (is_used && !is_disappearing) {
    if (image_index >= image_number - 1) {
        image_index = image_number - 1;
        image_speed = 0;

        is_disappearing = true;
        disappear_timer = room_speed * 2;
    }
}

// gestione scomparsa
if (is_disappearing) {
    disappear_timer--;
	
    if (disappear_timer <= 0) {
        instance_destroy();
    }
}
