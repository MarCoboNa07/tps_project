var _alpha = image_alpha;

// effetto lampeggio
if (is_disappearing) {
    if (floor(current_time / 100) mod 2 == 0) {
        _alpha = 0.3;
    }
}

// draw
draw_sprite_ext(sprite_index, image_index, x, y, -image_xscale, image_yscale, image_angle, image_blend, _alpha);
