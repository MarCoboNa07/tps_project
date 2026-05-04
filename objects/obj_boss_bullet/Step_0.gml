// movimento orizzonatale
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

// collisione player
var _player = instance_place(x, y, obj_player);

if (_player != noone) {
    if (!_player.invulnerable) {
        _player.n_lives -= 1;
        _player.invulnerable = true;
        _player.invulnerable_time = room_speed * 2;

        _player.is_damaged = true;
        _player.damage_time = room_speed * 0.5;

        // morte player
        if (_player.n_lives <= 0) {
            _player.sprite_index = _player.death_spr;
            room_goto(rm_menu);
        }
    }

    instance_destroy();
}

// lifetime
life_time--;
if (life_time <= 0) {
    instance_destroy();
}
