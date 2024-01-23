function rayman_collide(){
	hsp = xdir * movespeed;
	vsp += 0.5;
		
	if place_meeting(x + hsp, y, obj_solidrect) {
		while !place_meeting(x + sign(hsp), y, obj_solidrect)
			x += sign(hsp)
		hsp = 0
	}
	
	x += hsp;
	
	if place_meeting(x, y + vsp, obj_solidrect) {
		while !place_meeting(x, y + sign(vsp), obj_solidrect)
			y += sign(vsp)
		vsp = 0
	}
	if place_meeting(x, y + vsp, obj_solidrect) || place_meeting(x, y + 1, obj_solidrect) {
		grounded = 1
	}
	else
		grounded = false;
		
	y += vsp;
}