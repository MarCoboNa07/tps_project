function start_phase_transition(_phase) {
    phase = _phase;
    phase_transition = true;
    phase_timer = room_speed * 2;
	
    hit_invulnerable = true;
    is_damaged = true;
	
    image_index = 0;

    // cambio sprite versione god
    if (phase == 3) {

        idle_spr   = phase3_idle_spr;
        attack_spr = phase3_attack_spr;
        damage_spr = phase3_damage_spr;
        death_spr  = phase3_death_spr;
    }
}

// cambio fase
if (phase == 1 && hp <= 20) {
    start_phase_transition(2);
}

if (phase == 2 && hp <= 10) {
    start_phase_transition(3);
}

// gestione transizione fase
if (phase_transition) {
    phase_timer--;
    x_speed = 0;

    if (phase_timer <= 0) {
        phase_transition = false;
        hit_invulnerable = false;
        is_damaged = false;
    }
    exit;
}

// gestione attacco
shoot_timer--;

if (shoot_timer <= 0 && !is_dead) {
    is_attacking = true;
    image_index = 0;

    switch (phase) {
        case 1:
            burst_count = 1;
            shoot_timer = room_speed * 2;
        break;
        case 2:
            burst_count = 3;
            shoot_timer = room_speed * 1.5;
        break;
        case 3:
            burst_count = 8;
            shoot_timer = room_speed * 1;
        break;
    }

    burst_timer = 0;
}

// gestione raffica
if (burst_count > 0) {
    burst_timer--;

    if (burst_timer <= 0) {
        var spawn_x = x + (24 * face);
        var spawn_y = y - 40;

        var _bullet = instance_create_layer(spawn_x, spawn_y, "bullets_layer", obj_boss_bullet);
        _bullet.move_dir = face;

        switch (phase) {
            case 1:
                _bullet.move_speed = 4;
                burst_timer = room_speed * 0.2;
            break;
            case 2:
                _bullet.move_speed = 5;
                burst_timer = room_speed * 0.12;
            break;
            case 3:
                _bullet.move_speed = 7;
                burst_timer = room_speed * 0.06;
            break;
        }
		
        burst_count--;

        if (burst_count <= 0) {
            is_attacking = false;
        }
    }
}