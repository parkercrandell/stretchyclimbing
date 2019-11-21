	player.winned = true;
	for(var i = 0; i < 30; i++){
		instance_create_depth(player.x,player.y,-1,star);		
	}
	with object6{
		player.off = false;
	}
	player.state = 5;
	player.yvel -= boost;