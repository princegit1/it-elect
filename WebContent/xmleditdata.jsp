<%@ page
	import="java.util.*,com.itgd.server.*,com.itgd.parser.*,com.itgd.data.*"%>
<%
     response.setHeader("Cache-Control","no-store"); //HTTP 1.1
     response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
 
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Xml Parser</title>
<link rel="stylesheet" href="mystyle.css" type="text/css" />
<script type="text/javascript">
		// <![CDATA[

		function inputFileOnChange() {
		var v_console = '';
		v_console +=document.getElementById('fichier').value;

		document.getElementById('filePathtxt').value=v_console

		document.getElementById('console').innerHTML = v_console;

		};

		// ]]>
		</script>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>

				<form action="xupdate" method="post">


					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<%	ArrayList parseData=((ArrayList) session.getAttribute("parseData")); 
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
							XmlItem item= (XmlItem) parseData.get(i);
   %>
						<tr>
							<td>Id.</td>
							<td><input type="text" name="id" value='<%= item.getId() %>'
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>State</td>
							<td><input type="text" name="state"
								value='<%= item.getSTATE() %>'></td>
						</tr>
						<tr>
							<td>Party.</td>
							<td><input type="text" name="party"
								value='<%= item.getPARTY() %>'></td>
						</tr>

						<tr>
							<td>Previous Own.</td>
							<td><input type="text" name="pown"
								value='<%=item.getPREVIOUSWON() %>'></td>
						</tr>
						<tr>
							<td>Previous Leading.</td>
							<td><input type="text" name="plead"
								value='<%= item.getPREVIOUSLEADING() %>'></td>
						</tr>
						<tr>
							<td>Current own.</td>
							<td><input type="text" name="cown"
								value='<%= item.getCURRENTWON() %> '></td>
						</tr>
						<tr>
							<td>Current Leading.</td>
							<td><input type="text" name="cleading"
								value=' <%= item.getCURRENTLEADING() %>'></td>
						</tr>
						<tr>
							<td>Priority</td>
							<td><input type="text" name="priority"
								value=' <%= item.getPriority() %>'></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Edit"></td>
						</tr>
						<%
  
	 }
 }%>
					</table>
				</form>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
