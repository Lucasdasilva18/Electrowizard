if distance_to_object(ob_mago)>=56{
	
	speed=lerp(speed,0,0.1)
	
}
else{
	
	speed=lerp(speed,3,0.1)
	direction=point_direction(x,y,ob_mago.x,ob_mago.y)
	
}

if t_vida>0{
	
	t_vida--
	
}
else{
	instance_destroy()
}