<%@ page
	import="java.util.*,com.itgd.server.*,com.itgd.parser.*,com.itgd.data.*,java.sql.*"%>
<%
     response.setHeader("Cache-Control","no-store"); //HTTP 1.1
     response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
 
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PARTY MASTER EDITOR</title>
<link rel="stylesheet" href="mystyle.css" type="text/css" />

</head>
<body>
	<table width="100%" border="0" cellspacing="2" cellpadding="2">
		<tr>
			<td>
				<form action="partyeditdata" method="post">
					<table width="100%" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#000000">
						<tr
							style="background-color: #D71920; font: bold 14px georgia; color: #ffffff; border: 1px solid #000000;">




							<td style="padding-left: 2px;">PARTY NAME</td>
							<td style="padding-left: 2px;">PARTY ABBR</td>
							<td style="padding-left: 2px;">PARTY COLOR CODE</td>
							<td style="padding-left: 2px;">COLOR</td>
							<td></td>

						</tr>

						<%
DecodeXML decode = new DecodeXML(); 
 ArrayList parseData=((ArrayList) getPartyData()); 

			if(parseData!= null && parseData.size()>0)
				{
					for(int i=0;i<parseData.size();i++)
						{
							VipItem item= (VipItem) parseData.get(i);
   %>
						<tr
							style="font: normal 12px georgia; color: #000000; border: 1px solid #000000;">
							<td valign="top" style="padding-left: 1px;"><input
								type="text" name="partyname" size="50"
								value=' <%= decode.decodeEntities(item.getPARTY()) %> '></td>
							<td align="top" valign="top" style="padding-left: 2px;"><input
								type="text" name="partyabbr"
								value=' <%= item.getPabbrname() %> '></td>
							<td align="top" valign="top" style="padding-left: 2px;"><input
								type="text" name="colorcode"
								value=' <%= item.getColorCode() %> '></td>
							<td height="27" colspan="2"
								bgcolor="<%=item.getColorCode().replace("0x","")%>"
								class="partiescolor"><br>
							<br></td>
							<input type="hidden" name="id" value='<%= item.getId() %>' />

						</tr>


						<%
  
	 }


 }else{ %>
						<tr>
							<td class="searchinfo" colspan="8" style="padding-left: 2px;">
								<fieldset>
									<strong>No Result Found</strong>
								</fieldset>
							</td>
						</tr>
						<%} %>


						<tr>
							<td colspan="2"><input type="submit" value="Submit" /></td>
						</tr>


					</table>
				</form>

			</td>
		</tr>
	</table>
</body>
</html>
<%!
public List getPartyData() {
		 
		List dataList = new ArrayList();
		VipItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
			Connection conn = null;

		String partyname = null;
		String pabbrname = null;
		String colorCode = null;
		String id = null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from party_master ";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new VipItem();
				id = rs.getString("PCODE");
				partyname = rs.getString("PNAME");
				pabbrname = rs.getString("ABBR");
				colorCode = rs.getString("PARTY_COLOR_CODE");
				

				
				item.setPARTY(partyname);
				item.setPabbrname(pabbrname);
				item.setColorCode(colorCode);
				item.setId(id);

				dataList.add(item);

				



			}

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				rs = null;
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				stmt = null;
			}
if (conn != null) {
				try {
					conn.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				conn = null;
			}

		}
		
		return dataList;

	}
 %>
