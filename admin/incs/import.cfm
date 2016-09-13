<cfif isDefined("form.json") AND isJSON(form.json)>
<cfset this.users = DeserializeJSON(form.json)>
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
				registered_by,
				registration_status,
				modified_time,
				modified_by,
				cancellation_time,
				stage_reached,
				full_name,
				ip_address,
				verify_email,
				mobile_phone,
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
<cflocation url="?sec=future" addtoken="false">
</cfif>
<H1>User Import</H1>
<p>Paste JSON Content in the box below, and click the "Import Document" button to import the new users.  The system will only import new users, skipping users that are already in the DB.</p>
<form action="" method="post">
	<input type="submit" name="submit" value="Import Document" class="importBtn">
	<textarea name="json" class="jsonImport"></textarea>
	
</form>
