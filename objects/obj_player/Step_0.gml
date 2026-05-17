// verifica se il gioco è in pausa
if (obj_pause_controller.paused) {
	exit;
}

// input
get_controls();

// gestione morte
if (is_dead) {
    death_timer--;

    sprite_index = death_spr;
    image_speed = 0.5;

    // blocca movimento
    x_speed = 0;
    y_speed = 0;
	
	if (image_index >= image_number - 1) {
        image_index = image_number - 1;
        image_speed = 0;
    }

    if (death_timer <= 0) {
        global.player_lives = 3;
		global.end_game_result = "defeat";
        room_goto(rm_end_game);
    }
    exit;
}

// blocca movimento se subisce danno
if (is_damaged) {
	move_dir = 0;
	x_speed = 0;
}

// direzione sull'asse x
move_dir = right_key - left_key;

// verifica se il personaggio si sta muovento
if (move_dir != 0) {
	face = move_dir; // cambia la direzione in cui guarda il personaggio
}

x_speed = move_dir * move_speed; // calcola la velocità

// collisione blocchi orizzontale
var _sub_pixel = 0.5
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
		
	var _pixel_check = _sub_pixel * sign(x_speed)
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
	
	x_speed = 0; // imposta la velocità a 0 per far collidere il player con il blocco
}

x += x_speed; // movimento 

// movimento sull'asse y
y_speed += grav;

// salto
if (jump_key_pressed && on_ground) {
	y_speed = jump_speed;
}

// regola la velocità di caduta se è troppo alta
if (y_speed > term_vel) {
	y_speed = term_vel;
}

// collisioni blocchi verticale
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
		
	var _pixel_check = _sub_pixel * sign(y_speed)
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
	
	y_speed = 0; // imposta la velocità a 0 per far collidere il player con il blocco
}

// verifica se il player è sopra un blocco
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

y += y_speed; // movimento sull'asse y

// collisione nemico tipo 1
var _enemy_type_1 = instance_place(x, y + 1, obj_enemy_type_1);

if (_enemy_type_1 != noone && !_enemy_type_1.is_dead) {
	if (y_speed > 0 && y < _enemy_type_1.y) { // kill nemico
		_enemy_type_1.die();
		y_speed = jump_speed * 0.7;
	} else if (!invulnerable) { // subisce danno
        n_lives -= 1;
		if (n_lives < 0) {
			n_lives = 0;
		} 
		global.player_lives = n_lives;
		
        invulnerable = true;
        invulnerable_time = room_speed * 2;

		is_damaged = true;
		damage_time = room_speed * 0.5;

        // morte
        if (n_lives <= 0) {
			is_dead = true;
			death_timer = room_speed * 2;
			
			x_speed = 0;
			y_speed = 0;
			
            sprite_index = death_spr;
			image_index = 0;
			image_speed = 1;
			exit;
        }
    }
}

// collisione nemico tipo 2
var _enemy_type_2 = instance_place(x, y + 1, obj_enemy_type_2);

if (_enemy_type_2 != noone && !_enemy_type_2.is_dead) {
	if (y_speed > 0 && y < _enemy_type_2.y) { // kill nemico
		_enemy_type_2.die();
		y_speed = jump_speed * 0.7;
	} else if (!invulnerable) { // subisce danno
        n_lives -= 1;
		if (n_lives < 0) {
			n_lives = 0;
		}
		global.player_lives = n_lives;
		
        invulnerable = true;
        invulnerable_time = room_speed * 2;

		is_damaged = true;
		damage_time = room_speed * 0.5;

        // morte
        if (n_lives <= 0) {
			is_dead = true;
			death_timer = room_speed * 2;

			x_speed = 0;
			y_speed = 0;

			sprite_index = death_spr;
			image_index = 0;
			image_speed = 1;
			exit;
		}
    }
}

// collisione boss
var _boss = instance_place(x, y + 1, obj_boss);

if (_boss != noone && !_boss.is_dead) {
	if (!invulnerable) { // subisce danno
		n_lives -= 1;
        invulnerable = true;
        invulnerable_time = room_speed * 2;

		is_damaged = true;
		damage_time = room_speed * 0.5;

        // morte
        if (n_lives <= 0) {
			is_dead = true;
			death_timer = room_speed * 2;

			x_speed = 0;
			y_speed = 0;

			sprite_index = death_spr;
			image_index = 0;
			image_speed = 1;
			exit;
		}
	}
}

// collisione boss diritta
var _boss_diritta = instance_place(x, y + 1, obj_boss_diritta);

if (_boss_diritta != noone && !_boss_diritta.is_dead) {
	if (!invulnerable) { // subisce danno
		n_lives -= 1;
        invulnerable = true;
        invulnerable_time = room_speed * 2;

		is_damaged = true;
		damage_time = room_speed * 0.5;

        // morte
        if (n_lives <= 0) {
			is_dead = true;
			death_timer = room_speed * 2;

			x_speed = 0;
			y_speed = 0;

			sprite_index = death_spr;
			image_index = 0;
			image_speed = 1;
			exit;
		}
	}
}


// gestione invulnerabilità
if (invulnerable) {
    invulnerable_time--;

    if (invulnerable_time <= 0) {
        invulnerable = false;
    }
}

// gestione stato danno
if (is_damaged) {
    damage_time--;

    if (damage_time <= 0) {
        is_damaged = false;
    }
}

// sparo
if (mouse_check_button_pressed(mb_left)) {
	var spawn_x = x + (24 * face);
	var spawn_y = 0;
	
	if (global.selected_character == 0) {
		spawn_y = y - 50;
	} else if (global.selected_character == 1) {
		spawn_y = y - 30;
	}
	
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
			
		var _bullet = instance_create_layer(spawn_x, spawn_y, "bullets_layer", obj_player_bullet);
		_bullet.move_dir = face;
	}
}

// animazione sprite
if (is_damaged) {
	sprite_index = damage_spr;
	image_speed = 0;
} else if (!on_ground) { // salto
	sprite_index = jump_spr;
	image_speed = 0;

	// cambia frame in base alla posizione
	if (y_speed < -4) { // salita veloce
        image_index = 0;
    } else if (y_speed < -1) { // salita lenta
        image_index = 1;
    } else if (y_speed < 4) { // inizio caduta
        image_index = 2;
    } else { // caduta veloce
        image_index = 3;
    }
} else if (left_mouse) { // attacco
	sprite_index = attack_spr;
	image_speed = 1;
} else if abs(x_speed) > 0 { // camminata
	sprite_index = walk_spr; 
	image_speed = 1;
} else { // fermo
	sprite_index = idle_spr;
	image_speed = 1;
}

mask_index = mask_spr; // imposta la maschera di collisione dello spirte idle
