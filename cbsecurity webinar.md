# CBSecurity Webinar

## Ideas:

### Definitions
- Authentication vs Authorization
- Validators
    - The job of the validator is to make sure user requests have been authenticated and authorized

### MVC Applications
- Registration and email verification
- cbauth storages for distributed sessions
- csrf protection
- `_securedURL`
- Remember Me functionality
- Two-factor auth
- Re-auth for secured areas

### APIs
- Simple API tokens in cbauth user provider
- Honorable mention — CORS
- JWTs - when and why to use them
    - JWT Storage
    - How to influence expire times
- [Module Overrides](https://coldbox-security.ortusbooks.com/getting-started/first-chapter#module-settings)
- Handling `NotAuthenticated` and `NotAuthorized` exception messages consistently

### Other
- Custom Authentication Service for hybrid auth
- Ability for each module to define its own validator
- Security Visualizer
- cbSecure model

### Notes
- Sometimes all you need is a `preProcess` interceptor

### Templates Using cbSecurity
- rest


## cbSecurity improvements
- Add user identifier to token storage key
    - Or allow a way to do this.  It would make it possible to query for a user's JWT tokens.
- A way to assign a name to a token — useful for mobile app registration and revoking tokens later
- Make changing the JWT expiration or refresh token expiration more straightforward.
- XSRF-TOKEN? (CSRF tokens for API requests)
- auth() DOES NOT refer to `cbsecurity.getAuthService()`
- Cannot override AuthenticationService per module
- No way to revoke a specific user's JWTs
- Way to influence JWT keys


## What do you get out of the `box install cbsecurity`?
