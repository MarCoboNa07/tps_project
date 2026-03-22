// pausa manuale
if !paused && keyboard_check(vk_escape) {
    paused = true // metti il gioco in pausa
}

// pausa forzata dal tutorial
if (tutorial_pause) {
    paused = true;
}


layer_set_visible("pause_layer", paused && !tutorial_pause) // toggle del layer del menu di pausa
