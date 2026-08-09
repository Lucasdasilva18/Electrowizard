if explosoes>0{
	
	for(var _i=0; _i<6;_i++){
	var _side=1
	if _i <3{
		_side=1
	}
	else{
		_side=-1
	}
	
	instance_create_depth(x,y+16,depth-50,ob_fumaca,{direction:30+60*_i,speed:4,side:_side,image_xscale:1.2})
	
}

	
	
	explosoes--
	alarm[0]=20
	
}
else{
	if !instance_exists(ob_derrota){
		instance_create_depth(0,0,-2000,ob_derrota,{txt_derrota:"sua base foi destruida!"})
	}
}