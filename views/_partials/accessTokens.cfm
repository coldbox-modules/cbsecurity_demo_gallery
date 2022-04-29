<cfoutput>
	<cfif auth().check()>
		<div class="mt-8 mx-4 xl:mx-64 bg-white shadow sm:rounded-lg">
			<div class="px-4 sm:px-6 lg:px-8 py-5">
				<div class="sm:flex sm:items-center">
					<div class="sm:flex-auto">
						<h1 class="text-xl font-semibold text-gray-900">Personal Access Tokens</h1>
						<p class="mt-2 text-sm text-gray-700">Manage the personal access tokens for this user.</p>
					</div>
					<div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
						<form method="POST" action="#event.buildLink( "accessTokens" )#">
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
											<th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Description</th>
											<th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Token</th>
											<th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Last Used</th>
											<th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
												<span class="sr-only">Revoke Token</span>
											</th>
										</tr>
									</thead>
									<tbody class="bg-white">
										<cfset accessTokens = auth().user().getAccessTokens() />
										<cfif accessTokens.isEmpty()>
											<tr>
												<td class="whitespace-nowrap px-3 py-4 text-sm text-center text-gray-500" colspan="4">No tokens created yet</td>
											</tr>
										<cfelse>
											<cfloop array="#auth().user().getAccessTokens()#" index="i" item="token">
												<!-- Odd row -->
												<tr <cfif i % 2 EQ 0>class="bg-gray-50"</cfif>>
													<td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6">#token.getDescription()#</td>
													<td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">#token.getToken()#</td>
													<td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
														<cfif token.isNullAttribute( "lastUsedDate" )>
															Never used
														<cfelse>
															#dateTimeFormat( token.getLastUsedDate(), "long" )#
														</cfif>
													</td>
													<td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
														<form method="POST" action="#event.buildLink( "accessTokens.#token.getID()#" )#">
															<input type="hidden" name="_method" value="DELETE" />
															<button type="submit" class="text-red-600 hover:text-red-900">Revoke<span class="sr-only">, #token.getDescription()# token</span></a>
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