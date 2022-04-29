component extends="quick.models.BaseEntity" accessors="true" {

	property name="id";
	property name="description";
	property name="token";
	property name="userId";
	property name="createdDate";
	property name="lastUsedDate";

	function user() {
		return belongsTo( "User" );
	}

}
