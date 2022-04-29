component extends="quick.models.BaseEntity" accessors="true" {

	property name="id";
	property name="name";
	property name="token";
	property name="createdDate";
	property name="lastUsedDate";

	boolean function hasPermission( required permission ) {
		return true;
	}

}
