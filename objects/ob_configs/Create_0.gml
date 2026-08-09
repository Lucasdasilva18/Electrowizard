block1_x=display_get_gui_width()/2
block1_y=display_get_gui_height()/5
spr1_tam=1


block2_x=block1_x

//timer pra não haver clique acidental
tempo_clicar=30


block2_y=display_get_gui_height()*2/5
spr2_tam=1

block3_x=display_get_gui_width()/2
block3_y=display_get_gui_height()*3/5
spr3_tam=1

block4_x=display_get_gui_width()/2
block4_y=display_get_gui_height()*4/5
spr4_tam=1

function texto_tela_cheia(){
	
	
	
	if window_get_fullscreen(){

		return "Sim"	
	}
	else{
		
		return "Não"	
		
	}
	
}

function texto_porcent(_num){
	
	
	
	var _txt = " "+string(int64(_num*100))+" %"
	
	return _txt
	
}

