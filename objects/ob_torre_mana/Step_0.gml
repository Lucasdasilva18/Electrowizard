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
	
	//gerando mana caso eu tenha energia o suficiente
	
	if energia>=20{
		//recarregando 
	
		if recarga_handle<temp_recarg{
			recarga_handle++	
			
			if recarga_handle>=temp_recarg-60{
				image_speed=1
			}
		}
		
		if recarga_handle==temp_recarg{
			//atirando a mana pra fora
			
			instance_create_depth(x,y,depth-1,ob_mana,{direction:irandom(360),speed:1})
			
			//realizando efeito de geração
			image_xscale=1.1
			image_yscale=0.9
			recarga_handle=0
			energia-=20
			
		}
		
	}
	
	energia=clamp(energia,0,energia_max)
}


//retornando o efeito ao normal

image_xscale=lerp(image_xscale,1,0.1)
image_yscale=lerp(image_xscale,1,0.1)

//adicionando profundidade

depth=-y
