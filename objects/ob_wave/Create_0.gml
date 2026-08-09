segundo=60

minuto=60*60

tempo_restante=0

wave_atual=1
ini_atual=0
temp_handle=60

temp=60

quant=0

boss = false

boss_nasceu=false
//sistema de waves(definitivo)

//nas listas o primeiro dado é o tempo da wave começar, os inimigos, a quantidade deles, e o tempo entre cada um deles aparecer

waves={
mundo1:[ [2*minuto, [[ob_ini_morcego,3,2*segundo]]] , [25*segundo,[[ob_ini_morcego,6,segundo]]] , [25*segundo,[[ob_ini_goblin,5,segundo]]] , [35*segundo,[[ob_ini_goblin,6,segundo],[ob_ini_morcego,4,2*segundo]]] , [30*segundo,[[ob_ini_morcego,15,45]]] , [35*segundo,[[ob_ini_goblin,6,2*segundo] , [ob_ini_aranha,4,2*segundo]]] , [35*segundo,[[ob_ini_aranha,8,1*segundo]]],  [30*segundo,[[ob_ini_ogro,2,3*segundo]]] , [30*segundo,[[ob_goblin_xama,2,4*segundo],[ob_ini_goblin,6,segundo]]] , [30*segundo,[[ob_ini_ogro,1,segundo],[ob_ini_goblin,12,segundo],[ob_goblin_xama,2,8*segundo]]] , [30*segundo,[[ob_ini_ogro,10,2*segundo]]] , [30*segundo,[[ob_ini_ogro,6,2*segundo],[ob_goblin_xama,4,3*segundo]]] , [30*segundo,[[ob_ini_ogro,8,4*segundo],[ob_goblin_xama,4,2*segundo],[ob_ini_aranha,10,1*segundo]]] , [30*segundo,[[ob_ini_morcego,5,40],[ob_goblin_xama,3,segundo],[ob_ini_aranha,8,20]]],[30*segundo,[[ob_ini_ogro,2,segundo],[ob_goblin_xama,4,segundo],[ob_ini_ogro,3,segundo]]] ]

}

//pegando a quantidade de inimigos inicial
	quant=waves.mundo1[wave_atual-1][1][ini_atual][1]

//pegando o tempo pra comecar a wave 1 
	tempo_restante=waves.mundo1[wave_atual-1][0]
	
//pegando o tempo entre inimigos da wave inicial
	temp=waves.mundo1[wave_atual-1][1][ini_atual][2]
	
	temp_handle=temp


