if abrindo==true{
	
	opacity = lerp(opacity,1,0.1)
	if opacity>=0.95{
		opacity=1
		abrindo=false
		if destino!=room{
			room_goto(destino)
		}
		else{
			room_restart()	
		}
	}
}
else{
	opacity = lerp(opacity,0,0.1)	
	if opacity<=0.05{
		opacity=0
		instance_destroy()
	}
}