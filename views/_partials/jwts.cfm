<cfoutput>
	<cfif auth().check()>
		<div class="mt-8 mx-4 xl:mx-64 bg-white shadow sm:rounded-lg">
			<div class="px-4 sm:px-6 lg:px-8 py-5">
				<div class="sm:flex sm:items-center">
					<div class="sm:flex-auto">
						<h1 class="text-xl font-semibold text-gray-900">JSON Web Tokens</h1>
						<p class="mt-2 text-sm text-gray-700">Manage the JWTs for this user.</p>
					</div>
					<div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
						<form method="POST" action="#event.buildLink( "jwt.tokens" )#">
							<div>
								<label for="tokenDescription" class="block text-sm font-medium text-gray-700">Token Description</label>
								<div class="mt-1 flex rounded-md shadow-sm">
									<div class="relative flex items-stretch flex-grow focus-within:z-10">
										<input type="text" name="tokenDescription" id="tokenDescription" required class="focus:ring-green-500 focus:border-green-500 block w-full rounded-none rounded-l-md sm:text-sm border-gray-300" placeholder="Work Laptop">
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
											<th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Token</th>
											<th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Issued</th>
											<th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Expires</th>
											<th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Payload</th>
											<th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
												<span class="sr-only">Revoke Token</span>
											</th>
										</tr>
									</thead>
									<tbody class="bg-white">
										<cfset jwts = auth().user().getJWTs() />
										<cfif jwts.isEmpty()>
											<tr>
												<td class="whitespace-nowrap px-3 py-4 text-sm text-center text-gray-500" colspan="5">No JWTs created yet</td>
											</tr>
										<cfelse>
											<cfloop array="#jwts#" index="i" item="token">
												<!-- Odd row -->
												<tr <cfif i % 2 EQ 0>class="bg-gray-50"</cfif>>
													<td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6 max-w-[10rem] truncate">
														<button type="button" title="#token.getToken()#" onclick="copyToClipboard('#token.getToken()#')" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-gray-800 bg-gray-200 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-600">
															<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
																<path stroke-linecap="round" stroke-linejoin="round" d="M8 5H6a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2v-1M8 5a2 2 0 002 2h2a2 2 0 002-2M8 5a2 2 0 012-2h2a2 2 0 012 2m0 0h2a2 2 0 012 2v3m2 4H10m0 0l3-3m-3 3l3 3" />
															</svg>
														</button>
													</td>
													<td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
														<span title="#dateTimeFormat( token.getIssuedDate(), "long" )#">#dateTimeFormat( token.getIssuedDate(), "short" )#</span>
													</td>
													<td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
														<span title="#dateTimeFormat( token.getExpirationDate(), "long" )#">#dateTimeFormat( token.getExpirationDate(), "short" )#</span>
													</td>
													<td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
														<cfdump var="#jwtAuth().decode( token.getToken() )#" />
													</td>
													<td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
														<form method="POST" action="#event.buildLink( "jwt.tokens.#token.getId()#" )#">
															<input type="hidden" name="_method" value="DELETE" />
															<button type="submit" class="text-red-600 hover:text-red-900">Revoke<span class="sr-only">, #token.getToken()# token</span></a>
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
	</cfif>
</cfoutput>

<script>
	function copyToClipboard(text) {
		navigator.clipboard.writeText(text);
	}
</script>