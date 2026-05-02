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

var _sub_pixel = 0.5;

// collisioni orizzontali
if (place_meeting(x + x_speed, y, obj_desk_block_1) 
	|| place_meeting(x + x_speed, y, obj_book_block_1)
	|| place_meeting(x + x_speed, y, obj_book_block_2)
	|| place_meeting(x + x_speed, y, obj_book_block_3)) {
    var _pixel_check = _sub_pixel * sign(x_speed);
    
    while (!place_meeting(x + _pixel_check, y, obj_desk_block_1)
	    && !place_meeting(x + _pixel_check, y, obj_book_block_1)
	    && !place_meeting(x + _pixel_check, y, obj_book_block_2)
	    && !place_meeting(x + _pixel_check, y, obj_book_block_3)) {
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

// collisioni verticali
if (place_meeting(x, y + y_speed, obj_desk_block_1) 
	|| place_meeting(x, y + y_speed, obj_book_block_1)
	|| place_meeting(x, y + y_speed, obj_book_block_2)
	|| place_meeting(x, y + y_speed, obj_book_block_3)) {
    var _pixel_check = _sub_pixel * sign(y_speed);
    
    while (!place_meeting(x, y + _pixel_check, obj_desk_block_1)
	    && !place_meeting(x, y + _pixel_check, obj_book_block_1)
	    && !place_meeting(x, y + _pixel_check, obj_book_block_2)
	    && !place_meeting(x, y + _pixel_check, obj_book_block_3)) {
        y += _pixel_check;
    }

    y_speed = 0;
}

y += y_speed;

// animazione sprite
if (is_damaged) {
	sprite_index = damage_spr;
	image_speed = 0;
} else if abs(x_speed) > 0 { // camminata
	sprite_index = walk_spr; 
	image_speed = 1;
} else { // fermo
	sprite_index = idle_spr;
	image_speed = 1;
}

mask_index = mask_spr; // imposta la maschera di collisione dello spirte idle