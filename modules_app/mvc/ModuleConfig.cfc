component {

	this.title 				= "MVC";
	this.description 		= "Traditional MVC application with a users table in a database";
	this.entryPoint			= "mvc";
	this.dependencies       = [ "cbsecurity" ];

	function configure() {
		settings = {
			"cbSecurity": {
				"invalidAuthenticationEvent" : "mvc:sessions.new",
				"invalidAuthorizationEvent" : "mvc:sessions.new",
			}
		};
	}

}