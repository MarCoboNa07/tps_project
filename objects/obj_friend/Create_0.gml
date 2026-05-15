// sprite
if (room == rm_level_3) {
	mask_spr = spr_orli_idle;
	idle_spr = spr_orli_idle;
	happy_spr = spr_orli_happy;
} else if (room == rm_level_5) {
	mask_spr = spr_scary_idle;
	idle_spr = spr_scary_idle;
	happy_spr = spr_scary_happy;
}

sprite_index = idle_spr;

// fisica
y_speed = 0;
grav = 0.275;
term_vel = 10;

// stato
is_used = false;
is_disappearing = false;
disappear_timer = 0;
