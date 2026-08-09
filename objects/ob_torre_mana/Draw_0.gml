//draw_self()

draw_sprite_ext(sprite_index,image_index,x,y-construido,image_xscale,image_yscale,0,c_white,1-(construido/10))

draw_rectangle_colour(x-8,y-12,x-8+16*(energia/energia_max),y-8,c_yellow,c_yellow,c_yellow,c_yellow,0)
draw_sprite_stretched(sp_barra,0,x-8,y-12,16,4)
