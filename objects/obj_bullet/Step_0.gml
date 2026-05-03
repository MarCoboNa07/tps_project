// movimento orizzontale
x_speed = move_dir * move_speed;
x += x_speed;

if (move_dir != 0) {
    face = move_dir;
}

// distruzione sui blocchi
if (can_hit) {
	if (place_meeting(x, y, obj_desk_block_1) 
	|| place_meeting(x, y, obj_book_block_1)
	|| place_meeting(x, y, obj_book_block_2)
	|| place_meeting(x, y, obj_book_block_3)) {
	    instance_destroy();
	}
}

// collisione nemico
var _enemy = instance_place(x, y, obj_enemy_type_1);

if (_enemy != noone) {
    _enemy.die();
    instance_destroy();
}

// collisione boss
var _boss = instance_place(x, y, obj_boss);
if (_boss != noone) {
    // danno dopo
    instance_destroy();
}

// lifetime per distruzione
life_time--;
if (life_time <= 0) {
    instance_destroy();
}
