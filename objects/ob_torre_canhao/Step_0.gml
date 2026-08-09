if global.jogo_pausado{
	exit
}
if construido>0{
	
	construido=lerp(construido,0,0.3)
	if construido<0.05{
		construido=0	
		for(var _i=0; _i<6;_i++){
			var _side=1
			if _i <3{
				_side=1
			}
			else{
				_side=-1
			}
			
			instance_create_depth(x,y+7,depth+50,ob_fumaca,{direction:30+60*_i,speed:2,side:_side,image_xscale:1.2})
			
			audio_play_sound(sd_torre_colocada,20,0,1,0,1+random_range(-0.1,0.1))
			}
	}
	
}
else{
	
	//escolhendo meu alvo 
	if instance_exists(ob_inimigo){
	
		var _mais_perto =0
		
		var _lista = ds_list_create()
		
		collision_circle_list(x,y-3,56,ob_inimigo,0,1,_lista,0)
		
		for(var _i=0;_i<ds_list_size(_lista);_i++){
			
			if _lista[|_i].path_position>_mais_perto{
				
				_mais_perto=_lista[|_i].path_position
				
				alvo=_lista[|_i]
			}
			
		}
		
		ds_list_destroy(_lista)

	
	}
	else{
		alvo=noone	
	}
	

	
	//atirando caso eu tenha energia o suficiente e alcance
	
	
	if instance_exists(alvo) and distance_to_object(alvo)<52{
		if energia>=30 and alvo!=noone {
			
			angulo=point_direction(x,y-3,alvo.x,alvo.y)
			
			//recarregando o tiro
		
			if recarga_handle<temp_recarg{
				recarga_handle++	
			}
			
			if recarga_handle==temp_recarg{
				//atirando o projetil
				
				instance_create_depth(x+lengthdir_x(10,angulo),y-3+lengthdir_y(10,angulo),depth-1,ob_bala_canhao,{direction:angulo,speed:2.5,dano:dano})
				
				//realizando efeito pra torreta atirar
				//image_xscale=1.4
				//image_yscale=0.6
				recarga_handle=0
				energia-=30
				
			}
			
		}
	}
	else{
		alvo=noone
		
	}
	
	energia=clamp(energia,0,energia_max)
}


//retornando o efeito da torreta ao normal

//image_xscale=lerp(image_xscale,1,0.1)
//image_yscale=lerp(image_xscale,1,0.1)


//adicionando profundidade

depth=-y
