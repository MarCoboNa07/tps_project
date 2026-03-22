// verifica se la pausa è dovuta al tutorial
if obj_pause_controller.tutorial_pause {
	exit
}

// posizione del mouse
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// calcolo hit box
var w = sprite_width * scale_x;
var h = sprite_height * scale_y;

// click dentro l'hit box del button
if (point_in_rectangle(mx, my, pos_x - w/2, pos_y - h/2, pos_x + w/2, pos_y + h/2)) {
    if (mouse_check_button_pressed(mb_left)) {
        room_restart() // resetta la room
    }
}
