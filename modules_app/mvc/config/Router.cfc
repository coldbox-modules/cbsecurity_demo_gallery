component{

	function configure(){
		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "new", "POST" : "create" } );
		route( "/logout", "sessions.delete" );
		resources( resource = "registrations", only = [ "new", "create" ] );
		route( "/", "home.index" );
	}

}