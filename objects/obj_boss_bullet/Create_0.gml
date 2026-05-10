// sprite
if (room == rm_level_1) {
	sprite_index = spr_set_squares;
	mask_index = spr_set_squares;
} else if (room == rm_level_2) {
	sprite_index = spr_set_squares;
	mask_index = spr_set_squares;
} else if (room == rm_level_3) {
	sprite_index = spr_book;
	mask_index = spr_book;
} else if (room == rm_level_4) {
	sprite_index = spr_bread_board;
	mask_index = spr_bread_board;
} else if (room == rm_level_5) {
	sprite_index = spr_query_sql;
	mask_index = spr_query_sql;
}

image_speed = 0.3;

// dimensione
scale_x = 1;
scale_y = 1;

// movimento
move_speed = 4;
move_dir = 0;
x_speed = 0;
face = 1;

life_time = room_speed;
alarm[0] = 5;
can_hit = false;
