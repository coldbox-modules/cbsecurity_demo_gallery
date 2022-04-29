<cfoutput>
	<div class="mx-4 xl:mx-64 flex flex-col gap-4 bg-white shadow sm:rounded-lg px-4 py-5 sm:p-6">
		<h2 class="text-2xl mb-6 font-bold leading-7 text-gray-900 sm:text-3xl sm:truncate">Personal Access Tokens</h2>
		<div class="sm:flex sm:items-start sm:justify-between">
			<div>
				<h3 class="text-lg leading-6 font-medium text-gray-900">Secured Page Tester</h3>
				<div class="mt-2 text-sm text-gray-500">
					<p>Welcome to the tester page for the Personal Access Tokens module.</p>
					<p>Here you can send a request using the form below to test out your personal access token.</p>
				</div>
				<div class="mt-2 text-sm text-gray-500">
					<p>
						To set up personal access tokens, log in using the
						<a href="#event.buildLink( "mvc" )#" class="text-green-600 font-medium hover:underline">MVC</a> or
						<a href="#event.buildLink( "oauth" )#" class="text-green-600 font-medium hover:underline">OAuth</a>
						login options and create tokens on their secured page.
					</p>
				</div>
			</div>
		</div>
		<form method="POST" action="#event.buildLink( "personalAccessTokens.Home.secured" )#" onsubmit="send(event,this)" class="w-full sm:flex sm:items-center gap-2">
			<div class="w-full sm:max-w-xs">
				<label for="token" class="sr-only">Personal Access Token</label>
				<input type="text" name="token" id="token" class="shadow-sm focus:ring-green-500 focus:border-green-500 block w-full sm:text-sm border-gray-300 rounded-md" placeholder="Personal Access Token">
			</div>
			<button type="submit" class="w-full mt-3 inline-flex items-center justify-center px-4 py-2 border border-transparent shadow-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">Submit</button>
		</form>
		<div class="bg-gray-200 overflow-hidden rounded-lg h-64">
			<div class="px-4 py-5 sm:p-6">
				<pre><code id="testingResponse">Response will show here...</code></pre>
			</div>
		  </div>
	</div>
</cfoutput>

<script>
	function send(e, form) {
		e.preventDefault();
		fetch(form.action, {
			method: form.method,
			headers: {
				"X-Requested-With": "XMLHttpRequest",
				"X-Api-Token": form.token.value
			}
		} )
			.then( res => res.json() )
			.then( body => {
				document.getElementById( "testingResponse" ).textContent = JSON.stringify(body, null, 4);
			} );
	}
</script>
