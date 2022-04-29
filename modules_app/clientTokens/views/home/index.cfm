<cfoutput>
	<div class="mx-4 xl:mx-64 flex flex-col gap-4 bg-white shadow sm:rounded-lg px-4 py-5 sm:p-6">
		<h2 class="text-2xl mb-6 font-bold leading-7 text-gray-900 sm:text-3xl sm:truncate">Client Tokens</h2>
		<div class="sm:flex sm:items-start sm:justify-between">
			<div>
				<h3 class="text-lg leading-6 font-medium text-gray-900">Secured Page Tester</h3>
				<div class="mt-2 text-sm text-gray-500">
					<p>Welcome to the tester page for the Client Tokens module.</p>
					<p>Here you can send a request using the form below to test out your client token.</p>
				</div>
			</div>
		</div>
	</div>

	<div class="mt-8 mx-4 xl:mx-64 bg-white shadow sm:rounded-lg">
		<div class="px-4 sm:px-6 lg:px-8 py-5">
			<div class="sm:flex sm:items-center">
				<div class="sm:flex-auto">
					<h1 class="text-xl font-semibold text-gray-900">Client Tokens</h1>
					<p class="mt-2 text-sm text-gray-700">Manage the client tokens for the demo application.</p>
				</div>
				<div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
					<form method="POST" action="#event.buildLink( "clientTokens" )#">
						<div>
							<label for="tokenName" class="block text-sm font-medium text-gray-700">Token Name</label>
							<div class="mt-1 flex rounded-md shadow-sm">
								<div class="relative flex items-stretch flex-grow focus-within:z-10">
									<input type="text" name="tokenName" id="tokenName" required class="focus:ring-green-500 focus:border-green-500 block w-full rounded-none rounded-l-md sm:text-sm border-gray-300" placeholder="Internal App">
								</div>
								<button type="submit" class="-ml-px relative inline-flex items-center space-x-2 px-4 py-2 border border-gray-300 text-sm font-medium rounded-r-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-1 focus:ring-green-500 focus:border-green-500">
									<span>Add token</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="mt-8 flex flex-col">
				<div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
					<div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
						<div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
							<table class="min-w-full divide-y divide-gray-300">
								<thead class="bg-gray-50">
									<tr>
										<th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Name</th>
										<th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Token</th>
										<th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Last Used</th>
										<th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
											<span class="sr-only">Revoke Token</span>
										</th>
									</tr>
								</thead>
								<tbody class="bg-white">
									<cfif prc.clientTokens.isEmpty()>
										<tr>
											<td class="whitespace-nowrap px-3 py-4 text-sm text-center text-gray-500" colspan="4">No tokens created yet</td>
										</tr>
									<cfelse>
										<cfloop array="#prc.clientTokens#" index="i" item="token">
											<!-- Odd row -->
											<tr <cfif i % 2 EQ 0>class="bg-gray-50"</cfif>>
												<td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6">#token.getName()#</td>
												<td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">#token.getToken()#</td>
												<td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
													<cfif token.isNullAttribute( "lastUsedDate" )>
														Never used
													<cfelse>
														#dateTimeFormat( token.getLastUsedDate(), "long" )#
													</cfif>
												</td>
												<td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
													<form method="POST" action="#event.buildLink( "clientTokens.#token.getID()#" )#">
														<input type="hidden" name="_method" value="DELETE" />
														<button type="submit" class="text-red-600 hover:text-red-900">Revoke<span class="sr-only">, #token.getName()# token</span></a>
													</form>
												</td>
											</tr>
										</cfloop>
									</cfif>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="mt-8 mx-4 xl:mx-64 flex flex-col gap-4 bg-white shadow sm:rounded-lg px-4 py-5 sm:p-6">
		<div class="sm:flex sm:items-start sm:justify-between">
			<div>
				<h3 class="text-lg leading-6 font-medium text-gray-900">Test your Client Token</h3>
			</div>
		</div>
		<form method="POST" action="#event.buildLink( "clientTokens.Home.secured" )#" onsubmit="send(event,this)" class="w-full sm:flex sm:items-center gap-2">
			<div class="w-full sm:max-w-xs">
				<label for="token" class="sr-only">Client Token</label>
				<input type="text" name="token" id="token" class="shadow-sm focus:ring-green-500 focus:border-green-500 block w-full sm:text-sm border-gray-300 rounded-md" placeholder="Client Token">
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
