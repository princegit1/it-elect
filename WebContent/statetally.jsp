<%@ page
	import="java.util.*,com.itgd.server.*,com.itgd.parser.*,com.itgd.data.*"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>State Tally</title>
<link href="election09_css.css" rel="stylesheet" type="text/css" />
</head>
<%String state=(String)session.getAttribute("state"); %>
<body>
	<!-- <form action="xupdate" method="post">showdata -->
	<form action="xupdate" method="post">
		<table width="421" border="0" align="left" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="51" valign="top"
					style="background-image: url(images/tally-box-top-band.gif); background-position: top left; background-repeat: no-repeat;"><table
						width="421" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="143" height="26" class="statewhitetext1">Tally</td>
							<td width="143" height="26" class="statewhitetext1"><%=state %><br /></td>

						</tr>
						<tr>
							<td height="25" colspan="3" valign="bottom"><table
									width="421" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="114" height="24" class="parties"><span
											style="margin-left: 10px; font-size: 12px;">Parties</span></td>
										<td width="80" height="24" align="center" valign="middle"
											class="parties"
											style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top; font-size: 12px;">Lead</td>
										<td width="71" height="24" align="center" valign="middle"
											class="parties"
											style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top; font-size: 12px;">Result</td>
										<td width="65" height="24" align="center" valign="middle"
											class="parties"
											style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top; font-size: 12px;">Gain-Loss</td>
										<td width="91" height="24" align="center" valign="middle"
											class="parties" style="font-size: 12px;">Priority</td>
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td align="left" valign="top"
					style="border-left: 1px solid #DEDEDC; border-right: 1px solid #DEDEDC;"><table
						width="395" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="35" height="10"></td>
							<td width="89" height="10"></td>
							<td width="87" height="10"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"></td>
							<td width="90" height="10"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"></td>
							<td width="93" height="10"></td>
						</tr>
						<%
      String bgcolor="";
     ArrayList parseData=((ArrayList) session.getAttribute("parseData")); 
			if(parseData!= null && parseData.size()>0)
				{
					
					for(int i=0;i<parseData.size();i++)
						{
				XmlItem item= (XmlItem) parseData.get(i);
				String id=item.getId();
				String party=item.getPARTY();
				String currentleading=item.getCURRENTLEADING();
				String currentown=item.getCURRENTWON();	
							
				
							
   %>
						<% 
      ColourCode ccode=new ColourCode();
     	bgcolor=ccode.getColourCode(party);
      %>
						<input type="hidden" name="id" value='<%= item.getId() %>' />

						<input type="hidden" name="party" value='<%= item.getPARTY() %>' />
						<input type="hidden" name="name" value='<%= item.getSTATE() %>' />
						<% 
           request.setAttribute("sname", item.getSTATE());
           
           %>
						<tr>
							<td height="27" colspan="2" bgcolor="<%=bgcolor%>"
								class="partiescolor"><%=party%></td>
							<td width="87" height="27" align="center" valign="middle"
								bgcolor="#DEDEDC" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"><input
								type="text" name="cleading"
								value=' <%= item.getCURRENTLEADING() %>' size="5"></td>
							<td width="90" height="27" align="center" valign="middle"
								bgcolor="#DEDEDC" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"><input
								type="text" name="cown" value='<%= item.getCURRENTWON() %> '
								size="5"></td>
							<td width="90" height="27" align="center" valign="middle"
								bgcolor="#DEDEDC" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"><input
								type="text" name="gainloss" value='<%= item.getGainloss() %> '
								size="5"></td>
							<td width="90" height="27" align="center" valign="middle"
								bgcolor="#DEDEDC" class="parties"><input type="text"
								name="priority" value='<%= item.getPriority() %> ' size="5"></td>


						</tr>
						<tr>
							<td height="5"></td>
							<td height="5"></td>
							<td height="5" align="center" valign="middle" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"></td>
							<td height="5" align="center" valign="middle" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"></td>
							<td height="5" align="center" valign="middle" class="parties"></td>
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
						<tr>
							<td colspan="2"><input type="button" value="Submit"
								class="btn" /></td>
						</tr>


					</table></td>
			</tr>
			<tr>
				<td height="20" background="images/tally-box-botom-band.gif"
					class="seemap"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
	<%
		String st1 = (String) request.getAttribute("sname");   
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
