
//desenhando os blocos


draw_set_valign(fa_middle)
draw_set_halign(fa_center)


draw_sprite_ext(sp_botao,0,block1_x,block1_y,spr1_tam,spr1_tam,0,c_white,1)

draw_sprite_ext(sp_botao_vol,0,block2_x+200,block2_y,1,1,0,c_white,1)
draw_sprite_ext(sp_botao_vol,0,block2_x-200,block2_y,-1,1,0,c_white,1)
draw_sprite_ext(sp_botao,0,block2_x,block2_y,spr2_tam,spr2_tam,0,c_white,1)

draw_sprite_ext(sp_botao_vol,0,block3_x+200,block3_y,1,1,0,c_white,1)
draw_sprite_ext(sp_botao_vol,0,block3_x-200,block3_y,-1,1,0,c_white,1)
draw_sprite_ext(sp_botao,0,block3_x,block3_y,spr3_tam,spr3_tam,0,c_white,1)
draw_sprite_ext(sp_botao,0,block4_x,block4_y,spr4_tam,spr4_tam,0,c_white,1)



//desenhando os textos

//ativando a fonte e o shader

draw_set_font(ft_descricoes)

font_enable_effects(ft_descricoes,1,{
	outlineEnable:1,
	outlineColour:c_black,
	outlineDistance:2

})


draw_text_colour(display_get_gui_width()/2,block1_y,"Tela Cheia: " +texto_tela_cheia(),c_white,c_white,c_white,c_white,1)
draw_text_colour(display_get_gui_width()/2,block2_y,"Música :" +texto_porcent(global.msc_vol),c_white,c_white,c_white,c_white,1)
draw_text_colour(display_get_gui_width()/2,block3_y,"SFX :"  +texto_porcent(global.sfx_vol),c_white,c_white,c_white,c_white,1)
draw_text_colour(display_get_gui_width()/2,block4_y,"Voltar",c_white,c_white,c_white,c_white,1)



draw_set_valign(-1)
draw_set_halign(-1)
font_enable_effects(ft_descricoes,0)
draw_set_font(-1)