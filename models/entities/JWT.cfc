component table="jwt_tokens" extends="quick.models.BaseEntity" accessors="true" {

	property name="id";
	property name="cacheKey";
	property name="issuedDate" column="issued";
	property name="expirationDate" column="expiration";
	property name="token";
	property name="subject";

	function user() {
		return belongsTo( "User", "subject", "id" );
	}

}
