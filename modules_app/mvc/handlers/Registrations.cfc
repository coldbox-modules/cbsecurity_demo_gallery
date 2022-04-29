component {

	property name="auth" inject="AuthenticationService@cbauth";
	property name="flash" inject="coldbox:flash";

	function new( event, rc, prc ){
		param rc._securedUrl = flash.get( "_securedUrl", "/" );
		flash.put( "_securedUrl", rc._securedUrl );
		param prc.errors = flash.get( "registration_form_errors", {} );
		event.setView( "registrations/new" );
	}

	function create( event, rc, prc ){
		flash.keep( "_securedUrl" );

		var result = validateModel(
			target = rc,
			constraints = {
				"email" : {
					"required" : true,
					"type" : "email",
					"uniqueInDatabase" : { "table" : "users", "column" : "email" }
				},
				"password" : { "required" : true },
				"passwordConfirmation" : { "required" : true, "sameAs" : "password" }
			}
		);

		if ( result.hasErrors() ) {
			flash.put( "registration_form_errors", result.getAllErrorsAsStruct() );
			redirectBack();
			return;
		}

		var user = getInstance( "User" ).create( { "email" : rc.email, "password" : rc.password } );

		auth.login( user );

		relocate( uri = flash.get( "_securedUrl", "/" ) );
	}

}
