var _player = instance_find(obj_player, 0); // ottieni l'istanza del player

// verifica l'esistenza dell'istanza del player
if (!instance_exists(_player)) {
	exit;
}

// vita
var _lives = _player.n_lives;
var _max_lives = 3;

var sw = (sprite_get_width(sprite) * scale_x); // sprite scalato

// disegna lo sprite
for (var i = 0; i < _max_lives; i++) {
	var _frame = (i < _lives) ? 0 : 1; // 0 = vita, 1 = vita persa
    draw_sprite_ext(sprite, _frame, start_x + i * (sw + spacing), start_y, scale_x, scale_y, 0, c_white, 1);
}
