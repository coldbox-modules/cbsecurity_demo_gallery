<cfoutput>
	<div class="mx-4 xl:mx-64 bg-white shadow sm:rounded-lg">
		<div class="px-4 py-5 sm:p-6">
			<h2 class="text-2xl mb-6 font-bold leading-7 text-gray-900 sm:text-3xl sm:truncate">MVC</h2>
			<div class="sm:flex sm:items-start sm:justify-between">
				<div>
					<h3 class="text-lg leading-6 font-medium text-gray-900">Secured Page</h3>
					<div class="mt-2 max-w-xl text-sm text-gray-500">
						<p>Welcome to the secured page for the MVC module.</p>
					</div>
				</div>
				<div class="mt-5 sm:mt-0 sm:ml-6 sm:flex-shrink-0 sm:flex sm:items-center">
					<form method="POST" action="#event.buildLink( "mvc.logout" )#">
						<input type="hidden" name="_method" value="DELETE" />
						<button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent shadow-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:text-sm">Log Out</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	#view( "_partials/accessTokens" )#

	#view( "_partials/jwts" )#
</cfoutput>
