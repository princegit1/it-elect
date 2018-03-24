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
<title>Xml data</title>
<link rel="stylesheet" href="mystyle.css" type="text/css" />

</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr
						style="background-color: #D71920; font: bold 14px georgia; color: #ffffff;">



						<td>State</td>
						<td>Party</td>
						<td>Previous Won</td>
						<td>Previous Leading</td>
						<td>Current Won</td>
						<td>Current Leading</td>
						<td>Priority</td>
						<td></td>

					</tr>

					<%	ArrayList parseData=((ArrayList) session.getAttribute("parseData")); 
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
							XmlItem item= (XmlItem) parseData.get(i);
   %>
					<tr>
						<td valign="top"><%= item.getSTATE() %></td>
						<td valign="top"><%= item.getPARTY() %></td>
						<td valign="top"><%= item.getPREVIOUSWON() %></td>
						<td valign="top"><%= item.getPREVIOUSLEADING() %></td>
						<td valign="top"><%= item.getCURRENTWON() %></td>
						<td valign="top"><%=item.getCURRENTLEADING() %></td>
						<td valign="top"><%=item.getPriority() %></td>
						<td valign="top"><a href="xedit?id=<%= item.getId() %>">Edit</a>
						</td>


					</tr>


					<%
  
	 }


 }else{ %>
					<tr>
						<td class="searchinfo" colspan="8" style="padding-left: 2px;">
							<fieldset>
								<strong>No Result Found</strong>
							</fieldset>
						</td>
					</tr>
					<%} %>




				</table>

			</td>
		</tr>
	</table>
</body>
</html>
