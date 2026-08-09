if global.jogo_pausado{
	exit
}


//se minha wave iniciar eu rodo o código dela


if tempo_restante=0{
	
	if boss{
		
		if !boss_nasceu{
			
			instance_create_depth(x,y,depth-1,ob_boss_guardiao)
			boss_nasceu=true
		}
		
	}
	else{
	
	
	
	//tempo para sumonar mais inimigos
	if temp_handle<temp{
		temp_handle++
	}//quando o tempo acaba eu sumono mais
	else{
		//pegando quantos inimigos diferentes tem na wave
		var _inimigos = array_length(waves.mundo1[wave_atual-1][1])
		//se ainda tenho inimigo pra sumonar, eu sumono
		if quant>0{
			quant--
			instance_create_depth(x,y,depth-1,waves.mundo1[wave_atual-1][1][ini_atual][0])
			temp_handle=0
		}//se não, verifico se falta mais outro inimigo na wave
		else{
			ini_atual++
			
			
			
			//se tiver, continuo a wave
			if ini_atual<_inimigos{
				
				//pegando a quantidade dos próximos inimigos
				quant=waves.mundo1[wave_atual-1][1][ini_atual][1]
			
				//pegando o tempo entre eles
				temp=waves.mundo1[wave_atual-1][1][ini_atual][2]
			
				//zerando o cronometro entre inimigos
				temp_handle=0
			
				
				
				
			}//se não eu termino a wave e inicio o cronômetro novamente
			else{
				//iniciando o tempo da wave do boss
				if wave_atual ==array_length(waves.mundo1){
					
					tempo_restante=1*minuto
					boss=true
					
				}
				if wave_atual < array_length(waves.mundo1){
					wave_atual++ 
				
				
				
				//pegando o tempo pra comecar a proxima wave
				tempo_restante=waves.mundo1[wave_atual-1][0]
				
				//zerando o inimigo inicial
			
				ini_atual=0
				
				//pegando a quantidade dos próximos inimigos
				quant=waves.mundo1[wave_atual-1][1][ini_atual][1]
			
				//pegando o tempo entre eles
				temp=waves.mundo1[wave_atual-1][1][ini_atual][2]
				
				}
				
				
				
			}
		}
		
	}
	}
	

}
//se não, eu deixo o tempo passar
else{
	
	tempo_restante--
	
	//acelerando o tempo
	
	if keyboard_check_pressed(vk_space){
		tempo_restante=60
	}
	
}



