component {

	function up( schema, query ){
		schema.create( "client_tokens", function(table) {
			table.increments( "id" );
			table.string( "name" );
			table.string( "token" );
			table.timestamp( "createdDate" ).withCurrent();
			table.timestamp( "lastUsedDate" ).nullable();
		} );
	}

	function down( schema, query ){
		schema.drop( "client_tokens" );
	}

}
