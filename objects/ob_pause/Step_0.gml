


	
//mudando volume

	audio_group_set_gain(Music,global.msc_vol)

	audio_group_set_gain(SFX,global.sfx_vol)

//colocando o mouse por cima dos botôes
var _mous_x=device_mouse_x_to_gui(0)
var _mous_y=device_mouse_y_to_gui(0)


//botao retomar
if point_in_rectangle(_mous_x,_mous_y,block1_x-120,block1_y-40,block1_x+120,block1_y+40){
	
	spr1_tam=lerp(spr1_tam,1.3,0.1)
	
	if mouse_check_button_released(mb_left){
		instance_destroy()
		
		audio_play_sound(sd_click,20,0)
	}
}
else{
	spr1_tam=lerp(spr1_tam,1,0.1)
	 
}

//botao tela cheia
if point_in_rectangle(_mous_x,_mous_y,block2_x-120,block2_y-40,block2_x+120,block2_y+40){
	
	spr2_tam=lerp(spr2_tam,1.3,0.1)
	
	if mouse_check_button_released(mb_left){
		if window_get_fullscreen(){
			window_set_fullscreen(0)
		}
		else{
			window_set_fullscreen(1)
		}
		audio_play_sound(sd_click,20,0)
	}
}
else{
	spr2_tam=lerp(spr2_tam,1,0.1)
	 
}


//botao volume musica aumentar
if point_in_rectangle(_mous_x,_mous_y,block3_x+120,block3_y-40,block3_x+280,block3_y+40){
	
	

	if mouse_check_button_pressed(mb_left){
		
		global.msc_vol+=0.1
		
		global.msc_vol=clamp(global.msc_vol,0,1)
		
		spr3_tam=1.2
		audio_play_sound(sd_click,20,0)
		
	}
	
	
}

//botao volume musica diminuir
if point_in_rectangle(_mous_x,_mous_y,block3_x-280,block3_y-40,block3_x-120,block3_y+40){
	
	

	if mouse_check_button_pressed(mb_left){
		
		global.msc_vol-=0.1
		
		global.msc_vol=clamp(global.msc_vol,0,1)
		spr3_tam=1.2
		
		audio_play_sound(sd_click,20,0)
	}
	
}

//botao volume sons aumentar
if point_in_rectangle(_mous_x,_mous_y,block4_x+120,block4_y-40,block4_x+280,block4_y+40){
	
	

	if mouse_check_button_pressed(mb_left){
		
		global.sfx_vol+=0.1
		
		global.sfx_vol=clamp(global.sfx_vol,0,1)
		
		spr4_tam=1.2
		
		audio_play_sound(sd_click,20,0)
	}
	
}

//botao volume sons diminuir
if point_in_rectangle(_mous_x,_mous_y,block4_x-280,block4_y-40,block4_x-120,block4_y+40){
	
	

	if mouse_check_button_pressed(mb_left){
		
		global.sfx_vol-=0.1
		
		global.sfx_vol=clamp(global.sfx_vol,0,1)
		
		spr4_tam=1.2
		audio_play_sound(sd_click,20,0)
	}
	
}


//


//botao voltar ao menu
if point_in_rectangle(_mous_x,_mous_y,block5_x-120,block5_y-40,block5_x+120,block5_y+40){
	
	
	spr5_tam=lerp(spr5_tam,1.3,0.1)
	
	if mouse_check_button_released(mb_left){
		if !instance_exists(oTransition){
			instance_create_depth(x,y,-4000,oTransition,{destino:rm_menu})
			audio_stop_all()
		}
		audio_play_sound(sd_click,20,0)
		global.jogo_pausado=false
	}
		 
	
}
else{
	spr5_tam=lerp(spr5_tam,1,0.1)
}

//efeito botoes voltando ao normal

spr3_tam=lerp(spr3_tam,1,0.2)
spr4_tam=lerp(spr4_tam,1,0.2)




