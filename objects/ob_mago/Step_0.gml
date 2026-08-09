if global.jogo_pausado{
	exit
}
if	keyboard_check_pressed(vk_escape){
	
	instance_create_depth(x,y,-1000,ob_pause)

}


//movimentação em 8 direções

if !escolhendo_torre{

	movimentacao()

}



modo()



//adicionando profundidade

depth=-y

//regenerando a mana a cada segundo

if mana_reg_handle<mana_regen{
	
	mana_reg_handle++
	
}
else{
	mana_reg_handle=0
	mana++
}

//limitando a mana de 0 ao máximo  e vida também

mana=clamp(mana,0,mana_max)

vida =clamp(vida,0,vida_max)


var _inim= instance_place(x,y,ob_inimigo)
//tomando dano e entrando em cooldown
if _inim and tom_dano=0{
	n_cor=0
	tom_dano=60
	vida=vida-_inim.dano
}

if  tom_dano>0{
	
	tom_dano--
	
	if tom_dano mod 4 == 0 {
		
		opacidade=0.6
	}
	else{
		opacidade=1
	}
}
else{
	opacidade=1
}

//retornando a cor ao normal

n_cor=lerp(n_cor,255,0.1)

//aplicando o valor

cor=make_colour_rgb(255,n_cor,n_cor)

if modo!=morte{
	if vida==0{
		modo=morte	
	}
}




//efeito basico de camera

if x>=479{
	
	cam_x=lerp(cam_x,96,0.2)
	camera_set_view_pos(view_camera[0],cam_x,cam_y)
	
	
}
else{
	cam_x=lerp(cam_x,0,0.2)
	camera_set_view_pos(view_camera[0],cam_x,cam_y)
}

