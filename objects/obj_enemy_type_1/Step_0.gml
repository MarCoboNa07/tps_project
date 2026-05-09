// uccisione
function die() {
	is_dead = true;
    death_timer = room_speed * 0.5;
    move_speed = 0;
    y_speed = 0;
    x_speed = 0;
}

// movimento sull'asse x automatico
x_speed = move_dir * move_speed;

// gestine morte
if (is_dead) {
    x_speed = 0;
    y_speed = 0;
	move_speed = 0;
    image_speed = 0;
	
	death_timer--;

    if (death_timer <= 0) {
        instance_destroy();
    }
    exit;
}

// collisione bocchi orizzontale
var _sub_pixel = 0.5;
if (place_meeting(x + x_speed, y, obj_algorithm_block)
	|| place_meeting(x + x_speed, y, obj_backpack_block)
	|| place_meeting(x + x_speed, y, obj_book_block_1)
	|| place_meeting(x + x_speed, y, obj_book_block_2)
	|| place_meeting(x + x_speed, y, obj_book_block_3)
	|| place_meeting(x + x_speed, y, obj_bread_board_block)
	|| place_meeting(x + x_speed, y, obj_desk_block_1) 
	|| place_meeting(x + x_speed, y, obj_desk_block_2)
	|| place_meeting(x + x_speed, y, obj_desk_block_3)
	|| place_meeting(x + x_speed, y, obj_ethernet_cable_block)
	|| place_meeting(x + x_speed, y, obj_pc_block)
	|| place_meeting(x + x_speed, y, obj_rack_block)
	|| place_meeting(x + x_speed, y, obj_sink_block)
	|| place_meeting(x + x_speed, y, obj_switch_block)) {
		
    var _pixel_check = _sub_pixel * sign(x_speed);
    while (!place_meeting(x + _pixel_check, y, obj_algorithm_block) 
		&& !place_meeting(x + _pixel_check, y, obj_backpack_block)
		&& !place_meeting(x + _pixel_check, y, obj_book_block_1)
		&& !place_meeting(x + _pixel_check, y, obj_book_block_2)
		&& !place_meeting(x + _pixel_check, y, obj_book_block_3)
		&& !place_meeting(x + _pixel_check, y, obj_bread_board_block)
		&& !place_meeting(x + _pixel_check, y, obj_desk_block_1) 
		&& !place_meeting(x + _pixel_check, y, obj_desk_block_2)
		&& !place_meeting(x + _pixel_check, y, obj_desk_block_3)
		&& !place_meeting(x + _pixel_check, y, obj_ethernet_cable_block)
		&& !place_meeting(x + _pixel_check, y, obj_pc_block)
		&& !place_meeting(x + _pixel_check, y, obj_rack_block)
		&& !place_meeting(x + _pixel_check, y, obj_sink_block)
		&& !place_meeting(x + _pixel_check, y, obj_switch_block)) {
		x += _pixel_check;
	}

    move_dir *= -1; // cambia direzione
}

// velocità di movimento
x_speed = move_dir * move_speed;
face = move_dir;
x += x_speed;

// gravità
y_speed += grav;

if (y_speed > term_vel) {
    y_speed = term_vel;
}

// collisione blocchi verticale
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

// controllo se il nemico è sopra un blocco
if (y_speed >= 0 && (place_meeting(x, y + 1, obj_algorithm_block) 
	|| place_meeting(x, y + 1, obj_backpack_block)
	|| place_meeting(x, y + 1, obj_book_block_1)
	|| place_meeting(x, y + 1, obj_book_block_2)
	|| place_meeting(x, y + 1, obj_book_block_3)
	|| place_meeting(x, y + 1, obj_bread_board_block)
	|| place_meeting(x, y + 1, obj_desk_block_1) 
	|| place_meeting(x, y + 1, obj_desk_block_2)
	|| place_meeting(x, y + 1, obj_desk_block_3)
	|| place_meeting(x, y + 1, obj_ethernet_cable_block)
	|| place_meeting(x, y + 1, obj_pc_block)
	|| place_meeting(x, y + 1, obj_rack_block)
	|| place_meeting(x, y + 1, obj_sink_block)
	|| place_meeting(x, y + 1, obj_switch_block))) {
		
	on_ground = true;
} else {
	on_ground = false;
}

mask_index = mask_spr;
