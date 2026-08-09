image_xscale=lerp(image_xscale,1,0.2)

image_yscale=lerp(image_xscale,1,0.2)

if image_xscale>0.99{
	
	image_xscale=1
	image_yscale=image_xscale
	
	image_alpha=lerp(image_alpha,0,0.2)
	
	if image_alpha<=0.01{
		instance_destroy()
	}
	
}