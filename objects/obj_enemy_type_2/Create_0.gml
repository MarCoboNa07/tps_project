if (room == rm_level_3 || room == rm_level_4 || room == rm_level_5) {
	sprite_index = spr_giacomo_idle;
	
	mask_spr = spr_giacomo_idle;
	idle_spr = spr_giacomo_idle;
	walk_spr = spr_giacomo_walk;
	attack_spr = spr_giacomo_attack;
	damage_spr = spr_giacomo_damage;
}
state = "idle"; // idle, walk, damage

// movimento
move_speed = 1
move_dir = 1
x_speed = 0
y_speed = 0

// fisica
grav = 0.275
term_vel = 10
on_ground = false
face = 1

// danno
is_damaged = false;
damage_time = 0;
hp = 3;
hit_cooldown = 0;
hit_invulnerable = false;

// morte
is_dead = false;
death_timer = 0;

// attacco
shoot_timer = room_speed * 2;
is_attacking = false;
attack_time = 0;
