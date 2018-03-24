<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.itgd.data.*"%>
<%
    /*  response.setHeader("Cache-Control","no-store"); //HTTP 1.1
     response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
  */
 %>

<%
	Connection cn=null;
	ResultSet rs = null;
	Statement stmt = null;
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

<%
try
		{	
		upQuery="SELECT distinct(STATE) from election_seat_count_master";
		System.out.println(upQuery);
		cn = adminConn.getConnection();
		stmt=cn.createStatement();
		rs=stmt.executeQuery(upQuery);
		%>


<body>
	<form action="shownewstate" method="post">
		<table width="421" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="51" valign="top"
					background="images/tally-box-top-band.gif">
					<table width="421" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="143" height="26" class="statewhitetext1">State
								Tally</td>
							<td colspan="2" height="26" valign="top" align="right">
								<div style="margin-right: 10px;">
									<SELECT name=state id="select" class="statelistbox1"
										onchange="javascript:myOpen(this);">
										<option selected>Select state</option>
										<% while(rs.next()) {
			st1= rs.getString("STATE").trim();
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
									</SELECT>
								</div>
							</td>

						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Submit" /></td>
						</tr>
					</table>
				</td>
		</table>
	</form>
	
	<% 
		st1 = (String) request.getAttribute("sname");   
		String st11 = null;

		if (st1.equals("PUDUCHERRY")) {
			st11 = "assembly-2016/puducherry-assembly-election-results-2016-chart.html";
		} else if (st1.equals("KERALA")) {
			st11 = "assembly-2016/kerala-assembly-election-results-2016-chart.html";
		} else if (st1.equals("ASSAM")) {
			st11 = "assembly-2016/assam-assembly-election-results-2016-chart.html";
		} else if (st1.equals("TAMIL NADU")) {           
			st11 = "assembly-2016/tamil-nadu-assembly-election-results-2016-chart.html";
		} else {
			st11 = "assembly-2016/west-bengal-assembly-election-results-2016-chart.html";
		}

		   // out.println("State is: " + st1 + "::  Html is   " + st11);  

		/* request.setAttribute("st11", st11);
		String st12 = (String) request.getAttribute("st11"); */ 
	%>


	<input type="hidden" name="st11" value='<%=st11%>'> <script
			src="jquery.js"></script> <script>      
				$(document).ready(function() {
					$('.btn').click(function() {         
					<%--  $('.div1').load('<%=st11 %>'); --%>         
              // alert("click");        
						$.ajax({     
							url : "<%=st11 %>",  
							success : function(result) {
								 //alert("Data Show" + result);                      
								$(".div1").html(result);           
							}
						});  

					})       
				})              
			</script>
		<div class="div1" style="border: 2px solild #c00; padding: 5px;"></div>
		
		
</body>
</html>
