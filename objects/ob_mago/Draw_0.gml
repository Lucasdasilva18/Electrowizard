//draw_self()

//desenhando o mago

draw_sprite_ext(img,0,x,y+13,tam_x*side,tam_y,ang,cor,opacidade)


//ajustando o player pro formato padrao

tam_x=lerp(tam_x,1,0.2)
tam_y=lerp(tam_y,1,0.2)

if modo==construcao{
	
	//desenhando a grade 
	
	draw_set_alpha(0.3)
		
	draw_sprite(sp_grade,0,0,0)
		
	
	draw_set_alpha(1)
	
	
	
	
	
	if !escolhendo_torre{
			
		x_selec = (mouse_x div 32)*32
		y_selec = (mouse_y div 32)*32
		
		if !instance_position(mouse_x,mouse_y,collision_group) and point_distance(x,y,mouse_x,mouse_y)>10{
			
			draw_sprite(sp_place,0,x_selec,y_selec)
		
		}
		else{
			
			draw_sprite_ext(sp_place,0,x_selec,y_selec,1,1,0,c_red,1)
		
		}
		
	}
	else{
		
		draw_sprite(sp_place,0,x_selec,y_selec)
		
	}
	
}

