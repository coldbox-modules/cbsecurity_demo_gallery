component {

	function up( schema, query ){
		schema.create( "personal_access_tokens", function(table) {
			table.increments( "id" );
			table.string( "description" );
			table.string( "token" );
			table.unsignedInteger( "userId" ).references( "id" ).onTable( "users" );
			table.timestamp( "createdDate" ).withCurrent();
			table.timestamp( "lastUsedDate" ).nullable();
		} );
	}

	function down( schema, query ){
		schema.drop( "personal_access_tokens" );
	}

}
