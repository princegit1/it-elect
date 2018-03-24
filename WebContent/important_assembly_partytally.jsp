<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.itgd.data.*"%>
<%
	//  response.setHeader("Cache-Control","no-store"); //HTTP 1.1
	// response.setHeader("Pragma","no-cache"); //HTTP 1.0
	// response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<%
	Connection cn = null;
	ResultSet rs = null;
	Statement stmt = null;
	Dbconnection adminConn = Dbconnection.getInstance();
	String upQuery = "";
	String st1 = "";
%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>National Tally</title>
<link href="election09_css.css" rel="stylesheet" type="text/css" />
</head>

<%
	try {
		//upQuery="SELECT distinct(STATE) from election_seat_count_master where ASSEMBLY='1' AND STATE='BIHAR'";
		upQuery = "SELECT distinct(STATE) from election_seat_count_master where ASSEMBLY='1' and  ACTIVE='1' and STATE in('assam','kerala','puducherry','tamil nadu','west bengal')";
		//System.out.println("important_assembly_partytally.jsp::upQuery: "+upQuery);
		cn = adminConn.getConnection();
		stmt = cn.createStatement();
		rs = stmt.executeQuery(upQuery);
%>


<body>
	<form action="showdata" method="post">
		<table width="421" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="51" valign="top"
					background="images/tally-box-top-band.gif">
					<table width="421" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="143" height="26" class="statewhitetext1">Important
								Party</td>
							<td colspan="2" height="26" valign="top" align="right">
								<div style="margin-right: 10px;">
									<!-- <SELECT name=state id="select" class="statelistbox1" onchange="javascript:myOpen(this);"> -->
									<SELECT name=state id="select" class="statelistbox1">
										<option selected>Select state</option>
										<%
											while (rs.next()) {
													st1 = rs.getString("STATE").trim();
													//System.out.println(st1);
													String st11 = null;
										%>

										<option value="<%=st1%>"><%=st1%></option>

										<%
											}
										%>

									</SELECT>
                     

									<%
										}

										catch (Exception e) {
											out.println(e.toString());
										} finally {
											rs.close();
											stmt.close();
											cn.close();
										}
									%>

								</div>
							</td>

						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Submit"/></td>
						</tr>
					</table>
				</td>
		</table>
	</form>



</body>
</html>
