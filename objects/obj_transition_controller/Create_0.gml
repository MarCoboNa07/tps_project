transition_active = true;
transition_timer = room_speed * 2;

// gioco in pausa
with (obj_pause_controller) {
    paused = true;
}

// mostra il layer di transizione
layer_set_visible("transition_layer", true);
