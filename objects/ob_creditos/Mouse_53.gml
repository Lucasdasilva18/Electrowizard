if y<=-280{
	if !instance_exists(oTransition){
			instance_create_depth(x,y,-3000,oTransition,{destino:rm_menu})
	}
}