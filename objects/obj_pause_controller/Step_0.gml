// pausa manuale
if (!paused && keyboard_check_pressed(vk_escape)) {
    paused = true; // metti il gioco in pausa
}

// pausa forzata dal tutorial
if (tutorial_pause) {
    paused = true;
}

var _in_transition = instance_exists(obj_transition_controller) && obj_transition_controller.transition_active;

layer_set_visible("pause_layer", paused && !tutorial_pause && !_in_transition); // toggle del layer del menu di pausa
layer_set_visible("transition_layer", _in_transition); // toggle del layer di transizione
