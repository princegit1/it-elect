<%@ page
	import="java.util.*,com.itgd.server.*,com.itgd.parser.*,com.itgd.data.*"%>
<%
     response.setHeader("Cache-Control","no-store"); //HTTP 1.1
     response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
 
 %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.itgd.data.*"%>
<%
	Connection cn=null;
	ResultSet rs = null;
	Statement stmt = null;
	Dbconnection adminConn = Dbconnection.getInstance();
	String upQuery="";
	String st1="";
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Xml Parser</title>
<link rel="stylesheet" href="mystyle.css" type="text/css" />

</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>

				<form action="vipupdatedata" method="post">


					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<%
    String name=((String) session.getAttribute("name"));	
  ArrayList parseData=((ArrayList) session.getAttribute("parseData")); 
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
							VipItem item= (VipItem) parseData.get(i);
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
							<td>Constituency</td>
							<td><input type="text" name="constituency"
								value='<%=item.getConstituency() %>'></td>
						</tr>

						<tr>
							<td>Party.</td>
							<td><input type="text" name="party"
								value='<%= item.getPARTY() %>'></td>
						</tr>

						<tr>
							<td>Candidate</td>
							<td><input type="text" name="candidate"
								value='<%= item.getCandidate() %>'></td>
						</tr>
						<tr>
							<td>Status</td>
							<td><strong><font color="red"><%= item.getStatus() %></font></strong>
								<SELECT class=drop style="WIDTH: 104px" name=status>
									<option selected>Select status</option>
									<option value="WON">WON</option>
									<option value="LEADING">LEADING</option>
									<option value="TRAILING">TRAILING</option>
									<option value="LOST">LOST</option>
									<option value="NA">NA</option></td>
						</tr>

						<tr>
							<td colspan="2"><input type="submit" value="Edit"></td>
						</tr>
						<input type="hidden" name="name" value='<%= name %>' />
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
