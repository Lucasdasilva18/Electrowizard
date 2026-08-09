
//barra do HUD do jogo

draw_set_alpha(0.6)

draw_rectangle_colour(0,0,120+display_get_gui_width(),120,c_black,c_black,c_black,c_black,0)

draw_set_alpha(1)

var _minutos = (tempo_restante div 60) div 60

var _segundos =  (tempo_restante div 60) % 60


//texto mostrando quanta mana e vida eu tenho
draw_set_font(ft_descricoes)


//se eu precisar, mostro o tempo pra próxima onda

if tempo_restante !=0{
	
	//texto do cronômetro 
	
	if boss==false{
	
		draw_text_ext_colour(display_get_gui_width()/4+100,10,"Próxima onda em :",24,360,c_yellow,c_yellow,c_yellow,c_yellow,1)
	
	}
	else{
		
		draw_text_ext_colour(display_get_gui_width()/4+100,10,"Onda Final em :",24,360,c_yellow,c_yellow,c_yellow,c_yellow,1)
		
	}
	
	//cronômetro
	
	draw_text_ext_colour(display_get_gui_width()/4+360,10,string(_minutos)+"  :  "+string(_segundos),24,360,c_white,c_white,c_white,c_white,1)
	

}
//texto da wave

//texto do cronômetro 

if boss==false{

	draw_text_ext_colour(display_get_gui_width()/4+100,60,"Onda " + string(wave_atual)+"/15",24,360,c_white,c_white,c_white,c_white,1)


}
else{
	draw_text_ext_colour(display_get_gui_width()/4+100,60,"CHEFE",24,360,c_white,c_white,c_white,c_white,1)
}
//bloco de pular espera

if tempo_restante>60{

draw_sprite_stretched(sp_iniciar_onda,0,display_get_gui_width()/4+240,60,240,48)

}

//texto da vida da base

draw_text_ext_colour(display_get_gui_width()/2+120,25,"vida da base ",24,360,c_white,c_white,c_white,c_white,1)

//mostrando a vida da base 

draw_rectangle_colour(display_get_gui_width()/2+100,60,display_get_gui_width()/2+100+300*(ob_base.vida/100),90,c_red,c_red,c_red,c_red,0)
draw_sprite_stretched(sp_bar_mana,0,display_get_gui_width()/2+100,60,300,30)

//icone da base

draw_sprite_stretched(sp_base_icon,0,display_get_gui_width()/2+40,45,52,52)



