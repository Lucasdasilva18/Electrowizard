
//desenhando um fundo preto
draw_set_colour(c_black)
draw_set_alpha(0.6)

draw_rectangle(display_get_gui_width()/3,120,display_get_gui_width()*2/3,display_get_gui_height(),0)
draw_set_colour(c_white)
draw_set_alpha(1)
//desenhando os blocos


draw_set_valign(fa_middle)
draw_set_halign(fa_center)


draw_sprite_ext(sp_botao,0,block1_x,block1_y,spr1_tam,spr1_tam,0,c_white,1)
draw_sprite_ext(sp_botao,0,block2_x,block2_y,spr2_tam,spr2_tam,0,c_white,1)
draw_sprite_ext(sp_botao_vol,0,block3_x+200,block3_y,1,1,0,c_white,1)
draw_sprite_ext(sp_botao_vol,0,block3_x-200,block3_y,-1,1,0,c_white,1)
draw_sprite_ext(sp_botao,0,block3_x,block3_y,spr3_tam,spr3_tam,0,c_white,1)

draw_sprite_ext(sp_botao_vol,0,block4_x+200,block4_y,1,1,0,c_white,1)
draw_sprite_ext(sp_botao_vol,0,block4_x-200,block4_y,-1,1,0,c_white,1)
draw_sprite_ext(sp_botao,0,block4_x,block4_y,spr4_tam,spr4_tam,0,c_white,1)
draw_sprite_ext(sp_botao,0,block5_x,block5_y,spr5_tam,spr5_tam,0,c_white,1)



//desenhando os textos

//ativando a fonte e o shader

draw_set_font(ft_descricoes)

font_enable_effects(ft_descricoes,1,{
	outlineEnable:1,
	outlineColour:c_black,
	outlineDistance:2

})

draw_text_colour(display_get_gui_width()/2,block1_y,"voltar ao jogo ",c_white,c_white,c_white,c_white,1)
draw_text_colour(display_get_gui_width()/2,block2_y,"Tela Cheia: " +texto_tela_cheia(),c_white,c_white,c_white,c_white,1)
draw_text_colour(display_get_gui_width()/2,block3_y,"Música :" +texto_porcent(global.msc_vol),c_white,c_white,c_white,c_white,1)
draw_text_colour(display_get_gui_width()/2,block4_y,"SFX :"  +texto_porcent(global.sfx_vol),c_white,c_white,c_white,c_white,1)
draw_text_colour(display_get_gui_width()/2,block5_y,"Menu Principal",c_white,c_white,c_white,c_white,1)



draw_set_valign(-1)
draw_set_halign(-1)
font_enable_effects(ft_descricoes,0)
draw_set_font(-1)