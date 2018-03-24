<%@ page
	import="java.util.*,com.itgd.server.*,com.itgd.parser.*,com.itgd.data.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.itgd.data.*"%>
<%
     response.setHeader("Cache-Control","no-store"); //HTTP 1.1
     response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
 
 %>
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

				<form action="assemblyconstituencyupdatedata" method="post">


					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<%	
  String name=((String) session.getAttribute("name"));
  String colorCode=request.getParameter("colorCode");
  ArrayList parseData=((ArrayList) session.getAttribute("parseData")); 
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
							ConstituencyItem item= (ConstituencyItem) parseData.get(i);
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
							<td>Siting MP.</td>
							<td><input type="text" name="sitingmp"
								value='<%= item.getSeatingmp() %>'></td>
						</tr>

						<tr>
							<td>Siting Party Name</td>
							<td><input type="text" name="sitingparty"
								value='<%= item.getSeatingpartyname() %>'></td>
						</tr>
						<tr>
							<td>Wining MP</td>
							<td><input type="text" name="winingmp"
								value='<%= item.getWiningmp() %>'></td>
						</tr>
						<tr>
							<td>Wining Party Name</td>
							<td>
								<%
try
		{	
		upQuery="SELECT distinct(Trim(ABBR))as ABBR from party_master";
		//System.out.println(upQuery);
		cn = adminConn.getConnection();
		stmt=cn.createStatement();
		rs=stmt.executeQuery(upQuery);
		%> <SELECT class=drop style="WIDTH: 146px" name=winingparty
								onchange="javascript:myOpen(this);">

									<option selected>Select Party</option>
									<% while(rs.next()) {
			st1= rs.getString("ABBR").trim();
			//System.out.println(st1);
			%>
									<option value="<%=st1%>"><%=st1%></option>
									<%	
			}
			}
		
			
	
		
		catch(Exception e)
		{
			out.println(e.toString());
		}
		finally
		{
			rs.close();
			stmt.close();
			cn.close();
		}
		 %>
							
							</td>
						</tr>
						<tr>
							<td>Status</td>
							<td><SELECT class=drop style="WIDTH: 146px" name=status
								onchange=" onchange="javascript:myOpen(this);">
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
						<input type="hidden" name="colorCode" value='<%= colorCode %>' />

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
