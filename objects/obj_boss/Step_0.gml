// prende danno
function take_damage(_amount) {
    if (hit_invulnerable) exit;

    hp -= _amount;
    hit_invulnerable = true;
    hit_cooldown = room_speed;

    is_damaged = true;
    damage_time = room_speed * 0.5;
	image_index = 0;

    if (hp <= 0) {
        die();
    }
}

// muore
function die() {
    is_dead = true;
    death_timer = room_speed * 2;
	
    move_speed = 0;
    x_speed = 0;
    y_speed = 0;
}

// movimento sull'asse x automatico
x_speed = move_dir * move_speed;

// gestione stato
if (is_dead) {
    state = "death";
} else if (is_damaged) {
    state = "damage";
} else if (is_attacking) {
    state = "attack";
} else if (abs(x_speed) > 0) {
    state = "walk";
} else {
    state = "idle";
}

// animazione sprite
switch (state) {
    case "damage": // subisce danno
        sprite_index = damage_spr;
        image_speed = 1;

        if (image_index >= image_number - 1 && damage_time <= 0) {
	        is_damaged = false;
	    }
    break;
    case "death": // morte
        sprite_index = death_spr;
        image_speed = 0.5;
		
		if (image_index >= image_number - 1) {
            image_index = image_number - 1;
            image_speed = 0;
        }
    break;
    case "walk": // cammina
        sprite_index = walk_spr;
        image_speed = 1;
    break;
	case "attack": // attacco
    sprite_index = attack_spr;
    image_speed = 1;

    if (image_index >= image_number - 1) {
        is_attacking = false;
    }
break;
    default: // idle
        sprite_index = idle_spr;
        image_speed = 1;
    break;
}

mask_index = mask_spr; // imposta la maschera di collisione dello spirte idle

// gestine morte
if (is_dead) {
    x_speed = 0;
    y_speed = 0;
	move_speed = 0;
	
	death_timer--;
	
	sprite_index = death_spr;
    image_speed = 0.5;
	if (image_index >= image_number - 1) {
        image_index = image_number - 1;
        image_speed = 0;
    }

    if (death_timer <= 0) {
		if (room == rm_level_1) {
            room_goto(rm_level_2);
        } else if (room == rm_level_2) {
            room_goto(rm_level_3);
        } else if (room == rm_level_3) {
            room_goto(rm_level_4);
        } else if (room == rm_level_4) {
            room_goto(rm_level_5);
        }
		
        instance_destroy();
    }
    exit;
}

var _sub_pixel = 0.5;

// collisione blocchi orizzontale
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

// gestione danno
if (hit_invulnerable) {
    hit_cooldown--;

    if (hit_cooldown <= 0) {
        hit_invulnerable = false;
    }
}

if (is_damaged) {
    damage_time--;

    if (damage_time <= 0) {
        is_damaged = false;
    }
}

// timer sparo
shoot_timer--;

if (shoot_timer <= 0 && !is_dead) {
	is_attacking = true;
    attack_time = room_speed * 0.5;
	
    var spawn_x = x + (24 * face);
    var spawn_y = y - 40;

    if (!place_meeting(spawn_x, spawn_y, obj_algorithm_block)
		&& !place_meeting(spawn_x, spawn_y, obj_backpack_block)
		&& !place_meeting(spawn_x, spawn_y, obj_book_block_1)
		&& !place_meeting(spawn_x, spawn_y, obj_book_block_2)
		&& !place_meeting(spawn_x, spawn_y, obj_book_block_3)
		&& !place_meeting(spawn_x, spawn_y, obj_bread_board_block)
		&& !place_meeting(spawn_x, spawn_y, obj_desk_block_1)
		&& !place_meeting(spawn_x, spawn_y, obj_desk_block_2)
		&& !place_meeting(spawn_x, spawn_y, obj_desk_block_3)
		&& !place_meeting(spawn_x, spawn_y, obj_ethernet_cable_block)
		&& !place_meeting(spawn_x, spawn_y, obj_pc_block)
		&& !place_meeting(spawn_x, spawn_y, obj_rack_block)
		&& !place_meeting(spawn_x, spawn_y, obj_sink_block)
		&& !place_meeting(spawn_x, spawn_y, obj_switch_block)) {
			
        var _bullet = instance_create_layer(spawn_x, spawn_y, "bullets_layer", obj_boss_bullet);
		
        _bullet.move_dir = face;
        _bullet.move_speed = 4;
    }

    shoot_timer = room_speed * 2;
}
 