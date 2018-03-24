<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ page import="com.itgd.data.Dbconnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%
String stateName = "KARNATAKA";
String stateNameToCache = "karnataka";
int activeState=5;
int stateSeatCount = 223;
if(request.getParameter("state")!=null) {
	stateName = request.getParameter("state");
	stateNameToCache = stateName;
}
int partyCount=0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Hemicicle v2</title>



<link rel="stylesheet" type="text/css" media="screen"
	href="css/smoothness/jquery-ui-1.8.11.custom.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="css/jqGrid/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="css/elec2011.css" />

<!-- 1. Add these JavaScript inclusions in the head of your page 	-->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>


<script type="text/javascript" src="js/highcharts.js"></script>


<script src="js/grid.locale-es.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>


<!-- 1a) Optional: add a theme file -->

<script type="text/javascript" src="js/grid.js"></script>


<!-- 1b) Optional: the exporting module -->
<!--
		<script type="text/javascript" src="../js/hc/modules/exporting.js"></script>
		-->

<!-- 2. Add the JavaScript to initialize the chart on document ready -->
<script type="text/javascript">
		
			var emi1;
			var vots1;
			
			$(document).ready(function() {
				emi1= new Highcharts.Chart({
					chart: {
						renderTo: 'cnt_edils1',
						//renderTo: 'container2',
						plotBackgroundColor: null,
						plotBorderWidth: null,
						plotShadow: false,
						borderColor: '#bcbcbc',borderWidth: 1,borderRadius: 5,
					},
					title: {
						text: 'KARNATAKA'
					},
					
					tooltip: {
						formatter: function() {
							return '<b>'+ this.point.name +'</b>: <br><b>Total</b>:'+ this.y +' '+'<br>';
						}
					},
					credits:0,
					plotOptions: {
						emicicle: {
							allowPointSelect: false,
							cursor: 'pointer',
							dataLabels: {
								enabled: false
							}
						}
					},
					
		 series: [

					{
						type: 'emicicle',
						name: 'emicicle-2011',
						size: '80%',
						innerSize: '50%',
						data: [
<%
/* Database Connectivity Block Start Here*/
String connectionURL = "";
Connection dbConn = null;
ResultSet rs =null;
Statement st = null;
String gainLoss="";
String query="";
String partyColor = "";
Class.forName("com.mysql.jdbc.Driver");
connectionURL = "jdbc:mysql://localhost:3306/elections";
dbConn = DriverManager.getConnection(connectionURL,"root","root"); 
//dbConn = DriverManager.getConnection(connectionURL,"itgd_office","$t0p@ct1ng43"); 
st = dbConn.createStatement();
try
{
	//query="SELECT sp.STATE,sp.PARTY,sp.LEAD,sp.WON,sp.GAINLOSS, pm.party_color_code, pm.abbr FROM statewise_partydetails sp, party_master pm where sp.ASSEMBLY=1 and sp.ACTIVE="+activeState+" and sp.STATE='"+stateName+"' and trim(sp.party)=trim(pm.abbr) order by sp.priority";
	//out.println("query--->"+query);
	query="SELECT e.state, e.party, e.previouswon, e.currentwon AS WON, e.currentleading AS LEAD, e.gainloss AS GAINLOSS, pm.party_color_code,pm.party_color_code,pm.abbr FROM election_seat_count_master e, party_master pm WHERE e.assembly=1 AND e.state='KARNATAKA' AND e.active='1' AND TRIM(LOWER(pm.abbr))=TRIM(LOWER(e.party)) order by e.priority";
	rs=st.executeQuery(query);
	int counter=1;
	int totalResult = 0; 
	while(rs.next()){
		totalResult = totalResult+rs.getInt("WON")+rs.getInt("LEAD");
	}
	rs.last();
	partyCount = rs.getRow();
	rs.beforeFirst();
	while(rs.next()){
	
	int tempGainLoss = rs.getInt("WON")+rs.getInt("LEAD"); 
	gainLoss=""+tempGainLoss;
		if(rs.getString("party_color_code")!=null && !rs.getString("party_color_code").equals("")) 
			partyColor = rs.getString("party_color_code").replace("0x","#");
		else
			partyColor = "#ff9f9f";

			%>    
			
			{ name: '<%=rs.getString("PARTY")%>', y: <%=tempGainLoss%>, color: '<%=partyColor%>',culTest:'<%=rs.getString("LEAD")%>' },        
					
<%	
}	
} catch(Exception ee) {
	System.out.println("Exception in assembly-elections/partywisetally_en.jsp  page =>"+ee.toString());
} finally{
	if(rs!=null)
		rs.close();
	if(st!=null)
		st.close();
	if(dbConn!=null)
		dbConn.close();
}
%>
                	],
							showInLegend: false,
								legendType: 'point'
					}
					]
					

				});
			});
			
	</script>

