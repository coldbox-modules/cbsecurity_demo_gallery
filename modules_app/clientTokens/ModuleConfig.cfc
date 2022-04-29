component {

	this.title 				= "Client Tokens";
	this.description 		= "Long-lived tokens tied to another application or service";
	this.entryPoint			= "clientTokens";
	this.dependencies       = [ "cbsecurity", "cbauth" ];

	function configure() {
		settings = {
			"cbSecurity": {
				"validator": "Validator@clientTokens",
				"invalidAuthenticationEvent" : "clientTokens:Home.onInvalidToken",
				"defaultAuthenticationAction" : "override",
				"invalidAuthorizationEvent" : "clientTokens:Home.onInvalidToken",
				"defaultAuthorizationAction" : "override"
			}
		};

		binder.map( "AuthenticationService@clientTokens" )
			.to( "cbauth.models.AuthenticationService" )
			.property( name = "sessionStorage", ref = "RequestStorage@cbauth" )
			.asSingleton();
	}

}