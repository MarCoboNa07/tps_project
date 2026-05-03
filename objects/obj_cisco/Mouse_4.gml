if (image_index < image_number - 1) { // cambia frame
	image_index += 1;
} else { // termina pausa tutorial
	obj_pause_controller.tutorial_pause = false;
    obj_pause_controller.paused = false;
	
    instance_destroy();
}
