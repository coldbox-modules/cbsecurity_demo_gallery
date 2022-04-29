<cfoutput>
	<div class="min-h-full flex flex-col justify-center py-12 sm:px-6 lg:px-8">
		<div class="sm:mx-auto sm:w-full sm:max-w-md">
			<img class="mx-auto h-12 w-auto" src="/includes/images/logo_circle_large_transparent.gif" alt="Ortus Solutions">
			<h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">Sign in to your account</h2>
			<p class="mt-2 text-center text-sm text-gray-600">
				Or
				<a href="#event.buildLink( "/mvc/registrations/new" )#" class="font-medium text-green-600 hover:text-green-500"> register for a new account </a>
			</p>
		</div>

		<div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
			<div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
				<form class="space-y-6" action="#event.buildLink( "mvc/login" )#" method="POST">
					<div>
						<label for="email" class="block text-sm font-medium text-gray-700"> Email address </label>
						<div class="mt-1">
							<input id="email" name="email" type="email" autocomplete="email" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500 sm:text-sm">
							<cfif prc.errors.keyExists( "email" )>
								<small class="form-text text-danger">
									<cfloop array="#prc.errors.email#" index="error">
										<p>#error.message#</p>
									</cfloop>
								</small>
							</cfif>
						</div>
					</div>

					<div>
						<label for="password" class="block text-sm font-medium text-gray-700"> Password </label>
						<div class="mt-1">
							<input id="password" name="password" type="password" autocomplete="current-password" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500 sm:text-sm">
							<cfif prc.errors.keyExists( "password" )>
								<small class="form-text text-danger">
									<cfloop array="#prc.errors.password#" index="error">
										<p>#error.message#</p>
									</cfloop>
								</small>
							</cfif>
						</div>
					</div>

					<div class="flex items-center justify-between">
						<div class="flex items-center">
							<input id="remember-me" name="remember-me" type="checkbox" class="h-4 w-4 text-green-600 focus:ring-green-500 border-gray-300 rounded">
							<label for="remember-me" class="ml-2 block text-sm text-gray-900"> Remember me </label>
						</div>

						<div class="text-sm">
							<a href="##" class="font-medium text-green-600 hover:text-green-500"> Forgot your password? </a>
						</div>
					</div>

					<div>
						<button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">Sign in</button>
					</div>
				</form>
			</div>
		</div>

		<cfif prc.errors.keyExists( "login" )>
			<div class="mx-auto">
				<p class="text-red-700">#prc.errors.login#</p>
			</div>
		</cfif>
	</div>
</cfoutput>