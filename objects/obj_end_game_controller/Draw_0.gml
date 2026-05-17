// dimensioni sprite scalate
var _w = sprite_get_width(current_sprite) * scale_x;
var _h = sprite_get_height(current_sprite) * scale_y;

// posizione centrata
var _x = (room_width * 0.5) - (_w * 0.5);
var _y = (room_height * 0.5) - (_h * 0.5);

// disegno sprite scalato
draw_sprite_ext(current_sprite, 0, _x, _y, scale_x, scale_y, 0, c_white, 1);
