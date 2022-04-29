component {

	property name="auth" inject="AuthenticationService@cbauth";
	property name="hyper" inject="HyperBuilder@hyper";
	property name="flash" inject="coldbox:flash";
	property name="githubClientId" inject="coldbox:setting:githubClientId";
	property name="githubClientSecret" inject="coldbox:setting:githubClientSecret";

	function new( event, rc, prc ){
		param rc._securedUrl = flash.get( "_securedUrl", "/" );
		flash.put( "_securedUrl", rc._securedUrl );
		param prc.errors = flash.get( "login_form_errors", {} );
		event.setView( "sessions/new" );
	}

	function create( event, rc, prc ){
		flash.keep( "_securedUrl" );

		relocate( url = "https://github.com/login/oauth/authorize", queryString = {
			"client_id": variables.githubClientId,
			"scope": "user:email"
		} );
	}

	function callback( event, rc, prc ) {
		var res = hyper.asJson()
			.setHeader( "Accept", "application/json" )
			.setBody( {
				"client_id": variables.githubClientId,
				"client_secret": variables.githubClientSecret,
				"code": rc.code
			} )
			.post( "https://github.com/login/oauth/access_token" )
			.json();

		if ( res.keyExists( "error" ) ) {
			flash.put( "login_form_errors", { "login" : res.error_description } );
			relocate( "oauth.sessions.new" );
			return;
		}

		var userRes = hyper.asJson()
			.withHeaders( {
				"Accept": "application/json",
				"Authorization": "token #res.access_token#"
			} )
			.get( "https://api.github.com/user" )
			.json();

		var email = userRes.keyExists( "email" ) && !isNull( userRes.email ) ? userRes.email : "";

		var user = getInstance( "User" ).updateOrCreate(
			{ "githubId": userRes.id },
			{ "email": email, "accessToken": res.access_token }
		);

		auth.login( user );
		relocate( "oauth" );
	}

	function delete( event, rc, prc ){
		auth.logout();
		relocate( uri = "/" );
	}

}
