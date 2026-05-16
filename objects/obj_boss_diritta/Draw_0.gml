var _alpha = image_alpha;

// lampeggio morte
if (is_dead) {
    if (floor(current_time / 100) mod 2 == 0) {
        _alpha = 0.3;
    }
}

// lampeggio trasformazione
if (phase_transition) {
    if (floor(current_time / 100) mod 2 == 0) {
        _alpha = 0.3;
    }
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, _alpha);
