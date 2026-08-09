block1_x=display_get_gui_width()/2
block1_y=display_get_gui_height()/6
spr1_tam=1


block2_x=block1_x

//timer pra não haver clique acidental
tempo_clicar=30


block2_y=display_get_gui_height()*2/6
spr2_tam=1

block3_x=display_get_gui_width()/2
block3_y=display_get_gui_height()*3/6
spr3_tam=1

block4_x=display_get_gui_width()/2
block4_y=display_get_gui_height()*4/6
spr4_tam=1


block5_x=display_get_gui_width()/2
block5_y=display_get_gui_height()*5/6
spr5_tam=1

function texto_tela_cheia(){
	
	
	
	if window_get_fullscreen(){

		return "Sim"	
	}
	else{
		
		return "Não"	
		
	}
	
}

function texto_porcent(_num){
	
	
	var _txt = " "+string(round(_num*100))+" %"
	
	return _txt
	
}
//pausando o jogo

global.jogo_pausado=true
