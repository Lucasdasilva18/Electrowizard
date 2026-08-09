//recarregando o ataque do inimigo
if recarga_handle<temp_recarga{
	
	recarga_handle++
		
}



if vida<=0{
	
	instance_destroy()
	
}
//escolhendo a sprite de acordo com o lado
if direction==0{
	image_index=2
	side=1
}
if direction==90{
	image_index=1
	side=1
}

if direction=180{
	image_index=2
	side=-1
}
if direction==270{
	image_index=0
	side=1
}

//animacao de andar

image_xscale=lerp(image_xscale,1*side,0.2 )

image_yscale=lerp(image_yscale,1,0.2)

//profundidade

depth=-y

if temp_curado>0 and curado{
	
	temp_curado--
	
	img_cura+=0.1
	
	
}
else{
	curado=0
	
	temp_curado=60
}

vida=clamp(vida,0,vida_max)

if global.jogo_pausado{
	path_speed=0
}else{
	path_speed=vel
}