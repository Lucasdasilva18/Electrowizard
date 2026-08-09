repeat(5){
	
	instance_create_layer(x,y,layer,ob_mana,{direction:irandom(360),speed:2})
	
}

audio_play_sound(sd_crystal_break,20,0)