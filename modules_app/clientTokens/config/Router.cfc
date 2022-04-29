component {

	function configure() {
		route( "/home/secured", "Home.secured" );
		delete( "/:id", "Home.delete" );
		route( "/" ).withHandler( "Home" ).toAction( { "GET": "index", "POST": "create"  } );
	}

}