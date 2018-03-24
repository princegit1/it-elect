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



						<td style="padding-left: 2px;">Error</td>
						<td style="padding-left: 2px;">Time</td>

						<td></td>

					</tr>

					<%
String name=(String)session.getAttribute("statecode");
 ArrayList parseData=((ArrayList) session.getAttribute("parseData")); 
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
							XmlItem item= (XmlItem) parseData.get(i);
   %>
					<tr
						style="font: normal 12px georgia; color: #000000; border: 1px solid #000000;">
						<td align="top" valign="top" style="padding-left: 2px;"><%= item.getId()%>
						</td>
						<td valign="top" style="padding-left: 2px;"><%= item.getSTATE() %>
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
