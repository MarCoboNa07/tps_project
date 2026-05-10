var _alpha = image_alpha;

// effetto lampeggio
if (is_dead) {
    if (floor(current_time / 100) mod 2 == 0) {
        _alpha = 0.3;
    }
}

// disegna il personaggio specchiandolo nella direzione corretta
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, _alpha);
