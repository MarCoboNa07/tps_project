// verifica se il gioco è in pausa
if (obj_pause_controller.paused) {
	exit
}

// input
get_controls()

// movimento sull'asse x
move_dir = right_key - left_key // direzione

// verifica se il personaggio si sta muovento
if (move_dir != 0) {
	face = move_dir // cambia la direzione in cui guarda il personaggio
}

x_speed = move_dir * move_speed // calcola la velocità

// collisioni
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
		x += _pixel_check
	}
	
	x_speed = 0 // imposta la velocità a 0 per far collidere il player con il blocco
}

x += x_speed // movimento

// movimento sull'asse y
y_speed += grav // gravità

// salto
if (jump_key_pressed && on_ground) {
	y_speed = jump_speed
}

// regola la velocità di caduta se è troppo alta
if (y_speed > term_vel) {
	y_speed = term_vel
}

// collisioni
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
		y += _pixel_check
	}
	
	y_speed = 0 // imposta la velocità a 0 per far collidere il player con il blocco
}

// verifica se il player è sopra un blocco
if (y_speed >= 0 && (place_meeting(x, y + 1, obj_desk_block_1) 
	|| place_meeting(x, y + 1, obj_book_block_1)
	|| place_meeting(x, y + 1, obj_book_block_2)
	|| place_meeting(x, y + 1, obj_book_block_3))) {
	on_ground = true
} else {
	on_ground = false
}

y += y_speed // movimento

// animazione sprite
if (!on_ground) { // salto
	sprite_index = jump_spr
	image_speed = 0 // imposta la velocità di cambio frame
	
	// cambia frame in base alla posizione
	if (y_speed < -4) { // salita veloce
        image_index = 0
    } else if (y_speed < -1) { // salita lenta
        image_index = 1
    } else if (y_speed < 4) { // inizio caduta
        image_index = 2
    } else { // caduta veloce
        image_index = 3
    }
} else if (left_mouse) { // attacco
	sprite_index = attack_spr
	image_speed = 1
} else if abs(x_speed) > 0 { // camminata
	sprite_index = walk_spr 
	image_speed = 1 // imposta la velocità di cambio frame
} else { // fermo
	sprite_index = idle_spr
	image_speed = 1 // imposta la velocità di cambio frame
}

mask_index = mask_spr // imposta la maschera di collisione dello spirte idle
