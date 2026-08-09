//cor barra de mana
var _bar_cor= make_colour_rgb(88,179,191)

if escolhendo_torre{
	
	
	draw_set_alpha(0.7)
	//cor da barra da loja
	
	var _cor = make_colour_rgb(125,71,89)
	
	
	x_loja=lerp(x_loja,display_get_gui_width()-240,0.1)

	//desenhando a barra da loja
	
	draw_rectangle_colour(x_loja,120,display_get_gui_width(),display_get_gui_height(),_cor,_cor,_cor,_cor,0)

	draw_set_alpha(1)
	
	//desenhando icones das torres
	
	for(var _i=0;_i<5;_i++){
		
			
		draw_sprite_stretched(sp_Icones_torres,0+_i,x_loja+tam_bloco/3,120+tam_bloco/3+(tam_bloco/3+tam_bloco)*_i,tam_bloco,tam_bloco)
			
	
	}
	
	//desenhando o botao de fechar a loja
	
	draw_sprite_stretched(sp_fechar,0,x_loja+12,36,196,64)
	
	if mostrar_desc{
			//mostrando a descrição, caso eu possa
			
			draw_set_font(ft_descricoes)
			
			//posicoes do retangulo
			
			x_desc=device_mouse_x_to_gui(0)-480
			y_desc=device_mouse_y_to_gui(0)
			
			//desenhando o retangulo onde ficará o texto
			
			draw_rectangle_colour(x_desc,y_desc,x_desc+400,y_desc+220,c_black,c_black,c_black,c_black,0)
			
			//descrição
			draw_text_ext(x_desc+5,y_desc+5 ,torres[desc_escolh][2],28,360)
			
			//texto do custo de mana
			draw_text_ext(x_desc+5,y_desc+180,"custo: " ,28,360)
			//custo de mana
			
			draw_text_ext_colour(x_desc+90,y_desc+180,torres[desc_escolh][1],24,360,_bar_cor,_bar_cor,_bar_cor,_bar_cor,1)
			
			//icone da mana 
			draw_sprite_stretched(sp_mana,0,x_desc+140,y_desc+2184,21,27)
			
			draw_set_font(-1)
	
	}
}


//desenhando icone do player

draw_sprite_stretched(sp_player_icon,0,20,10,80,80)

//desenhando a barra de mana

draw_rectangle_colour(100,50,100+(display_get_gui_width()/6)*(mana/mana_max),90,_bar_cor,_bar_cor,_bar_cor,_bar_cor,0)
draw_sprite_stretched(sp_bar_mana,0,100,50,display_get_gui_width()/6,40)

//desenhando a barra de vida

draw_rectangle_colour(100,10,100+(display_get_gui_width()/6)*(vida/vida_max),50,c_red,c_red,c_red,c_red,0)
draw_sprite_stretched(sp_bar_mana,0,100,10,display_get_gui_width()/6,40)


//texto mostrando quanta mana e vida eu tenho
draw_set_font(ft_descricoes)

draw_text_ext_colour(display_get_gui_width()/5+45,56,mana,26,360,_bar_cor,_bar_cor,_bar_cor,_bar_cor,1)

draw_text_ext_colour(display_get_gui_width()/5+45,10,vida,24,360,c_red,c_red,c_red,c_red,1)

//icone da mana 
draw_sprite_stretched(sp_mana,0,display_get_gui_width()/5+90,60,21,27)

 //icone da vida
draw_sprite_stretched(sp_vida,0,display_get_gui_width()/5+90,16,27,24)

draw_set_font(-1)


draw_set_font(ft_descricoes)

if alpha_aviso>0.3{
	
	draw_text_colour(x_aviso,y_aviso,"não há espaço para colocar a torre aqui!",c_yellow,c_yellow,c_yellow,c_yellow,alpha_aviso)
	alpha_aviso-=0.01
	y_aviso-=0.4
	
	
}

if modo==construcao{

font_enable_effects(ft_descricoes,1,{
	outlineEnable:1,
	outlineColour:c_black,
	outlineDistance:2

})

//desenhando controles
	
//construir 
	
var _alpha_dica=1

if mouse_y<76{
	_alpha_dica=0.5
	
}
else{
	_alpha_dica=1
}

draw_set_alpha(_alpha_dica)
	
draw_text_ext(display_get_gui_width()/4,150,"construir torre ",24,360)

draw_sprite_stretched(sp_botao_mouse,0,display_get_gui_width()/4+220,130,80,80)

draw_text_ext(display_get_gui_width()*3/4-320,150,"destruir torre ",24,360)

draw_sprite_stretched(sp_botao_mouse,1,display_get_gui_width()*3/4-120,130,80,80)

draw_set_alpha(1)


font_enable_effects(ft_descricoes,0)

//desenhando a sprite do modo que o player está

	draw_sprite_stretched(sp_botao_modo,0,display_get_gui_width()*3/4,50,240,48)

}
else{
	
	draw_sprite_stretched(sp_botao_modo,1,display_get_gui_width()*3/4,50,240,48)
}

draw_set_font(-1)

