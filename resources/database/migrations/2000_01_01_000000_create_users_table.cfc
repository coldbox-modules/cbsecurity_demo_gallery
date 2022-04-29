component {

	function up( schema, query ){
		schema.create( "users", function(table) {
			table.increments( "id" );
			table.string( "email" ).nullable().unique();
			table.string( "githubId" ).nullable().unique();
			table.string( "accessToken" ).nullable();
			table.string( "password" ).nullable();
		} );
	}

	function down( schema, query ){
		schema.drop( "users" );
	}

}
