// verifica se il personaggio è stato selezionato per cambiare sprite
if global.selected_character == character_id {
	sprite_index = spr_selected	
} else {
	sprite_index = spr_idle
}
