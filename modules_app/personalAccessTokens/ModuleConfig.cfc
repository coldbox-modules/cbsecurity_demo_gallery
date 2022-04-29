component {

	this.title 				= "Personal Access Tokens";
	this.description 		= "Long-lived tokens tied to a user";
	this.entryPoint			= "personalAccessTokens";
	this.dependencies       = [ "cbsecurity", "cbauth" ];

	function configure() {
		settings = {
			"cbSecurity": {
				"validator": "Validator@personalAccessTokens",
				"invalidAuthenticationEvent" : "personalAccessTokens:Home.onInvalidToken",
				"defaultAuthenticationAction" : "override",
				"invalidAuthorizationEvent" : "personalAccessTokens:Home.onInvalidToken",
				"defaultAuthorizationAction" : "override"
			}
		};

		binder.map( "AuthenticationService@personalAccessTokens" )
			.to( "cbauth.models.AuthenticationService" )
			.property( name = "sessionStorage", ref = "RequestStorage@cbauth" )
			.asSingleton();
	}

}