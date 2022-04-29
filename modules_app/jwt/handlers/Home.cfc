component {

	function index( event, rc, prc ) {
		event.setView( "home/index" );
	}

	function secured( event, rc, prc ) secured {
		event.renderData(
			type = "json",
			data = prc.oCurrentUser.getMemento()
		);
	}

	function onInvalidToken( event, rc, prc ) {
		event.renderData(
			type = "json",
			data = { "error": true, "message": "Invalid Token" }
		);
	}

}
