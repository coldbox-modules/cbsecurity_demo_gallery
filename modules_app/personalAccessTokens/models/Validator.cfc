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

		var token = variables.wirebox.getInstance( "PersonalAccessToken" )
			.where( "token", apiToken )
			.first();

		if ( isNull( token ) ) {
			results.messages = "Token not found";
			return results;
		}

		var user = token.getUser();

		if ( isNull( user ) ) {
			results.messages = "User not found";
			return results;
		}

		auth.login( user );
		token.update( { "lastUsedDate": now() } );
		results.allow = true;
		return results;
	}

}