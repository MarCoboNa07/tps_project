// verifica se il gioco è in pausa
if (obj_pause_controller.paused) {
	exit
}

// input
get_controls();

// blocca movimento se subisce danno
if (is_damaged) {
	move_dir = 0;
	x_speed = 0;
}

// movimento sull'asse x
move_dir = right_key - left_key; // direzione

// verifica se il personaggio si sta muovento
if (move_dir != 0) {
	face = move_dir; // cambia la direzione in cui guarda il personaggio
}

x_speed = move_dir * move_speed; // calcola la velocità

// collisione blocchi
var _sub_pixel = 0.5
if (place_meeting(x + x_speed, y, obj_desk_block_1) 
	|| place_meeting(x + x_speed, y, obj_book_block_1)
	|| place_meeting(x + x_speed, y, obj_book_block_2)
	|| place_meeting(x + x_speed, y, obj_book_block_3)) { // verifica se il player incontra un blocco
	// fai avvicinare il player al blocco con precisione
	var _pixel_check = _sub_pixel * sign(x_speed)
	while (!place_meeting(x + _pixel_check, y, obj_desk_block_1) 
		&& !place_meeting(x + _pixel_check, y, obj_book_block_1)
		&& !place_meeting(x + _pixel_check, y, obj_book_block_2)
		&& !place_meeting(x + _pixel_check, y, obj_book_block_3)) {
		x += _pixel_check;
	}
	
	x_speed = 0; // imposta la velocità a 0 per far collidere il player con il blocco
}

x += x_speed; // movimento

// movimento sull'asse y
y_speed += grav; // gravità

// salto
if (jump_key_pressed && on_ground) {
	y_speed = jump_speed;
}

// regola la velocità di caduta se è troppo alta
if (y_speed > term_vel) {
	y_speed = term_vel;
}

// collisioni blocchi
if (place_meeting(x, y + y_speed, obj_desk_block_1) 
	|| place_meeting(x, y + y_speed, obj_book_block_1)
	|| place_meeting(x, y + y_speed, obj_book_block_2)
	|| place_meeting(x, y + y_speed, obj_book_block_3)) {
	// fai avvicinare il player al blocco con precisione
	var _pixel_check = _sub_pixel * sign(y_speed)
	while (!place_meeting(x, y + _pixel_check, obj_desk_block_1) 
		&& !place_meeting(x, y + _pixel_check, obj_book_block_1)
		&& !place_meeting(x, y + _pixel_check, obj_book_block_2)
		&& !place_meeting(x, y + _pixel_check, obj_book_block_3)) {
		y += _pixel_check;
	}
	
	y_speed = 0; // imposta la velocità a 0 per far collidere il player con il blocco
}

// verifica se il player è sopra un blocco
if (y_speed >= 0 && (place_meeting(x, y + 1, obj_desk_block_1) 
	|| place_meeting(x, y + 1, obj_book_block_1)
	|| place_meeting(x, y + 1, obj_book_block_2)
	|| place_meeting(x, y + 1, obj_book_block_3))) {
	on_ground = true;
} else {
	on_ground = false;
}

y += y_speed; // movimento

// collisione nemico
var _enemy = instance_place(x, y + 1, obj_enemy_type_1);

if (_enemy != noone) {
	if (y_speed > 0 && y < _enemy.y) { // kill nemico
		_enemy.is_dead = true;
		_enemy.death_timer = room_speed * 0.5;
		
		y_speed = jump_speed * 0.7;
	} else if (!invulnerable) { // subisce danno
        n_lives -= 1;
        invulnerable = true;
        invulnerable_time = room_speed * 2;

		is_damaged = true;
		damage_time = room_speed * 0.5;

        // morte
        if (n_lives <= 0) {
            sprite_index = death_spr;
			room_goto(rm_menu);
        }
    }
}

// collisione boss
var _boss = instance_place(x, y + 1, obj_boss);

if (_boss != noone) {
	if (!invulnerable) { // subisce danno
		n_lives -= 1;
        invulnerable = true;
        invulnerable_time = room_speed * 2;

		is_damaged = true;
		damage_time = room_speed * 0.5;

        // morte
        if (n_lives <= 0) {
            sprite_index = death_spr;
			room_goto(rm_menu);
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
