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
		<table width="421" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="51" valign="top"
					background="images/tally-box-top-band.gif"><table width="421"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="143" height="26" class="statewhitetext1">Tally</td>
							<td width="143" height="26"><input type="text"
								name="textfield" id="textfield" class="statelistbox2" /></td>
							<td class="statewhitetext1" align="right" valign="middle"
								width="143"><div style="margin-right: 10px;">
									<select name="select2" id="select" class="statelistbox1">   
<!-- onchange="javascript:myOpen(this);" -->       
										<option selected="selected">Select state</option>
										<option
											value="http://indiatoday.intoday.in/election2009/index.php?option=com_registration&amp;task=subsection&amp;sectionid=97&amp;secid=72">Karnataka</option>
										<option
											value="http://indiatoday.intoday.in/election2009/index.php?option=com_registration&amp;task=subsection&amp;sectionid=97&amp;secid=73">Tamil
											Nadu</option>
										<option
											value="http://indiatoday.intoday.in/election2009/index.php?option=com_registration&amp;task=subsection&amp;sectionid=97&amp;secid=74">Andhra
											Pradesh</option>
										<option
											value="http://indiatoday.intoday.in/election2009/index.php?option=com_registration&amp;task=subsection&amp;sectionid=97&amp;secid=75">Kerala</option>
									</select>
								</div></td>
						</tr>
						<tr>
							<td height="25" colspan="3" valign="bottom"><table
									width="421" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="139" height="24" class="parties"><span
											style="margin-left: 10px;">Parties</span></td>
										<td width="89" height="24" align="center" valign="middle"
											class="parties"
											style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;">Lead</td>
										<td width="90" height="24" align="center" valign="middle"
											class="parties"
											style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;">Result</td>
										<td width="102" height="24" align="center" valign="middle"
											class="parties">Gain/Loss</td>
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
							String bgcolor = "";
							DbManager db = new DbManager();
							ArrayList parseData = (ArrayList) db.getNationalData();

							if (parseData != null && parseData.size() > 0) {
								for (int i = 0; i < parseData.size(); i++) {
									XmlItem item = (XmlItem) parseData.get(i);
									String id = item.getId();
									String party = item.getPARTY();
									String currentleading = item.getCURRENTLEADING();
									String currentown = item.getCURRENTWON();
						%>
						<%
							if (party.equalsIgnoreCase("cong")) {
										bgcolor = "#45916B";
									} else if (party.equalsIgnoreCase("BJP")) {
										bgcolor = "#E67817";
									} else if (party.equalsIgnoreCase("LEFT")) {
										bgcolor = "#DA251C";
									} else {
										bgcolor = "#E8BA0D";
									}
						%>
						<input type="hidden" name="id" value='<%=item.getId()%>' />
						<input type="hidden" name="party" value='<%=item.getPARTY()%>' />
						<tr>
							<td height="27" colspan="2" bgcolor="<%=bgcolor%>"
								class="partiescolor"><%=party%></td>
							<td width="87" height="27" align="center" valign="middle"
								bgcolor="#DEDEDC" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"><%=currentleading%></td>
							<td width="90" height="27" align="center" valign="middle"
								bgcolor="#DEDEDC" class="parties"
								style="background-image: url(images/dot.gif); background-repeat: repeat-y; background-position: right top;"><%=currentown%></td>

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

							} else {
						%>
						<tr>
							<td class="searchinfo" colspan="7">
								<fieldset>
									<strong>No Result Found</strong>
								</fieldset>
							</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="2"><input type="submit" value="Submit"
								class="btn" /></td>
						</tr>


					</table></td>
			</tr>
			<tr>
				<td height="20" background="images/tally-box-botom-band.gif"
					class="seemap"><a href="#">See Map</a></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>


</body>
</html>
