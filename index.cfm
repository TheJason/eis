<!---<cfdump var="#session#">
<cfdump var="#form#">--->
<cfif isDefined("form.inviteCode") AND len(form.inviteCode) GT 3>
	<cfset cookie.valid = true>
</cfif>
<cfif isDefined("form.phone")>
	<cfset this.phone = reReplaceNoCase(url.phone, '[^[:digit:]]', '', 'ALL')>
	<cfif isNumeric(this.phone)>
		<cfhttp url="https://oneapi.futurexlabs.com/sms/?phone=#this.phone#"></cfhttp>
	</cfif>
</cfif>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/main.css" type="text/css" rel="stylesheet">
	
	<!-- Start of oneapp Zendesk Widget script -->
	<script>/*<![CDATA[*/window.zEmbed||function(e,t){var n,o,d,i,s,a=[],r=document.createElement("iframe");window.zEmbed=function(){a.push(arguments)},window.zE=window.zE||window.zEmbed,r.src="javascript:false",r.title="",r.role="presentation",(r.frameElement||r).style.cssText="display: none",d=document.getElementsByTagName("script"),d=d[d.length-1],d.parentNode.insertBefore(r,d),i=r.contentWindow,s=i.document;try{o=s}catch(c){n=document.domain,r.src='javascript:var d=document.open();d.domain="'+n+'";void(0);',o=s}o.open()._l=function(){var o=this.createElement("script");n&&(this.domain=n),o.id="js-iframe-async",o.src=e,this.t=+new Date,this.zendeskHost=t,this.zEQueue=a,this.body.appendChild(o)},o.write('<body onload="document._l();">'),o.close()}("https://assets.zendesk.com/embeddable_framework/main.js","oneapp.zendesk.com");/*]]>*/</script><!-- End of oneapp Zendesk Widget script -->
</head>
<body>
<cfif isDefined("cookie.valid") and cookie.valid EQ true>
<!--- Tester ID Found --->
<div id="topBar">
		<div id="topLeft"><img src="imgs/NokiaLogo.png" height="35"></div>
		<div id="topRight">The latest version: <span class="versionGreen">v0.17 (2016.06.23.1047)</span></div>
	</div>
	<div id="mainLogo"></div>
	<div id="content">
		<div id="mainBanner"></div>
		<div id="buttonContainer">
			<!--- Install One App --->
			<cfif this.downloadNow EQ 1>
				<a href="itms-services://?action=download-manifest&url=https://www.getone.io/public/manifest.plist"><div id="installLink"></div></a>
			<cfelse>
			<!--- Send Link to Download One App --->
				<div class="smsLink"></div>
			</cfif>
			<!--- User Support --->
			<div id="supportLink" onclick="o.open()"></div>
		</div>
		<div id="promoBox">
			<div id="comms">
				<div id="comms_left">
					<p>OneApp unifies multiple aspects of communication including voice, messaging, email, and social network (Yammer) into a single convenient mobile app.</p>
					<img src="imgs/comsGraphic.png" width="311" align="center">
				</div>
				<div id="comms_right">
					<div class="cell">
						<img src="imgs/ani1.gif">
					</div>
				</div>
			</div>
			<div id="nuudle">
				<div id="nuudle_left">
					<div class="cell">
						<img src="imgs/ani2.gif">
					</div>
				</div>
				<div id="nuudle_right">
					<p>OneApp's Nuudle&trade; search feature enables users to easily find people, communications, content, and information according to their current context.</p>
					<img src="imgs/nuudleGrphic.png" width="213" align="center">
				</div>
			</div>
			<div id="buddies">
				<div id="buddies_left">
					<p>OneApp's Augmented Messaging feature provides users with highly interactive message capabilities that support polling, quizzes, to do lists, location sharing, and control functions all from within a chat thread. OneApp also provides support for custom “machine buddies” that allow users to interact with objects, web services, organizations, and their environment.</p>
					<img src="imgs/buddyGraphic.png" width="303" align="center">
				</div>
				<div id="buddies_right">
					<div class="cell">
						<img src="imgs/ani3.gif">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer2" align="center">
		<img src="imgs/HelpUsFly.png" width="50%"><br>
		<img src="imgs/HowWorks.png" width="50%"><br>
		<p>OneApp is built on the agile innovation model to rapidly iterate based on feedback from beta users. We plan to update client releases every two weeks and back-end server weekly, hopefully even without you noticing it. We will use metrics based continuous improvement to find the highly desirable features, the most and least used features, and new features we haven't dreamed of yet.</p>
 
		<p>Due to the experimental nature of this trial, we will limit the max number of participants to 200 for the initial phase. And these 200 beta test users will be incrementally added starting from launch date.</p>
		<img src="imgs/HowParticipate.png" width="50%"><br>
		<p>It's quite simple: use it, use it a lot, use it for the real world. Tell us what you think, from the in-app feedback form, on our launch website, on our Yammer group, shoot us an email, or just old fashioned talk to us.</p>
 
		<p>You can even try to break it. But when you do, please send us a bug report too.</p>
 
		<p>Finally, we are looking for your help to realize our vision. Do you want to expand your coding skills and help in developing our cutting edge cloud based platform? We are building not just a new way of communicating, we are building a new way of developing code to be lean, fast and crowd sourced.  Do you want to build a machine buddy that can simplify an enterprise workflow? Do you want to help us with iOS client? If you have the skills, the will, and the need to code join our virtual team.</p>
		<div id="buttonContainer" style="margin-top:60px;margin-bottom:60px;">
			
			<cfif this.downloadNow EQ 1>
				<!--- Install One App --->
				<a href="itms-services://?action=download-manifest&url=https://www.getone.io/public/manifest.plist"><div id="installLink"></div></a>
			<cfelse>
				<!--- Send Link to Download One App --->
				<div class="smsLink"></div>
			</cfif>
			<!--- User Support --->
			<div id="supportLink" onclick="o.open()"></div>
		</div>
			<p>Nokia Bell Labs &copy; 2016</p>
		</div>
		<div id="smsBox">
			<div class="closeBtn"></div>
			<img id="installText" src="imgs/installText.png" width="328">
			<form action="" id="smsForm" name="smsForm" method="post">
				<input name="phone" type="tel" id="phone">
				<div id="submitBtn"></div>
			</form>
		</div>
<cfelse>
<!--- No Tester ID Found --->
	<div id="topBar">
		<div id="topLeft"><img src="imgs/NokiaLogo.png" height="35"></div>
		<div id="topRight"></div>
	</div>
	<div id="mainLogo"></div>
	<div id="theForm">
		<form id="inviteForm" name="invite" action="" method="post">
			<label>Your Tester ID</label>
			<input class="inviteField" name="inviteCode" type="text">
			<div id="enterBtn" class="enterBtn"></div>
		</form>
	</div>
	<div id="footer" align="center">Nokia Bell Labs &copy; 2016</div>
</cfif>
<script   src="https://code.jquery.com/jquery-3.0.0.min.js"   integrity="sha256-JmvOoLtYsmqlsWxa7mDSLMwa6dZ9rrIdtrrVYRnDRH0="   crossorigin="anonymous"></script>
<script src="js/main.js"></script>
<script>
  $("#phone").intlTelInput();
</script>
</body>
</html>