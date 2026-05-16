// movimento orizzontale
x_speed = move_dir * move_speed;
x += x_speed;

if (move_dir != 0) {
    face = move_dir;
}

// distruzione sui blocchi
if (can_hit) {
    if (place_meeting(x, y, obj_algorithm_block) 
		|| place_meeting(x, y, obj_backpack_block)
		|| place_meeting(x, y, obj_book_block_1)
	    || place_meeting(x, y, obj_book_block_2)
	    || place_meeting(x, y, obj_book_block_3)
		|| place_meeting(x, y, obj_bread_board_block)
		|| place_meeting(x, y, obj_desk_block_1) 
		|| place_meeting(x, y, obj_desk_block_2)
		|| place_meeting(x, y, obj_desk_block_3)
		|| place_meeting(x, y, obj_ethernet_cable_block)
		|| place_meeting(x, y, obj_pc_block)
		|| place_meeting(x, y, obj_rack_block)
		|| place_meeting(x, y, obj_sink_block)
		|| place_meeting(x, y, obj_switch_block)) {
			
        instance_destroy();
    }
}

// collisione nemico tipo 1
var _enemy_type_1 = instance_place(x, y, obj_enemy_type_1);

if (_enemy_type_1 != noone) {
    _enemy_type_1.die();
    instance_destroy();
}

// collisione nemico tipo 2
var _enemy_type_2 = instance_place(x, y, obj_enemy_type_2);

if (_enemy_type_2 != noone) {
	_enemy_type_2.take_damage(1);
	instance_destroy();
}

// collisione boss
var _boss = instance_place(x, y, obj_boss);
if (_boss != noone) {
    _boss.take_damage(1);
    instance_destroy();
}

// collisione boss diritta
var _boss_diritta = instance_place(x, y, obj_boss_diritta);
if (_boss_diritta != noone) {
    _boss_diritta.take_damage(1);
    instance_destroy();
}

// lifetime per distruzione
life_time--;
if (life_time <= 0) {
    instance_destroy();
}
