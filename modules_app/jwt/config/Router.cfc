component{

	function configure(){
		delete( "/tokens/:id", "Tokens.delete" );
		post( "/tokens", "Tokens.create" );
		route( "/", "home.index" );
	}

}