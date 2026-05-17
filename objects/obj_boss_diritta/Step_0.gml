function start_phase_transition(_phase) {
    phase = _phase;
    phase_transition = true;
    phase_timer = room_speed * 2;
	
    hit_invulnerable = true;
    is_damaged = true;
	
    image_index = 0;

    // cambio sprite versione god
    if (phase == 3) {
		y_speed = -10;
		is_jumping = true;
		
        idle_spr = phase3_idle_spr;
        attack_spr = phase3_attack_spr;
        damage_spr = phase3_damage_spr;
        death_spr = phase3_death_spr;
    }
}

// prende danno
function take_damage(_amount) {
    if (hit_invulnerable || is_dead | phase_transition) exit;

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

// morte
function die() {
    is_dead = true;
    death_timer = room_speed * 2;

    x_speed = 0;
    y_speed = 0;
}

// cambio fase
if (phase == 1 && hp <= 20 && !phase_transition) {
    start_phase_transition(2);
}

if (phase == 2 && hp <= 10 && !phase_transition) {
    start_phase_transition(3);
}

// gestione transizione fase
if (phase_transition) {
    phase_timer--;
    x_speed = 0;

    if (phase_timer <= 0) {
        phase_transition = false;
        hit_invulnerable = false;
        is_damaged = false;
    }
    exit;
}

// gestione attacco
shoot_timer--;

if (shoot_timer <= 0 && !is_dead) {
    is_attacking = true;
    image_index = 0;

    switch (phase) {
        case 1:
            burst_count = 1;
            shoot_timer = room_speed * 2;
        break;
        case 2:
            burst_count = 3;
            shoot_timer = room_speed * 1.5;
        break;
        case 3:
            burst_count = 6;
            shoot_timer = room_speed * 1.5;
        break;
    }

    burst_timer = 0;
}

// gestione stato
if (is_dead) {
	state = "death";
} else if (is_jumping) {
	state = "jump";
} else if (is_damaged) {
    state = "damage";
} else if (is_attacking) {
    state = "attack";
} else {
    state = "idle";
}

// animazioni sprite
switch (state) {
    case "damage":
        sprite_index = damage_spr;
        image_speed = 1;

        if (image_index >= image_number - 1 && damage_time <= 0) {
            is_damaged = false;
        }
    break;
	case "jump":
	    sprite_index = jump_spr;
	    image_speed = 1;
		
		if (image_index >= image_number - 1) {
            image_index = image_number - 1;
            image_speed = 0;
        }
	break;
    case "death":
        sprite_index = death_spr;
        image_speed = 0.5;

        if (image_index >= image_number - 1) {
            image_index = image_number - 1;
            image_speed = 0;
        }
    break;
    case "attack":
        sprite_index = attack_spr;
        image_speed = 1;

        if (image_index >= image_number - 1) {
            is_attacking = false;
        }
    break;
    default:
        sprite_index = idle_spr;
        image_speed = 1;
    break;
}

mask_index = mask_spr;

// gestione morte
if (is_dead) {
	x_speed = 0;
    y_speed = 0;
	
    death_timer--;
	
    sprite_index = death_spr;
    image_speed = 0.5;
	
	if (image_index >= image_number - 1) {
        image_index = image_number - 1;
        image_speed = 0;
    }

    if (death_timer <= 0) {
		global.end_game_result = "victory";
		room_goto(rm_end_game);
        instance_destroy();
    }
    exit;
}

// gestione raffica
if (burst_count > 0) {
    burst_timer--;

    if (burst_timer <= 0) {
        var spawn_x = x + (24 * face);
        var spawn_y = y - 40;

        var _bullet = instance_create_layer(spawn_x, spawn_y, "bullets_layer", obj_boss_bullet);
        _bullet.move_dir = face;

        switch (phase) {
            case 1:
                _bullet.move_speed = 4;
                burst_timer = room_speed * 0.2;
            break;
            case 2:
                _bullet.move_speed = 5;
                burst_timer = room_speed * 0.12;
            break;
            case 3:
                _bullet.move_speed = 7;
                burst_timer = room_speed * 0.06;
            break;
        }
		
        burst_count--;

        if (burst_count <= 0) {
            is_attacking = false;
        }
    }
}

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
	
	if (y_speed > 0) {
        is_jumping = false;
    }

    y_speed = 0;
}

y += y_speed;

// gestione danno
if (hit_invulnerable && !phase_transition) {
    hit_cooldown--;

    if (hit_cooldown <= 0) {
        hit_invulnerable = false;
    }
}

// timer danno
if (is_damaged) {
    damage_time--;

    if (damage_time <= 0) {
        is_damaged = false;
    }
}
