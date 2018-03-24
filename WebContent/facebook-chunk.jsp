<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page
	import="java.util.ArrayList,com.mobile.util.CommonFunctions,java.sql.PreparedStatement,com.mobile.dto.SectionDTO,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<%//@include file="googleanalytics_top.jsp"%>     
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
	<title>Election Results 2102 - Assembly Election Results,
		Vidhan Sabha 2012 results</title>
	<meta name="description"
		content="Assembly Election  2012 Results -  Get the full coverage on Assembly election 2012 from india today and find the live update on assembly elections like Live counting of votes, poll results and analysis from Uttar Pradesh UP, Uttarakhand, Manipur, Punjab  and Goa." />
	<meta name="keywords"
		content="Assembly Elections 2012, Uttar Pradesh, Uttarakhand , Manipur, Punjab , Goa, live streaming, India Today" />
	<link rel="stylesheet" href="css/mobile.css" type="text/css">
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="left" valign="top"><%@ include file="topnav.jsp"%></td>
		</tr>

		<tr>
			<td align="left" valign="top">

				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="8"></td>
					</tr>

					<tr>
						<td class="breadcrumb"><a href="home">HOME</a> &raquo; Live
							Poll Results</td>
					</tr>

					<% 
 String urlname="uttarpradesh-partywise-tally.jsp";
 String stateName=request.getParameter("state");
 int totalCount=0;
 if(stateName.equals("UTTAR PRADESH")){
 totalCount=403;
 urlname="uttarpradesh-partywise-tally.jsp";
 }else if(stateName.equals("PUNJAB")){
  totalCount=117;
  urlname="punjab-partywise-tally.html";
 }else if(stateName.equals("UTTARAKHAND")){
 totalCount=70;
  urlname="uttarpradesh-partywise-tally.jsp";
 }else if(stateName.equals("MANIPUR")){
   totalCount=60;
    urlname="manipur-partywise-tally.jsp";
 }else if(stateName.equals("GOA")){
  totalCount=40;
   urlname="goa-partywise-tally.jsp";
 }
%>
					<jsp:include page="<%=urlname%>" flush="true" />

					</td>
					</tr>
					<tr>
						<td height="8"></td>
					</tr>
					<tr>
						<td><%@ include file="othercategories.html"%></td>
					</tr>
					<tr>
						<td><%@include file="hotzone.html"%></td>
					</tr>
					<tr>
						<td><%@ include file="bottomnav.html"%></td>
					</tr>
				</table> <%@include file="googleanalytics_bottom.jsp"%>
</body>
</html>