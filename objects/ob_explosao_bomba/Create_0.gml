var _lista = ds_list_create()
		
	collision_circle_list(x,y,18,ob_inimigo,0,1,_lista,0)
		
	for(var _i=0;_i<ds_list_size(_lista);_i++){
			
			
		_lista[|_i].vida-=25
			
			
	}
		
ds_list_destroy(_lista)

audio_play_sound(sd_explosion,20,0,1,0,1+random_range(-0.1,0.1))

image_xscale=0.5

image_yscale=0.5