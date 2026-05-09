// verifica se la pausa è dovuta al tutorial, il menu di pausa non è attivo o viene cliccato un altro pulsante del menu
if (obj_pause_controller.tutorial_pause || !layer_get_visible("pause_layer") || global.ui_clicked) {
	exit;
}

// posizione del mouse
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// dimensioni srpite scalate
var w = sprite_get_width(sprite_index) * scale_x;
var h = sprite_get_height(sprite_index) * scale_y;

// posizione reale del rettangolo
var left = pos_x - (w * 0.5);
var top = pos_y - (h * 0.5);
var right = pos_x + (w * 0.5);
var bottom = pos_y + (h * 0.5);

// click dentro l'hit box del button
if (point_in_rectangle(mx, my, left, top, right, bottom)) {
    if (mouse_check_button_pressed(mb_left)) {
        if (obj_pause_controller.paused) { // verifica se il gioco è in pausa
			global.ui_clicked = true;
			obj_pause_controller.paused = false; // rimuovi la pausa
		}
    }
}
