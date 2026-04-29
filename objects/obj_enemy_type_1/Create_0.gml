// sprite
if (room == rm_level_1) {
	sprite_index = spr_maranza_1;
} else if (room == rm_level_2) {
	sprite_index = spr_maranza_2;
}

// movimento
move_speed = 2
move_dir = 1
x_speed = 0
y_speed = 0

// fisica
grav = 0.275
term_vel = 10
on_ground = false
face = 1

// morte
is_dead = false;
death_timer = 0;
