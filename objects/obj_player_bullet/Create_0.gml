// sprite
if (global.selected_character == 0) {
	sprite_index = spr_fireball;
	mask_index = spr_fireball;
} else if (global.selected_character == 1) {
	sprite_index = spr_kebab;
	mask_index = spr_kebab;
}

image_speed = 0.3;

// dimensione
scale_x = 1;
scale_y = 1;

// movimento
move_speed = 8;
move_dir = 0;
x_speed = 0;
face = 1;

life_time = room_speed;
alarm[0] = 5;
can_hit = false;
