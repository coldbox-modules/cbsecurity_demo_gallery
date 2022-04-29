component {

	property name="authService" inject="AuthenticationService@personalAccessTokens";

	function index( event, rc, prc ) {
		prc.clientTokens = getInstance( "ClientToken@clientTokens" ).all();
		event.setView( "home/index" );
	}

	function secured( event, rc, prc ) secured {
		event.renderData(
			type = "json",
			data = variables.authService.user().getMemento()
		);
	}

	function create( event, rc, prc ) {
		getInstance( "ClientToken@clientTokens" ).create( {
			"name": rc.tokenName,
			"token": replace( createUUID(), "-", "", "all" )
		} );
		redirectBack();
	}

	function delete( event, rc, prc ) {
		var token = getInstance( "ClientToken@clientTokens" ).findOrFail( rc.id );
		token.delete();
		redirectBack();
	}

	function onInvalidToken( event, rc, prc ) {
		event.renderData(
			type = "json",
			data = { "error": true, "message": "Invalid Token" }
		);
	}

}
