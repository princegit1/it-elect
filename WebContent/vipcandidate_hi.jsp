
<%@ page import="com.itgd.utils.Constants"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%
	String tableWidth = "279";
	String statename = "Uttar Pradesh";
	int activeState = 2;

	if (request.getParameter("width") != null)
		tableWidth = ""
				+ (Integer.parseInt(request.getParameter("width")) - 21);
	int centralTDWidth = Integer.parseInt(tableWidth) - 110;

	if (request.getParameter("state") != null)
		statename = request.getParameter("state");
	if (statename.equals("gujarat")) {
		statename = "GUJARAT";
		activeState = 4;
	} else if (statename.equals("himachal")) {
		statename = "HIMACHAL";
		activeState = 4;
	} else if (statename.equals("uttarpradesh")) {
		statename = "Uttar Pradesh";
	} else if (statename.equals("goa")) {
		statename = "Goa";
	} else if (statename.equals("punjab")) {
		statename = "Punjab";
	} else if (statename.equals("manipur")) {
		statename = "Manipur";
	} else if (statename.equals("uttarakhand")) {
		statename = "Uttarakhand";
	}
%>


<%
	String connectionURL = "jdbc:mysql://220.226.193.43:3306/elections";
	Connection dbConn = null;
	ResultSet rs = null;
	Statement st = null;
	String query = "";
	Class.forName("com.mysql.jdbc.Driver");
	dbConn = DriverManager.getConnection(connectionURL, "itgd_misc",
			"q)R>gp=72s^g");
	st = dbConn.createStatement();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Untitled Document</title>
<style>
body {
	margin: 0;
	padding: 0;
}

.tiletext_ck {
	font: normal 12px mangal;
	color: #000000;
	text-align: left;
	line-height: 18px;
}

.vipwontext {
	font: bold 12px arial;
	color: #10B21F;
}

.viplosttext {
	font: bold 12px arial;
	color: #FF0D12;
}

.vipgreytext {
	font: bold 12px arial;
	color: #7E7E7E;
	line-height: 22px;
}

.electionheaderText {
	font: bold 13px Mangal;
	color: #B0530D;
	line-height: 18px;
}
</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript"
	src="<%=Constants.SITE_URL%>assembly-elections/js/jquery.jcarousel.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=Constants.SITE_URL%>assembly-elections/css/skin.css" />
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery('#mycarousel').jcarousel({
			vertical : true,
			scroll : 2
		});
	});
</script>

</head>

<body>
	<div id="wrap">
		<ul id="mycarousel" class="jcarousel jcarousel-skin-tango">
			<%
				try {
					query = "SELECT Candidate_Name_h, Candidate_Name, Party_h, Constituency_h, State_h, Status  FROM vip_master where Assembly=1 and Active="
							+ activeState
							+ " and State='"
							+ statename
							+ "' order by State_Ordering";
					//out.println("@@@@@@@"+query);
					rs = st.executeQuery(query);
					while (rs.next()) {
						String strCandidatename = new String(
								new String(rs.getString("Candidate_Name_h"))
										.getBytes("ISO-8859-1"),
								"UTF-8");
						String strPartyname = new String(new String(
								rs.getString("Party_h")).getBytes("ISO-8859-1"),
								"UTF-8");
						String strConstituencyname = new String(
								new String(rs.getString("Constituency_h"))
										.getBytes("ISO-8859-1"),
								"UTF-8");
			%>
			<li><img
				src="http://media2.intoday.in/indiatoday/assemblypoll/<%=rs.getString("Candidate_Name")
							.replaceAll("\\(", "").replaceAll("\\)", "")%>.jpg"
				width="37" height="37" style="border: 1px solid #a7a7a7"
				align="left" />
				<div class="candidate-name">
					<span class=""><%=strCandidatename%></span><span
						class="resulttxt wontxt"> <%
 	if (rs.getString("Status").equals("WON")
 					|| rs.getString("Status").equals("LEADING"))
 				out.println("<span class='resulttxt wontxt'>"
 						+ rs.getString("Status") + "</span>");
 			else if (rs.getString("Status").equals("LOST")
 					|| rs.getString("Status").equals("TRAILING"))
 				out.println("<span class='resulttxt losstxt'>"
 						+ rs.getString("Status") + "</span>");
 			else
 				out.println("<span class='resulttxt'>"
 						+ rs.getString("Status") + "</span>");
 %>
					</span>
				</div> <span class="party-txt">(<%=strPartyname%>) <%=strConstituencyname%></span>
			</li>
			<%
				}
				} catch (Exception ee) {
					System.out.println("Exception in vipcandidate_hi.jsp page =>"
							+ ee.toString());
				} finally {
					if (st != null)
						st.close();
					if (rs != null)
						rs.close();
					if (dbConn != null)
						dbConn.close();
				}
			%>
			</table>
</body>
</html>

