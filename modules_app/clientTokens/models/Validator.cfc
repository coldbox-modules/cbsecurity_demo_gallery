component singleton threadsafe {

	property name="auth" inject="AuthenticationService@personalAccessTokens";
	property name="wirebox" inject="wirebox";

	struct function ruleValidator( required rule, required controller ) {
		return validateSecurity( arguments.rule.permissions, arguments.controller );
	}

	struct function annotationValidator( required securedValue, required controller ) {
		return validateSecurity( arguments.securedValue, arguments.controller );
	}

	private function validateSecurity( required permissions, required controller ) {
		var results = {
			"allow"    : false,
			"type"     : "authentication",
			"messages" : ""
		};

		var event = arguments.controller.getRequestService().getContext();
		var apiToken = event.getHTTPHeader( "X-Api-Token", "" );

		var clientToken = variables.wirebox.getInstance( "ClientToken@clientTokens" )
			.where( "token", apiToken )
			.first();

		if ( isNull( clientToken ) ) {
			results.messages = "Token not found";
			return results;
		}

		// We can log in anything that conforms to IAuthUser
		auth.login( clientToken );
		clientToken.update( { "lastUsedDate": now() } );
		results.allow = true;
		return results;
	}

}