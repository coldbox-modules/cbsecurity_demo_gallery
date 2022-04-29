component {

	// Configure ColdBox Application
	function configure(){
		// coldbox directives
		coldbox = {
			// Application Setup
			appName : "cbSecurity Demo Gallery",
			// Development Settings
			reinitPassword : "",
			handlersIndexAutoReload : true,
			// Implicit Events
			requestStartHandler : "Main.onRequestStart",
			applicationStartHandler : "Main.onAppInit",
			// Extension Points
			applicationHelper : "includes/helpers/ApplicationHelper.cfm",
			// Error/Exception Handling
			invalidHTTPMethodHandler : "",
			exceptionHandler : "main.onException",
			invalidEventHandler : "",
			customErrorTemplate : "/coldbox/system/exceptions/Whoops.cfm",
		};

		// custom settings
		settings = {
			"githubClientId": getSystemSetting( "GITHUB_CLIENT_ID" ),
			"githubClientSecret": getSystemSetting( "GITHUB_CLIENT_SECRET" )
		};

		// LogBox DSL
		logBox = {
			// Define Appenders
			appenders : { coldboxTracer : { class : "coldbox.system.logging.appenders.ConsoleAppender" } },
			// Root Logger
			root : { levelmax : "INFO", appenders : "*" },
			// Implicit Level Categories
			info : [ "coldbox.system" ]
		};

		moduleSettings = {
			cbauth : { userServiceClass : "User" },
			cbsecurity : {
				"invalidAuthenticationEvent" : "sessions.new",
				"defaultAuthenticationAction" : "redirect",
				"invalidAuthorizationEvent" : "sessions.new",
				"defaultAuthorizationAction" : "redirect",
				"validator" : "CBAuthValidator@cbsecurity",
				"authenticationService" : "authenticationService@cbauth",
				"userService" : "User",
				"jwt": {
					"issuer": "cbsecurity demo gallery",
					"secretKey": getSystemSetting( "JWT_SECRET", "" ),
					"customAuthHeader": "x-auth-token",
					"expiration": 60,
					// If true, enables refresh tokens, longer lived tokens (not implemented yet)
					"enableRefreshTokens": false,
					// The default expiration for refresh tokens, defaults to 30 days
					"refreshExpiration": 43200,
					// encryption algorithm to use, valid algorithms are: HS256, HS384, and HS512
					"algorithm": "HS512",
					// Which claims neds to be present on the jwt token or `TokenInvalidException` upon verification and decoding
					"requiredClaims": [] ,
					// The token storage settings
					"tokenStorage": {
						// enable or not, default is true
						"enabled": true,
						// A cache key prefix to use when storing the tokens
						"keyPrefix": "cbjwt_",
						// The driver to use: db, cachebox or a WireBox ID
						"driver": "db",
						// Driver specific properties
						"properties": {
							"table": "jwt_tokens"
						}
					}
				}
			}
		};
	}

}
