
<cffile action = "read" file = "my.json" variable = "tester">
<cfset this.users = DeserializeJSON(tester)>
<cfdump var="#arraylen(this.users)#">
<cfdump var="#this.users[1]["First Name"]#">
<cfloop from="1" to="#arraylen(this.users)#" index="i">
	<cfquery name="user">
		SELECT * FROM beta_users
		WHERE nokia_email = '#this.users[i]["Nokia Email Address"]#'
	</cfquery>
	<cfif user.recordcount GTE 1>
		<!--- User already exists, don't insert new record --->
		<!--- Do Nothing --->
	<cfelse>
		<!--- New User, Insert Record --->
		<cfquery>
			INSERT INTO beta_users(
				conf_id,
				first_name,
				last_name,
				registered,
				modified,
				cancelled,
				nokia_email,
				registration_time,
				registration_by,
				registration_status,
				modified_time,
				modified_by,
				cancellation_time,
				stage_reached,
				full_name,
				ip_address,
				verify_email,
				mobile_number,
				ios_device,
				using_office365,
				organization)
			VALUES(
				'#this.users[i]["Conf ##"]#',
				'#this.users[i]["First Name"]#',
				'#this.users[i]["Last Name"]#',
				'#this.users[i]["Registered"]#',
				'#this.users[i]["Modified"]#',
				'#this.users[i]["Cancelled"]#',
				'#this.users[i]["Nokia Email Address"]#',
				'#this.users[i]["Registration Time"]#',
				'#this.users[i]["Registered by"]#',
				'#this.users[i]["Registration Status"]#',
				'#this.users[i]["Modified Time"]#',
				'#this.users[i]["Modified By"]#',
				'#this.users[i]["Cancellation Time"]#',
				'#this.users[i]["Stage reached"]#',
				'#this.users[i]["Full name"]#',
				'#this.users[i]["IP Address"]#',
				'#this.users[i]["Verify Email Address"]#',
				'#this.users[i]["Mobile Phone Number"]#',
				'#this.users[i]["iOS Device"]#',
				'#this.users[i]["Using Office365?"]#',
				'#this.users[i]["Organization"]#'
				)
			</cfquery>
	</cfif>
</cfloop>