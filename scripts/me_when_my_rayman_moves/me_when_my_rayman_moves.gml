function rayman_collide_object(){
	hsp = xdir * movespeed;
	vsp += 0.5;
		
	if place_meeting(x + hsp, y, obj_solidrect) {
		while !place_meeting(x + sign(hsp), y, obj_solidrect)
			x += sign(hsp)
		hsp = 0
	}
	
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
}

function rayman_collide_tile(){
	if place_meeting(x + hsp, y, tilemap)
		hsp = 0
	if place_meeting(x, y + vsp, tilemap)
		vsp = 0
	if place_meeting(x, y + 1, tilemap) || place_meeting(x, y + 1, obj_solidrect)
		grounded = 1
	else
		grounded = false
	move_and_collide(hsp, vsp, tilemap)
}


function rayman_collide_tile_bad(){
	if vsp > 0
		vsp += 0.5;
	var bboxside;
	if xdir == 1 
		bboxside = bbox_right
	else
		bboxside = bbox_left
	//X collisions, or horizontal tile collisions. Yes, i followed a tutorial :trolle: https://www.youtube.com/watch?v=UyKdQQ3UR_0
	if (tilemap_get_at_pixel(tilemap, bboxside + hsp, bbox_top) != 0) || (tilemap_get_at_pixel(tilemap, bboxside + hsp, bbox_bottom) != 0) {
		if sign(hsp) == 1 {
			x = x - (x mod 8) + 7 - (bbox_right - x)
		}
		else if sign(hsp) == -1 {
			x = x - (x mod 8) - (bbox_left - x)
		}
		hsp = 0;
	}
	
	x += hsp;
		
	ydir = sign(vsp);
	if ydir > 0
		bboxside = bbox_bottom
	else if ydir < 0
		bboxside = bbox_top
	if (tilemap_get_at_pixel(tilemap, bbox_left + vsp, bboxside + vsp) != 0) || (tilemap_get_at_pixel(tilemap, bbox_right, bboxside + vsp) != 0) {
		if sign(vsp) == 1 {
			y = y - (y mod 16) + 15 - (bbox_bottom - y)
		}
		else if sign(vsp) == -1 {
			y = y - (y mod 16) - (bbox_top - y)
		}
		vsp = 0;
		grounded = 1;
	}
	else
		grounded = 0;
	y += vsp;
}