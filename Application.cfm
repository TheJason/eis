<cfapplication name="getone" sessionmanagement="true" clientmanagement="true" datasource="one_pg">

<cfif cgi.http_user_agent contains 'iPhone' or cgi.http_user_agent contains 'iPad'>
	<cfset this.downloadNow = 1>
<cfelse>
	<cfset this.downloadNow = 0>
</cfif>