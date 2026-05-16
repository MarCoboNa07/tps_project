// sprite
idle_spr   = spr_diritta_idle;
attack_spr = spr_diritta_attack;
damage_spr = spr_diritta_damage;
death_spr  = spr_diritta_death;
jump_spr = spr_diritta_jump;

phase3_idle_spr   = spr_diritta_god_idle;
phase3_attack_spr = spr_diritta_god_attack;
phase3_damage_spr = spr_diritta_god_damage;
phase3_death_spr  = spr_diritta_god_death;
phase3_jump_spr = spr_diritta_god_jump;

sprite_index = idle_spr;
mask_spr = idle_spr;

// stato
state = "idle";

// movimento
move_speed = 0;
move_dir = 1;

x_speed = 0;
y_speed = 0;

face = -1;

// fisica
grav = 0.275;
term_vel = 10;

// salto
is_jumping = false;

// hp
max_hp = 30;
hp = max_hp;

// danno
is_damaged = false;
damage_time = 0;
hit_invulnerable = false;
hit_cooldown = 0;

// morte
is_dead = false;
death_timer = 0;

// attacco
shoot_timer = room_speed * 2;
is_attacking = false;

// fasi
phase = 1;
phase_transition = false;
phase_timer = 0;

// raffiche
burst_count = 0;
burst_timer = 0;
