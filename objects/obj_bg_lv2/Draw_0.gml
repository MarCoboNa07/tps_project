var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_w = camera_get_view_width(cam);

// larghezza reale dello sfondo scalato
var sw = sprite_get_width(sprite_index) * scale_x;

// offset basato sulla camera
var offset = cam_x - floor(cam_x / sw) * sw;

// quante copie servono
var count = ceil(cam_w / sw) + 3;

// disegno
for (var i = 0; i < count; i++) {
    draw_sprite_ext(sprite_index, 0, pos_x - offset + i * sw, pos_y, scale_x, scale_y, 0, c_white, 1);
}
