
<%
String errorMessage = request.getParameter("msg");
%>
<html>
<head>
<title>Login &gt; Election Backup Module</title>
<link href="styles/main.css" rel="stylesheet" type="text/css">
<script language="javascript">
			function validateForm()
			{
				if(document.forms[0].username.value == "")
				{
					alert("Please Fill in User Name");
					document.forms[0].username.focus();
					return false;
				}
				if(document.forms[0].password.value == "")
				{
					alert("Please Fill in Password");
					document.forms[0].password.focus();
					return false;
				}
			}
		</script>
<style type="text/css">
<!--
body {
	background-color: #549DC0;
}

.normaltxt {
	font: bold 12px Georgia;
	color: #d71920;
}

.normaltxt a {
	font: bold 12px Georgia;
	color: #000000;
	text-decoration: none;
}

.normaltxt a:hover {
	font: bold 12px Georgia;
	color: #022f59;
	text-decoration: underline
}
-->
</style>
</head>
<body>
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td bgcolor="#016FA4"><img src="images/electionBannerBg.gif"
				border="0" height="140" width="1366"></td>
		</tr>
	</table>
	<form method=post action="login" onsubmit="return validateForm()">
		<div style="margin-top: 30px;">
			<table align="center" width="30%" cellspacing="0" cellpadding="0"
				border="0">
				<tr height="50">
					<td colspan="2" align="right"></td>
				</tr>
				<tr height="20" valign="middle">
					<td colspan="2" align="center"><span
						style="font: bold 18px Arial; color: #022F59">Login Here</span></td>
				</tr>
				<tr height="35" valign="middle">
					<td colspan="2" align="right">&nbsp;</td>
				</tr>
				<tr height="35" valign="middle">
					<td align="right"><span style="font: bold 12px Georgia;">User
							Name :</span></td>
					<td align="left">&nbsp;&nbsp;<input type="text"
						name="username" size="30"></td>
				</tr>
				<tr height="1">
					<td colspan="2" align="right"></td>
				</tr>
				<tr height="35" valign="middle">
					<td align="right"><span style="font: bold 12px Georgia;">Password
							:</span></td>
					<td align="left">&nbsp;&nbsp;<input type="password"
						name="password" size="30"></td>
				</tr>
				<tr height="40" valign="middle">
					<td colspan="2" align="center"><input type="reset"
						value=" Clear ">&nbsp;&nbsp; <input type="submit"
						value=" Login "></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>