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
	
	//atirando caso eu tenha energia o suficiente
	
	if energia>=40{
		//recarregando o tiro
	
		if recarga_handle<temp_recarg{
			recarga_handle++	
		}
		
		if recarga_handle==temp_recarg{
			//atirando os raios
			for(var _i=0;_i<4;_i++){
				instance_create_depth(x,y,depth-1,ob_raio,{direction:45+90*_i,speed:1,dano:dano,energia:energia_ataque,criador:id})
			}
			//realizando efeito pra torre atirar
			image_xscale=1.4
			image_yscale=0.6
			recarga_handle=0
			energia-=40
			audio_play_sound(sd_raio,20,0,1,0,1+random_range(-0.2,0.2))
			
		}
		
	}
	
	energia=clamp(energia,0,energia_max)
}


//retornando o efeito ao normal

image_xscale=lerp(image_xscale,1,0.1)
image_yscale=lerp(image_xscale,1,0.1)

//adicionando profundidade

depth=-y
