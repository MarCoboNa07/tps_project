// funzione per leggere l'input dei comandi di gioco
function get_controls() {
	right_key = keyboard_check(ord("D"))
	left_key = keyboard_check(ord("A"))
	jump_key_pressed = keyboard_check_pressed(ord("W"))
	left_mouse = mouse_check_button(mb_left)
}
