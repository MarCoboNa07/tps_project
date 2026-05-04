// sprites
if (room == rm_level_1) {
	sprite_index = spr_turtulix_idle;
	
	mask_spr   = spr_turtulix_idle;
    idle_spr   = spr_turtulix_idle;
    walk_spr   = spr_turtulix_walk;
    attack_spr = spr_turtulix_attack;
    damage_spr = spr_turtulix_damage;
    death_spr  = spr_turtulix_death;
} else if (room == rm_level_2) {
	sprite_index = spr_turtulix_idle;
	
	mask_spr   = spr_turtulix_idle;
    idle_spr   = spr_turtulix_idle;
    walk_spr   = spr_turtulix_walk;
    attack_spr = spr_turtulix_attack;
    damage_spr = spr_turtulix_damage;
    death_spr  = spr_turtulix_death;
} else if (room == rm_level_3) {
	sprite_index = spr_rosy_idle;
	
	mask_spr   = spr_rosy_idle;
    idle_spr   = spr_rosy_idle;
    walk_spr   = spr_rosy_walk;
    attack_spr = spr_rosy_attack;
    damage_spr = spr_rosy_damage;
    death_spr  = spr_rosy_death;
} else if (room == rm_level_4) {
	sprite_index = spr_swag_idle;
	
	mask_spr   = spr_swag_idle;
    idle_spr   = spr_swag_idle;
    walk_spr   = spr_swag_walk;
    attack_spr = spr_swag_attack;
    damage_spr = spr_swag_damage;
    death_spr  = spr_swag_death;
} else if (room == rm_level_5) {
	sprite_index = spr_gigante_idle;
	
	mask_spr   = spr_gigante_idle;
    idle_spr   = spr_gigante_idle;
    walk_spr   = spr_gigante_walk;
    attack_spr = spr_gigante_attack;
    damage_spr = spr_gigante_damage;
    death_spr  = spr_gigante_death;
}
state = "idle"; // idle, walk, damage, death

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
hp = 10;
hit_cooldown = 0;
hit_invulnerable = false;

// morte
is_dead = false;
death_timer = 0;

// attacco
shoot_timer = room_speed * 2;
is_attacking = false;
attack_time = 0;
