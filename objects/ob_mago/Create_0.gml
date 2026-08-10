#region variáveis

nums=[vk_numpad1,vk_numpad2,vk_numpad3,vk_numpad4]

//torres

torres=[[ob_torre_cruz,20,"Torre simples, atira nas 4 direções em forma de (+), seus raios podem energizar outras torres"],[ob_torre_x,30,"semelhante à torre (+), mas atira em formato de (X), e causa mais dano "],[ob_torre_canhao,50,"canhão simples, não energiza outras torres, mas precisa de energia para atirar "],[ob_torre_mana,50,"gerador de mana, transforma uma quantidade baixa de energia em mana"],[ob_torre_canhao_bomba,100,"canhão de bombas,semelhante ao canhão normal, mas solta bombas que causam dano em área "]]

//variaveis das descrições

x_desc=0
y_desc=0
mostrar_desc=false
desc_escolh=0

//definindo grupo de colisão

collision_group=[ob_arvore,ob_cristal_mana,ob_torre]

//caracteristicas de movimentacao

velx=0

vely=0

vel=2

dir_mov=0

//caracteristicas do player

dano=10

energia_ataque=200

vida=50

vida_max=vida

vel_construc=1

recar_tiro=30

temp_recar=30

ang_tiro=0

mana=70

mana_max=200

mana_reg_handle=0

mana_regen=60

//caracteristica de tomar dano

n_cor=255

cor=make_colour_rgb(255,n_cor,n_cor)

tom_dano=30

opacidade=1

//morte

ang=0

//caracteristicas de construção

y_aviso=0
x_aviso=0
alpha_aviso=0

x_selec=0

y_selec=0
escolhendo_torre=false

//loja de torres

x_loja=display_get_gui_width()

tam_bloco=120

//transformando a sprite do mouse em um alvo
cursor_sprite=sp_alvo
window_set_cursor(cr_none)

//definindo o estado do player

modo=noone


//variaveis de juice do player

tam_x=1

tam_y=1

side=1

img=sp_mago_down

//camera

cam_x=0
cam_y=0

alarm[0]=20

#endregion

//funcoes importantes

movimentacao=function(){
	
	
	velx=keyboard_check(ord("D"))-keyboard_check(ord("A"))

	vely=keyboard_check(ord("S"))-keyboard_check(ord("W"))
	
	
	
	if velx!=0 and vely!=0{
		
		if velx ==1{
			
			if vely==1{
				dir_mov=315
			}
			else{
				dir_mov=45
			}
			
		}
		else{
			
			if vely==1{
				dir_mov=225
			}
			else{
				dir_mov=135
			}
			
		}
		
		
		//movendo o player na diagonal
		
		velx=lengthdir_x(vel,dir_mov)
		vely=lengthdir_y(vel,dir_mov)
		colisao()
		x+=velx
		y+=vely	
	}
	else{
		velx=velx*vel
		vely=vely*vel
		colisao()
		x+=velx
		y+=vely
	}
	
	//escolhendo sprite de acordo com o angulo
	
	if ang_tiro >45 and ang_tiro<135{
		
		img=sp_mago_up
		
		side=1
		
	}
	if ang_tiro>=135 and ang_tiro<225{
		
		img=sp_mago_sides
			
		side=-1
		
	
		
	}
	if ang_tiro>=225 and ang_tiro<315{
		
		img=sp_mago_down
		
		side=1
	}
	if ang_tiro>=315 and ang_tiro<360{
		
		img=sp_mago_sides
			
		side=1
		
	}
	if ang_tiro>=0 and ang_tiro<45{
		
		img=sp_mago_sides
			
		side=1
		
	}
	
	
		
}
	
colisao=function(){

	//colisão com o eixo x	
	if place_meeting(x + velx, y, collision_group)
	{
		while !place_meeting(x + sign(velx), y,collision_group)
		{
			x += sign(velx)
	
		}
		velx = 0
	}
	
	//colisão com o eixo y
	if place_meeting(x, y  + vely, collision_group)
	{
		
		while !place_meeting(x, y + sign(vely),collision_group)
		{
			y += sign(vely)
			
		}
		vely = 0
	}
	
}
	
#region	estados

