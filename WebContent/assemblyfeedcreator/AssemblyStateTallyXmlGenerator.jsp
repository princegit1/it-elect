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
		
		
		//StateTallyXmlGenerator objCxgen = new StateTallyXmlGenerator();
		
		
		ResultSet rs = null;
		Statement stmt = null;
		int stateTotalSeats=0;
		String statetotalseats = null;
		Connection conn = null;
		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select STATE_ID,STATE_NAME,TOTAL_SEATS_2014 from state_master where STATE_ID in ('S06') order by STATE_ID_2014";

			rs = stmt.executeQuery(Query);
			while (rs.next()) {
				name=rs.getString("STATE_NAME");
		sb= new StringBuffer();
		ArrayList parseData = null;
		
		
		parseData = (ArrayList) getStatedData(name);
		
		if(rs.getString("STATE_ID").equals("S06")){
		stateTotalSeats=243 ;		
		}
		

		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<ROOT>");
		sb.append("<STATE NAME=" + '"' + xml.decodeEntities(name) + '"'
						+ " TOTAL_SEATS='"+stateTotalSeats+"'>");

		if (parseData != null && parseData.size() > 0) {

			for (int i = 0; i < parseData.size(); i++) {
				XmlItem item = (XmlItem) parseData.get(i);
				String state = item.getSTATE();
				String party = item.getPARTY();
				String lastwon = item.getLastwon();
				String won = item.getWon();
				String lead = item.getLead();
				String gainloss = item.getGainloss();
				
				//out.println(state+"lead-->"+lead);
				
				if(won==null || won.equals("")){
					won="0";
				}
				if(lead==null || lead.equals("")){
					lead="0";
				}
				
				int int1 = Integer.parseInt(lead);
                int int2 = Integer.parseInt(won);
                int int3 = int1 + int2;

				sb.append("<PARTY NAME=" + '"' + xml.decodeEntities(party)
						+ '"' + " LASTWON=" + '"' + xml.decodeEntities(lastwon)
						+ '"' + " LEAD =" + '"' + xml.decodeEntities(lead)
						+ '"' + " RESULT= " + '"' + xml.decodeEntities(won)
						+ '"' + " GAINLOSS= " + '"'
						+ int3 + '"' + "/>");
			}
		}else{
			
			sb.append("<PARTY NAME=\"\" LASTWON=\"0\" LEAD =\"0\" RESULT=\"0\" GAINLOSS=\"0\"/>");
		}
		sb.append("</STATE>");
		sb.append("</ROOT>");
		
		
		
		
		 String xmlData=sb.toString();
		 String fileName=name.replaceAll(" ", "_").replaceAll("&", "and").toLowerCase().replaceAll("%20", "").replaceAll(":", "")+"-assembly-party-tally_verse";
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
	
	
	
	public List getStatedData(String stateName) {
		Connection conn = null;
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String count = null;
		String id = null;
		String assembly = null;
		String priority = null;
		String gainloss = null;
		String lastwon = null;
		String won = null;
		String lead = null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			//String Query = "select 	ID,STATE,PARTY,LASTWON,WON,LEAD,GAINLOSS,ASSEMBLY,PRIORITY from statewise_partydetails where STATE='"+ stateName + "'and ASSEMBLY='1' and ='10' order by PRIORITY";
			
			/*String Query = "SELECT STATE,party,MAX(IF(STATUS='LEADING',LEAD,''))AS lead,MAX(IF(STATUS='WON',WON,''))AS won," +
					"(MAX(IF(STATUS='LEADING',LEAD,''))+MAX(IF(STATUS='WON',WON,'')))AS 'Lead+Won',priority FROM" +
					"(SELECT `STATE`,party,priority,STATUS,`LEAD`as LEAD,`WON`as WON " +
					"FROM `statewise_partydetails` WHERE `ACTIVE`='7' AND `ASSEMBLY`='1' AND state='"
					+ stateName + "')tbl" +
					" GROUP BY party,priority ORDER BY `PRIORITY`";*/
					
					//String Query = "SELECT sp.`STATE`,SUM(sp.WON) AS WON,SUM(sp.LEAD) AS LEAD,SUM(sp.WON)+SUM(sp.LEAD) AS 'Lead+Won',sp.party,pm.`PARTY_COLOR_CODE` FROM `statewise_partydetails`sp,`party_master` pm WHERE sp.state='"+stateName+"' AND sp.active='7' AND sp.ASSEMBLY='1' AND sp.party=pm.ABBR AND sp.STATUS IN('LEADING','WON') GROUP BY sp.party";
					//String Query = "SELECT STATE_NAME,`WINING_PARTY`,COUNT(`STATUS`)AS COUNT FROM `constituency_master` WHERE active='8' AND `ASSEMBLY`='1' AND `STATE_NAME`='"+stateName+"' AND `STATUS`IN('LEADING','WON') AND `WINING_PARTY`<>'NOTA' GROUP BY `WINING_PARTY`";
					String Query = "SELECT e.state, e.party, e.previouswon, e.currentwon AS won, e.currentleading AS lead, e.gainloss AS GAINLOSS, pm.party_color_code,pm.abbr_h AS PARTY_h FROM election_seat_count_master e, party_master pm WHERE e.assembly=1 AND e.state='"+stateName+"' AND e.active='1' AND TRIM(LOWER(pm.abbr))=TRIM(LOWER(e.party)) ORDER BY e.priority";
					

			rs = stmt.executeQuery(Query);
			while (rs.next()) {
			
				item = new XmlItem();
			
				state = rs.getString("state");
				party = rs.getString("party");
				lastwon = "0";
				won = rs.getString("won");
				lead = rs.getString("lead");
				//lead = "0";
				gainloss = "0";
		

				item.setSTATE(state);
				item.setPARTY(party);
				item.setLastwon(lastwon);
				item.setWon(won);
				item.setLead(lead);
				item.setGainloss(gainloss);
				item.setAssembly(assembly);
				item.setId(id);
				item.setPriority(priority);

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