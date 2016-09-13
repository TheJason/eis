

<cfparam name="url.sec" default="current">
<cfif isDefined("form.userid")><!--- Verify Login Credentials --->
<cfif form.userid EQ 'admin' AND form.password EQ 'Bell1925'><cfset session.AdminUser = true><cfelse><cfset session.AdminUser = true></cfif></cfif>
<html>
<head>
	<link href="css/main.css" type="text/css" rel="stylesheet">
</head>
<body>

<cfif isDefined("session.AdminUser") AND session.AdminUser EQ true><!--- Display Dashboard --->
	<cfquery name="getUsers">SELECT * FROM beta_users</cfquery>
	<cfquery name="currentUsers" dbtype="query">SELECT * FROM getUsers WHERE nok_one_email != ''</cfquery>
	<cfquery name="futureUsers" dbtype="query">SELECT * FROM getUsers WHERE nok_one_email = ''</cfquery>
	<div id="nokiaBanner"><img src="../imgs/NokiaLogo.png" width="163"></div>
	<div id="menuBar">
		<div style="padding:6px;">
			<cfoutput>
				<a href="?sec=current">Current Users (#currentUsers.recordcount#)</a>   |   
				<a href="?sec=future">Future Users (#futureUsers.recordcount#)</a>   |   
				<a href="?sec=import">Import JSON</a>
			</cfoutput>
		</div>
	</div>
	
	<!---<cfdump var="#getUsers#">--->
	<cfswitch expression="#url.sec#">
		<cfcase value="current"><cfinclude template="incs/current.cfm"></cfcase>
		<cfcase value="future"><cfinclude template="incs/future.cfm"></cfcase>
		<cfcase value="import"><cfinclude template="incs/import.cfm"></cfcase>
	</cfswitch>

<cfelse><!--- Display Login Form --->

	<div id="nokiaBanner"><img src="../imgs/NokiaLogo.png" width="163"></div>

	<form action="" method="post" name="loginForm">
		<input name="userid" type="text" placeholder="username">
		<input name="password" type="password" placeholder="password">
		<input type="submit" name="submit">
	</form>

</cfif>
</body>
</html>