combate = function(){

	//mirando
	
	ang_tiro=point_direction(x,y,mouse_x,mouse_y)
	
	//recarregando o tiro, caso esteja recarregado, posso atirar
	
	if recar_tiro<temp_recar{
		recar_tiro++
	}
	else{
		//se eu clicar com o mouse, realizo o disparo mas preciso de mana
		
		if mana >=3{
			
			if mouse_check_button(mb_left){
			
				instance_create_depth(x+lengthdir_x(4,ang_tiro),y+3+lengthdir_y(4,ang_tiro),depth-1,ob_raio,{direction:ang_tiro,speed:2,dano:dano,energia:energia_ataque,criador:id})	
				recar_tiro=0
				mana-=3
				audio_play_sound(sd_raio,20,0,1,0,1+random_range(-0.15,0.15))
			}
			
		}
		
	}
	//ativando o modo de construção
	if keyboard_check_pressed(ord("E")){
		cursor_sprite=sp_martelo
		modo=construcao
		instance_create_depth(x,y,depth-1000,ob_selec)
	}

}

construcao= function(){
	
	//mirando
	
	ang_tiro=point_direction(x,y,mouse_x,mouse_y)
	
	//mantendo a descrição escondida se não passar o mouse em cima
	mostrar_desc=false
	
	
	if !escolhendo_torre{
		
		//setando onde fica o objeto seletor
		
		x_selec = (mouse_x div 32)*32
		y_selec = (mouse_y div 32)*32
		ob_selec.x=x_selec
		ob_selec.y=y_selec
			
		
		with(ob_selec){
			if !instance_place(x,y,other.collision_group) and !instance_place(x,y,other) and !instance_place(x,y,ob_colision_tower){
			
				image_blend=c_white
				if mouse_check_button_pressed(mb_left){
				
					other.escolhendo_torre=true
				
				}
		
			}
			else{
			
				image_blend=c_red
				if mouse_check_button_pressed(mb_left){
				
					other.x_aviso=device_mouse_x_to_gui(0)-200
					other.y_aviso=device_mouse_y_to_gui(0)+80
					other.alpha_aviso=1
					
				}
				
				if mouse_check_button_pressed(mb_right){
					
					var _torre_des =instance_place(x,y,ob_torre)
					if _torre_des{
						instance_destroy(_torre_des)	
					}
					
				}
				
		
			}
			
		}
		
		//caso eu queira sair do modo de construção
		if keyboard_check_pressed(ord("E")){
			modo=combate
			cursor_sprite=sp_alvo
			instance_destroy(ob_selec)
		}
		
	
	}
	else{
		
		
	
		//passandop mouse acima dos icones das torres
	
	for(var _i=0;_i<5;_i++){
			
			/*if keyboard_check_pressed(nums[_i]){
				
				if mana>=torres[_i][1]{
						
						instance_create_depth(x_selec+16,y_selec+16,depth-1,torres[_i][0])
						
						mana-=torres[_i][1]
						
						escolhendo_torre=false
						
						
				}
				
			}*/
			
			
			if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),x_loja+tam_bloco/3,120+tam_bloco/3+(tam_bloco/3+tam_bloco)*(_i),x_loja+tam_bloco/3+tam_bloco,120+(tam_bloco/3+tam_bloco)*(_i+1)){
				
				mostrar_desc=true
				desc_escolh=_i
				if mouse_check_button_pressed(mb_left){
					
					if mana>=torres[_i][1]{
						
						instance_create_depth(x_selec+16,y_selec+16,depth-1,torres[_i][0])
						
						mana-=torres[_i][1]
						
						escolhendo_torre=false
						
						modo=combate
						recar_tiro=0
						cursor_sprite=sp_alvo
						instance_destroy(ob_selec)
						
					}
					
				}
				
			}
			
	}
	//fechando a loja de torres
	if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),x_loja+12,36,x_loja+208,100){
		if mouse_check_button_pressed(mb_left){
			escolhendo_torre=false
		}
	}
	
	if	keyboard_check_pressed(vk_escape){
	
			escolhendo_torre=false

	}
	
	}
	
}
	
morte = function(){
	ang = lerp(ang,-90,0.1)
	
	if ang <-89 and ang!=-90{
		ang=-90
		if ang==-90{
			if !instance_exists(ob_derrota){
				instance_create_depth(0,0,-2000,ob_derrota,{txt_derrota:"você morreu!"})
			}
			
		}
	}
	
	if ang=-90{
		opacidade-=0.005
	} 
	velx=0
	vely=0
}
#endregion

modo = combate
