rayman_collide_object()
rayman_collide_tile()
xdir = keyboard_check(vk_right) - keyboard_check(vk_left)
if xdir != 0
	image_xscale = xdir
if keyboard_check_pressed(vk_up) && grounded
	vsp = -15
if keyboard_check(vk_down) {
	if sprite_index == spr_raymanidle 
		sprite_index = spr_raymanduckIN
	if sprite_index == spr_raymanduckIN {
		if floor(image_index) == image_number - 1
			sprite_index = spr_raymanduckID
	}
	sprite_index = spr_raymanduckID
	mask_index = mask_crouch
}
else {
	mask_index = mask_normal
	sprite_index = spr_raymanidle
}
