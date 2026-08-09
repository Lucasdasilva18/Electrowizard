//correndo o timer
 if tempo_clicar>0{
	 tempo_clicar--
	if !audio_is_playing(sd_musica_menu){
		audio_play_sound(sd_musica_menu,50,1)
	}	
	
	audio_group_set_gain(Music,global.msc_vol)

	audio_group_set_gain(SFX,global.sfx_vol)
	
 }//se acabar o timer , posso usar o menu
else{
	
	
	//colocando o mouse por cima dos botôes
	var _mous_x=device_mouse_x_to_gui(0)
	var _mous_y=device_mouse_y_to_gui(0)
	
	//botao jogar
	if point_in_rectangle(_mous_x,_mous_y,block1_x-120,block1_y-40,block1_x+120,block1_y+40){
		
		spr1_tam=lerp(spr1_tam,1.3,0.1)
		if mouse_check_button_released(mb_left){
			if !instance_exists(oTransition){
				instance_create_depth(x,y,-3000,oTransition,{destino:rm_superficie})
			}
			audio_play_sound(sd_click,20,0)
		}
	}
	else{
		spr1_tam=lerp(spr1_tam,1,0.1)
	}
	
	//botao configurações
	if point_in_rectangle(_mous_x,_mous_y,block2_x-120,block2_y-40,block2_x+120,block2_y+40){
		
		spr2_tam=lerp(spr2_tam,1.3,0.1)
		if mouse_check_button_released(mb_left){
			if !instance_exists(oTransition){
				instance_create_depth(x,y,-3000,oTransition,{destino:rm_configs})
			}
			audio_play_sound(sd_click,20,0)
		
		}
		
	}
	else{
		spr2_tam=lerp(spr2_tam,1,0.1)
	}
	
	//botao sair
	if point_in_rectangle(_mous_x,_mous_y,block3_x-120,block3_y-40,block3_x+120,block3_y+40){
		
		spr3_tam=lerp(spr3_tam,1.3,0.1)
		
		if mouse_check_button_pressed(mb_left){
			game_end()
		}
		
	}
	else{
		spr3_tam=lerp(spr3_tam,1,0.1)
	}
}