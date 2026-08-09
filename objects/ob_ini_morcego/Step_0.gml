// Inherit the parent event
event_inherited();


//escolhendo a sprite de acordo com o lado
if direction==0{
	image_index=0
	side=-1
}
if direction==90{
	image_index=1
	side=1
}

if direction=180{
	image_index=0
	side=1
}
if direction==270{
	image_index=0
	side=1
}

//animacao de andar

image_xscale=lerp(image_xscale,1*(-side),0.2 )

image_yscale=lerp(image_yscale,1,0.2)


if global.jogo_pausado{
	path_speed=0
}else{
	path_speed=vel
}