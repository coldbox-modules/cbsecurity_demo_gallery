component {

	property name="authService" inject="AuthenticationService@personalAccessTokens";

	function index( event, rc, prc ) {
		event.setView( "home/index" );
	}

	function secured( event, rc, prc ) secured {
		event.renderData(
			type = "json",
			data = variables.authService.user().getMemento()
		);
	}

	function onInvalidToken( event, rc, prc ) {
		event.renderData(
			type = "json",
			data = { "error": true, "message": "Invalid Token" }
		);
	}

}
