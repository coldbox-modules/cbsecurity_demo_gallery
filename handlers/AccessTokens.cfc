component secured {

	function create( event, rc, prc ) {
		auth().user().accessTokens().create( {
			"description": rc.tokenDescription,
			"token": replace( createUUID(), "-", "", "all" )
		} );
		redirectBack();
	}

	function delete( event, rc, prc ) {
		var accessToken = auth().user().accessTokens().findOrFail( rc.id );
		accessToken.delete();
		redirectBack();
	}

}