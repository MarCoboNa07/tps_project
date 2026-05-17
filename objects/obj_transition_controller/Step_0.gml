if (transition_active) {
    transition_timer--;
    
    if (transition_timer <= 0) {
        transition_active = false;
        
        // nascondi il transition layer
        layer_set_visible("transition_layer", false);
        
        // togli la pausa
        with (obj_pause_controller) {
            paused = false;
        }
    }
}
