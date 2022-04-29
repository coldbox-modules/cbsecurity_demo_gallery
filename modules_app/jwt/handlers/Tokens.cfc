component {

	function create( event, rc, prc ) {
		var jwtPacket = jwtAuth().fromUser( auth().user(), {
			"description": rc.tokenDescription
		} );
		redirectBack();
	}

	function delete( event, rc, prc ) {
		var token = getInstance( "JWT" ).findOrFail( rc.id );
		token.delete();
		redirectBack();
	}

}