</head>
<body>


	<div id="plana">
		<div id="capital_1">
			<div id="tab_grf_capital" style="width: 335px; height: 320px;">

				<div id="ediles-1">
					<div id="cnt_edils1" style="width: 300px; height: 200px;">
						<p>Karnataka (223 / 223)</p>
					</div>

					<div id="leyenda-1"></div>

					<%

Class.forName("com.mysql.jdbc.Driver");
connectionURL = "jdbc:mysql://localhost:3306/elections";
dbConn = DriverManager.getConnection(connectionURL,"root","root"); 
//dbConn = DriverManager.getConnection(connectionURL,"itgd_office","$t0p@ct1ng43"); 
st = dbConn.createStatement();
try
{
	//query="SELECT sp.STATE,sp.PARTY,sp.LEAD,sp.WON,sp.GAINLOSS, pm.party_color_code, pm.abbr FROM statewise_partydetails sp, party_master pm where sp.ASSEMBLY=1 and sp.ACTIVE="+activeState+" and sp.STATE='"+stateName+"' and trim(sp.party)=trim(pm.abbr) order by sp.priority";
	//out.println("query--->"+query);
	query="SELECT e.state, e.party, e.previouswon, e.currentwon AS WON, e.currentleading AS LEAD, e.gainloss AS GAINLOSS, pm.party_color_code,pm.party_color_code,pm.abbr FROM election_seat_count_master e, party_master pm WHERE e.assembly=1 AND e.state='KARNATAKA' AND e.active='1' AND TRIM(LOWER(pm.abbr))=TRIM(LOWER(e.party)) order by e.priority";
	rs=st.executeQuery(query);
	int counter=1;
	int totalResult = 0; 
	while(rs.next()){
		totalResult = totalResult+rs.getInt("WON")+rs.getInt("LEAD");
	}
	rs.last();
	partyCount = rs.getRow();
	rs.beforeFirst();
	while(rs.next()){
	/*if(Integer.parseInt(rs.getString("GAINLOSS"))>0){
		gainLoss="+"+rs.getString("GAINLOSS");
	}else{
		gainLoss=rs.getString("GAINLOSS");
	}*/
	int tempGainLoss = rs.getInt("WON")+rs.getInt("LEAD"); 
	gainLoss=""+tempGainLoss;
		if(rs.getString("party_color_code")!=null && !rs.getString("party_color_code").equals("")) 
			partyColor = rs.getString("party_color_code").replace("0x","#");
		else
			partyColor = "#ff9f9f";

		if(counter==1){
%>
					<table width="300"
						border-style:solid;border-width:1px; cellpadding="2"
						cellspacing="0">
						<tr>
							<td bgcolor="#e3e3e3" class="resultados2007">Party Wise
								Tally</td>
							<span>Total: <strong><%=totalResult%>/<%=stateSeatCount%>&nbsp;&nbsp;&nbsp;&nbsp;</strong></span>
						</tr>
					</table>

					<div class="partwise-container-right">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">

							<tr>
								<td><table width="100%" border="0" align="center"
										cellpadding="0" cellspacing="5">
										<tr>
											<td><table width="265" cellspacing="0" cellpadding="0"
													border="0" class="state-row">
													<tbody>
														<tr>
															<td align="center" width="30%" valign="top"
																bgcolor="#D81920" class="tiletext">Parties</td>
															<td align="center" width="20%" valign="top"
																bgcolor="#D81920" class="tiletext">Lead</td>
															<td align="center" width="25%" valign="top"
																bgcolor="#D81920" class="tiletext">Results</td>
															<td align="center" width="25%" valign="top"
																bgcolor="#D81920" class="tiletext">Total</td>
														</tr>
													</tbody>
												</table></td>
										</tr>
										<tr>
											<td><ul id="mycarousel"
													class="jcarousel jcarousel-skin-tango">
													<%	}	%>
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="30%" height="18" bgcolor="<%=partyColor%>"
																class="tiletext_a"><%=rs.getString("PARTY")%></td>
															<td width="20%" height="18" align="center"
																bgcolor="#CCCCCC" class="tiletext_b"><%=rs.getString("LEAD")%></td>
															<td width="25%" height="18" align="center"
																bgcolor="#CCCCCC" class="tiletext_b"><%=rs.getString("WON")%></td>
															<td width="25%" height="18" align="center"
																bgcolor="#CCCCCC" class="tiletext_b"><%=gainLoss%></td>
														</tr>
													</table>
													<%		counter++;	
		}
} catch(Exception ee) {
	System.out.println("Exception in assembly-elections/partywisetally_en.jsp  page =>"+ee.toString());
} finally{
	if(rs!=null)
		rs.close();
	if(st!=null)
		st.close();
	if(dbConn!=null)
		dbConn.close();
}
%>
												</td>
										</tr>
									</table></td>
							</tr>
						</table>
					</div>

				</div>

			</div>

			<br />


		</div>
		<!-- div capital -1-->


		<br />
		<div id="taula_dades"
			style="width: 975px; height: 340px; text-align: center; clear: both;">
			<table id="list47"></table>
			<div id="plist47"></div>
		</div>
	</div>

</body>

</html>
