component {

	this.title 				= "JWT";
	this.description 		= "Stateless, signed authentication using JSON Web Tokens";
	this.entryPoint			= "jwt";
	this.dependencies       = [ "cbsecurity", "cbauth" ];

	function configure() {
		settings = {
			"cbSecurity": {
				"validator": "JwtService@cbsecurity",
				"authenticationService": "JwtService@cbsecurity",
				"invalidAuthenticationEvent" : "jwt:Home.onInvalidToken",
				"defaultAuthenticationAction" : "override",
				"invalidAuthorizationEvent" : "jwt:Home.onInvalidToken",
				"defaultAuthorizationAction" : "override"
			}
		};
	}

}