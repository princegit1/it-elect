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
	<table width="100%" border="0" cellspacing="2" cellpadding="2">
		<tr>
			<td>
				<table width="100%" border="1" cellpadding="0" cellspacing="0"
					bordercolor="#000000">
					<tr
						style="background-color: #D71920; font: bold 14px georgia; color: #ffffff; border: 1px solid #000000;">



						<td style="padding-left: 2px;">State</td>
						<td style="padding-left: 2px;">State Ordering</td>
						<td style="padding-left: 2px;">Constituency</td>
						<td style="padding-left: 2px;">Party</td>
						<td style="padding-left: 2px;">Candidate</td>
						<td style="padding-left: 2px;">Status</td>
						<td style="padding-left: 2px;">Total Votes</td>
						<td></td>

					</tr>

					<%
String name=(String)session.getAttribute("statecode");
 ArrayList parseData=((ArrayList) session.getAttribute("parseData")); 
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
							VipItem item= (VipItem) parseData.get(i);
   %>
					<tr
						style="font: normal 12px georgia; color: #000000; border: 1px solid #000000;">
						<td valign="top" style="padding-left: 2px;"><%= item.getSTATE() %>
						</td>
						<td align="center" valign="top" style="padding-left: 2px;"><%= item.getStateorder() %>
						</td>
						<td valign="top" style="padding-left: 2px;"><%= item.getConstituency() %></td>
						<td valign="top" style="padding-left: 2px;"><%= item.getPARTY() %>
						</td>
						<td valign="top" style="padding-left: 2px;"><%= item.getCandidate() %>
						</td>
						<td align="center" valign="top" style="padding-left: 2px;"><%= item.getStatus() %></td>
						<td align="center" valign="top" style="padding-left: 2px;"><%= item.getRange() %></td>
						<td valign="top" style="padding-left: 2px;"><a
							href="vipeditdata?id=<%= item.getId() %>&name=<%= name %>">Edit</a>
						</td>
						<input type="hidden" name="name" value='<%= name %>' />

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
