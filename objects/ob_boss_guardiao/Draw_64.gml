
//nome do boss

draw_set_font(ft_descricoes)

font_enable_effects(ft_descricoes,1,{
	outlineEnable:1,
	outlineColour:c_black,
	outlineDistance:2

})


draw_text_colour(display_get_gui_width()/3+140,140,"Guardião do inferno",c_red,c_red,c_red,c_red,1)

font_enable_effects(ft_descricoes,0)
draw_set_font(-1)


//barra de vida do boss
draw_rectangle_colour(display_get_gui_width()/3,200,display_get_gui_width()/3+(display_get_gui_width()/3)*(vida/vida_max),230,c_red,c_red,c_red,c_red,0)

draw_sprite_stretched(sp_barra_boss,0,display_get_gui_width()/3,200,display_get_gui_width()/3,30)


