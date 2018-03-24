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
				<table width="100%" border="1" cellpadding="0" cellspacing="0"
					bordercolor="#000000">
					<tr
						style="background-color: #D71920; font: bold 14px georgia; color: #ffffff; border: 1px solid #000000;">



						<td style="padding-left: 2px;">State</td>
						<td style="padding-left: 2px;">Constituency</td>
						<td style="padding-left: 2px;">Siting MP</td>
						<td style="padding-left: 2px;">Siting Party Name</td>
						<td style="padding-left: 2px;">Wining MP</td>
						<td style="padding-left: 2px;">Wining Party Name</td>
						<td style="padding-left: 2px;">Status</td>
						<td style="padding-left: 2px;">Color Code</td>
						<td></td>
					</tr>

					<%	DbManager db = new DbManager();
 	String name=(String)session.getAttribute("statecode");
 	ArrayList parseData=((ArrayList) session.getAttribute("parseData")); 
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
							ConstituencyItem item= (ConstituencyItem) parseData.get(i);
							String partname=item.getWiningpartyname();
							String colorCode=db.getPartyColourName(partname);
							
							if(colorCode==null||colorCode.equalsIgnoreCase("")){
						
								colorCode="0xff9f9f";
							}
		
   %>

					<tr
						style="font: normal 12px georgia; color: #000000; border: 1px solid #000000;">
						<td valign="top" style="padding-left: 2px;"><%= item.getSTATE() %>
						</td>
						<td align="top" valign="top" style="padding-left: 2px;"><%= item.getConstituency() %>
						</td>
						<td align="top" valign="top" style="padding-left: 2px;"><%= item.getSeatingmp() %>
						</td>
						<td valign="top" style="padding-left: 2px;"><%= item.getSeatingpartyname() %></td>
						<td valign="top" style="padding-left: 2px;"><%= item.getWiningmp()%>
						</td>
						<td valign="top" style="padding-left: 2px;"><%= item.getWiningpartyname() %>
						</td>
						<td align="top" valign="top" style="padding-left: 2px;"><%= item.getStatus() %></td>
						<td align="top" valign="top" style="padding-left: 2px;"><%= colorCode %></td>
						<td valign="top" style="padding-left: 2px;"><a
							href="constituencyeditdata?id=<%= item.getId() %>&name=<%= name %>">Edit</a>
						</td>


					</tr>


					<%
  
	 }


 }else{ %>
					<tr>
						<td class="searchinfo" colspan="7">
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
