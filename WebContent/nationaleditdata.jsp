<%@ page
	import="java.util.*,com.itgd.server.*,com.itgd.parser.*,com.itgd.data.*"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>National Tally</title>
<link href="election09_css.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<form action="nationalupdatedata" method="post">
		<table width="421" border="0" align="left" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="51" valign="top"
					background="images/tally-box-top-band.gif"><table width="421"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="143" height="26" class="statewhitetext1">National
								Tally</td>

						</tr>
						<tr>
							<td height="25" colspan="3" valign="bottom"><table
									width="421" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="184" height="24" class="parties"><span
											style="margin-left: 10px;">Parties</span></td>
										<td width="105" height="24" align="center" valign="middle"
											class="parties"
											style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;">Lead</td>
										<td width="132" height="24" align="center" valign="middle"
											class="parties">Result</td>

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
							<td width="45" height="10"></td>
							<td width="102" height="10"></td>
							<td width="129" height="10"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"></td>
							<td height="10" colspan="2"></td>
						</tr>
						<%
      String bgcolor="";
      DbManager db = new DbManager();
	ArrayList parseData = (ArrayList)db.getNationalData();	
      
			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
				NationalItem item= (NationalItem) parseData.get(i);
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
						<tr>
							<td height="27" colspan="2" bgcolor="<%=bgcolor%>"
								class="partiescolor"><%=party%></td>
							<td width="129" height="27" align="center" valign="middle"
								bgcolor="#DEDEDC" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"><input
								type="text" name="cleading"
								value=' <%= item.getCURRENTLEADING() %>' size="15"></td>
							<td width="119" height="27" align="center" valign="middle"
								bgcolor="#DEDEDC" class="parties"><input type="text"
								name="cown" value='<%= item.getCURRENTWON() %> ' size="15"></td>
						</tr>
						<tr>
							<td height="5"></td>
							<td height="5"></td>
							<td height="5" align="center" valign="middle" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"></td>
							<td height="5" colspan="2" align="center" valign="middle"
								class="parties"></td>
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
							<td colspan="2"><input type="submit" value="Submit" /></td>
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
</body>
</html>
