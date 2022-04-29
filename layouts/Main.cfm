<cfoutput>
<!DOCTYPE html>
<html lang="en" class="h-full bg-gray-50">
<head>
	<meta charset="utf-8">
	<title>cbSecurity Demo Gallery</title>
	<meta name="description" content="cbSecurity Demo Gallery">
    <meta name="author" content="Ortus Solutions, Corp">
	<!---Base URL --->
	<base href="#event.getHTMLBaseURL()#" />
	<!---css --->
	<link rel="stylesheet" href="/includes/css/index.css">
</head>
<body class="h-full">
	<header class="bg-green-50 border-b border-green-500 shadow-lg shadow-green-800/50">
		<nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" aria-label="Top">
			<div class="w-full py-6 flex items-center justify-between lg:border-none">
				<div class="flex items-center">
					<a class="flex" href="#event.buildLink( "" )#" title="View Gallery">
						<span class="sr-only">cbSecurity Demo Gallery</span>
						<img class="h-10 w-auto" src="/includes/images/logo_circle_large_transparent.gif" alt="">
						<div class="ml-10 space-x-8">
							<h1 class="text-3xl text-green-800">cbSecurity Demo Gallery</h1>
						</div>
					</a>
				</div>
				<cfif auth().check()>
					<div class="flex items-center justify-between gap-4">
						<span>
							User: #auth().user().getId()#
						</span>
						<form method="POST" action="#event.buildLink( "mvc.logout" )#">
							<input type="hidden" name="_method" value="DELETE" />
							<button type="submit" class="inline-flex items-center px-4 py-2 border border-red-800 shadow-sm font-medium rounded-md text-red-800 bg-red-200 hover:bg-red-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:text-sm">Log Out</button>
						</form>
					</div>
				</cfif>
			</div>
		</nav>
	</header>
	<main class="container mx-auto mt-8">#renderView()#</main>
</body>
</html>
</cfoutput>
