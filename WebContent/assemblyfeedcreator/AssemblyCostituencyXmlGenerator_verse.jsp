<%@ page
	import=" java.io.File, java.io.FileOutputStream, java.io.IOException, java.io.PrintWriter, java.sql.Connection,
 java.sql.ResultSet, java.sql.SQLException, java.sql.Statement, java.util.ArrayList, java.util.List,
 com.itgd.data.DbManager, com.itgd.data.Dbconnection, com.itgd.parser.DecodeXML, com.itgd.parser.XmlItem"%>
<%@include file="global.jsp"%>
<%

		String partname = null;
		String cCode;

		DecodeXML xml = new DecodeXML();
		String pabbrname = null;
		String colorCode = null;
		String winingpabbrname = null;
		 StringBuffer sb = new StringBuffer();
		String stateName = "";
		DbManager db = new DbManager();
		String name = db.getSateName(stateName);
		
		
		//AssemblyCostituencyXmlGenerator objCxgen = new AssemblyCostituencyXmlGenerator();
		
		
		ResultSet rs = null;
		Statement stmt = null;
	
		String statetotalseats = null;
		Connection conn = null;
		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select STATE_NAME,TOTAL_SEATS_2014 from state_master where STATE_ID in ('S06') order by STATE_ID_2014";

			rs = stmt.executeQuery(Query);
			while (rs.next()) {
				name=rs.getString("STATE_NAME");
		sb= new StringBuffer();
		ArrayList parseData = (ArrayList) getParsedNewConstituencyData(name);
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<ROOT>");
		sb.append("<STATE NAME=" + '"' + xml.decodeEntities(name) + '"'
						+ ">");

		if (parseData != null && parseData.size() > 0) {

			for (int i = 0; i < parseData.size(); i++) {
				XmlItem item = (XmlItem) parseData.get(i);

				String state = item.getSTATE();
				String constituency = item.getConstituency();
				String seatingmp = item.getSeatingmp();
				String seatingpartyname = item.getSeatingpartyname();
				String winingmp = item.getWiningmp();
				String winingpartyname = item.getWiningpartyname();
				String status = item.getStatus();
				String cid = item.getCid();
				colorCode = item.getColorCode();

				if (status != null && status.equalsIgnoreCase("WON")) {
					partname = item.getWiningpartyname();
					//System.out.println("party  name--->"+partname);
					cCode = db.getPartyColourName(partname);
					//System.out.println("color code--->"+cCode);
					winingmp = winingmp;
					winingpartyname = winingpartyname;
					//winingmp = winingmp +"(WON)";
					//System.out.println("winingmp--->"+winingmp);
					if (cCode==null||cCode.equalsIgnoreCase("")) {

						cCode = "#ffffff";
					}

				}else if (status != null && status.equalsIgnoreCase("LEADING")) {
					partname = item.getWiningpartyname();
					//System.out.println("party  name--->"+partname);
					cCode = db.getPartyColourName(partname);
					//System.out.println("color code--->"+cCode);
					winingmp = winingmp;
					winingpartyname = winingpartyname;
					//winingmp = winingmp +"(LEADING)";
					//System.out.println("winingmp--->"+winingmp);
					if (cCode==null||cCode.equalsIgnoreCase("")) {

						cCode = "#ffffff";
					}

				} else {

					winingmp = "Result Awaited";
					winingpartyname = "Result Awaited";
					status="Result Awaited";
					cCode = "Result Awaited";

				}

				sb.append("<CONSTITUENCY ID=" + '"' + xml.decodeEntities(cid)
						+ '"' + " NAME=" + '"'
						+ xml.decodeEntities(constituency) + '"' + " SITINGMP="
						+ '"' + xml.decodeEntities(seatingmp) + '"'
						+ " SITINGPARTYNAME=" + '"'
						+ xml.decodeEntities(seatingpartyname) + '"' + " "
						+ "WININGMP=" + '"' + xml.decodeEntities(winingmp)
						+ '"' + " WININGPARTYNAME=" + '"'
						+ xml.decodeEntities(winingpartyname) + '"'
						+ "  COLORCODE =" + '"' + xml.decodeEntities(cCode)
						+ '"' + "  STATUS =" + '"' + xml.decodeEntities(status)
						+ '"' + "/>");

			}
		}
		sb.append("</STATE>");
		sb.append("</ROOT>");
		String xmlData=sb.toString();
	 
         String fileName=name.replaceAll(" ", "_").replaceAll("&", "and").toLowerCase().replaceAll("%20", "").replaceAll(":", "")+"_assembly_constituency_tally_verse";;
        //generateXmlFile(xmlData, fileName); 
        generateXmlFile(xmlData, fileName,xmlPath_verse,".xml");      
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
	
		
	
	%>
<%!
	

	public List getParsedNewConstituencyData(String stateName) {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
		String cid = null;
		String state = null;
		String party = null;
		Connection conn = null;
		String constituency = null;
		String candidate = null;
		String status = null;
		String seatingmp = null;
		String seatingpartyname = null;
		String assembly = null;
		String winingmp = null;
		String winingpartyname = null;
		String winingpartycode = null;
		String colorCode = null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select 	CID,STATE_NAME,CNAME,SEATING_MP,SEATING_PARTY_NAME,WINING_MP,WINING_PARTY,STATUS,ASSEMBLY from constituency_master where STATE_NAME='"
					+ stateName + "' and ASSEMBLY='1' and ACTIVE='1'";

			rs = stmt.executeQuery(Query);
			while (rs.next()) {
			
				item = new XmlItem();
				cid = rs.getString("CID");
				state = rs.getString("STATE_NAME");
				constituency = rs.getString("CNAME");
				seatingmp = rs.getString("SEATING_MP");
				seatingpartyname = rs.getString("SEATING_PARTY_NAME");
				winingmp = rs.getString("WINING_MP");
				winingpartyname = rs.getString("WINING_PARTY");
				status = rs.getString("STATUS");
				assembly = rs.getString("ASSEMBLY");

				item.setSTATE(state);
				item.setConstituency(constituency);
				item.setSeatingmp(seatingmp);
				item.setSeatingpartyname(seatingpartyname);
				item.setWiningmp(winingmp);
				item.setWiningpartyname(winingpartyname);
				item.setStatus(status);
				item.setCid(cid);
				item.setAssembly(assembly);

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