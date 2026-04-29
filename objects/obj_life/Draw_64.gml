var start_x = 65;
var start_y = 105;

var sw = sprite_get_width(sprite) * scale_x;

for (var i = 0; i < n_lives; i++) {
    draw_sprite_ext(sprite, 0, start_x + i * (sw + spacing), start_y, scale_x, scale_y, 0, c_white, 1);
}
