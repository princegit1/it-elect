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
	ResultSet rs = null,rs1 = null;
	Statement stmt = null,stmt1 = null;
	Dbconnection adminConn = Dbconnection.getInstance();
	String upQuery="";
	String st1="";
	%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>National Tally</title>
<link href="election09_css.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form action="test.jsp" method="post" id="myForm" title="myForm">
		<table width="421" border="0" cellspacing="0" cellpadding="0">



			<% 
         String alliance="";
        
         try{
         cn = adminConn.getConnection();
         stmt1 = cn.createStatement();
         String stateName= request.getParameter("state");
         String Query = "SELECT PNAME,PARTY_COLOR_CODE, count(*) as n  FROM party_master  group by PARTY_COLOR_CODE  HAVING n>1";
			
			rs1 = stmt1.executeQuery(Query);
			while (rs1.next()) {%>
			<tr>
				<td valign="top" style="padding-left: 1px;"><%= rs1.getString("PNAME") %>
				</td>
				<td align="top" valign="top" style="padding-left: 2px;"><%= rs1.getString("PARTY_COLOR_CODE") %></td>
				<td align="top" valign="top" style="padding-left: 2px;"><%= rs1.getString("n") %>
				</td>
			</tr>
			<%
				         
         
         }
         }
		catch(Exception e)
		{
			out.println(e.toString());
		}
		
      
      %>



		</table>
	</form>
</body>
</html>
