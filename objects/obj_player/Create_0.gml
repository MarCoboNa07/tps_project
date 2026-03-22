// sprites
player_sprites = [
    spr_marco_bona_idle,
    spr_capo_maurys_idle
]

sprite_index = player_sprites[global.selected_character]

switch(global.selected_character) {
    case 0:
        mask_spr   = spr_marco_bona_idle;
        idle_spr   = spr_marco_bona_idle;
        walk_spr   = spr_marco_bona_walk;
        jump_spr   = spr_marco_bona_jump;
        attack_spr = spr_marco_bona_attack;
        damage_spr = spr_marco_bona_damage;
        death_spr  = spr_marco_bona_death;
    break;
    case 1:
        mask_spr   = spr_capo_maurys_idle;
        idle_spr   = spr_capo_maurys_idle;
        walk_spr   = spr_capo_maurys_walk;
        jump_spr   = spr_capo_maurys_jump;
        attack_spr = spr_capo_maurys_attack;
        damage_spr = spr_capo_maurys_damage;
        death_spr  = spr_capo_maurys_death;
    break;
}

// movimento
face = 1
move_dir = 0
move_speed = 3
x_speed = 0
y_speed = 0

// salto
grav = 0.275
term_vel = 10
jump_speed = -7
on_ground = true
