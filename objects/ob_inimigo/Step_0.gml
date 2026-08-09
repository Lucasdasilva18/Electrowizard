

//recarregando o ataque do inimigo
if recarga_handle<temp_recarga{
	
	recarga_handle++
		
}



if vida<=0{
	
	instance_destroy()
	
}

if direction==0{
	image_xscale=1
}
if direction=180{
	image_xscale=-1
}

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