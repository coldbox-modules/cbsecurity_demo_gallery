component {

	this.title 				= "OAuth";
	this.description 		= "Wrapping the GitHub OAuth with cbauth";
	this.entryPoint			= "oauth";
	this.dependencies       = [ "cbsecurity" ];

	function configure() {
		settings = {
			"cbSecurity": {
				"invalidAuthenticationEvent" : "oauth:sessions.new",
				"invalidAuthorizationEvent" : "oauth:sessions.new",
			}
		};
	}

}