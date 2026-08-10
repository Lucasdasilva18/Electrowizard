audio_stop_all()


if !instance_exists(oTransition){
	instance_create_depth(x,y,-3000,oTransition,{destino:rm_creditos})
}

instance_destroy(other)