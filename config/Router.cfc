component {

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		// Conventions based routing
		delete( "/accessTokens/:id", "AccessTokens.delete" );
		post( "/accessTokens", "AccessTokens.create" );
		route( ":handler/:action?" ).end();
	}

}
