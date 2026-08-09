
for(var _i=0; _i<6;_i++){
	var _side=1
	if _i <3{
		_side=1
	}
	else{
		_side=-1
	}
	
	instance_create_depth(x,y,depth+50,ob_fumaca,{direction:30+60*_i,speed:2,side:_side,image_xscale:0.8})
	
}

audio_play_sound(sd_ini_morte,20,0,1,0,1+random_range(-0.2,0))

var _chance = irandom_range(1,100)

if _chance<=5{
	
	instance_create_depth(x,y,-2000,ob_vida,{direction:irandom(360),speed:2})
}