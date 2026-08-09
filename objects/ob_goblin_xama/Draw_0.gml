// Inherit the parent event
event_inherited();

if tempo_circulo >0{
	tempo_circulo--
	
	draw_set_alpha(tempo_circulo/30)
	draw_sprite(sp_circulo_cura,0,x,y)
	
	draw_set_alpha(1)
}