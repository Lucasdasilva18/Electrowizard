image_xscale=lerp(image_xscale,0,0.05)
image_yscale=image_xscale

image_alpha=image_xscale

image_angle+=side

if image_xscale<=0.05{
	instance_destroy()
}

if speed>0{
	
	speed=lerp(speed,0,0.2)
	
}