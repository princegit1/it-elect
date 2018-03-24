<%@ page
	import=" java.io.File, java.io.FileOutputStream, java.io.IOException, java.io.PrintWriter, java.sql.Connection,
 java.sql.ResultSet, java.sql.SQLException, java.sql.Statement, java.util.ArrayList, java.util.List,
 com.itgd.data.DbManager, com.itgd.data.Dbconnection, com.itgd.parser.DecodeXML, com.itgd.parser.XmlItem"%>
<%@include file="global.jsp"%>

<%


        String partname = null;
        DecodeXML xml = new DecodeXML(); 
        String pabbrname = null;
        String colorCode = null;
        String winingpabbrname = null;
        StringBuffer sb = null;    
        String totalseats="";
        String state ="";
        String id="";
        String sttateNameHindi="";
        String xmlData="";
        String fileName="";
        DbManager db = new DbManager();
        ArrayList parseData = null;
        String alliance="";
        //AllianceWiseJsonGenerator sjgObject = new AllianceWiseJsonGenerator();
       
     
        XmlItem item = null;
		ResultSet rs = null,rs1 = null;
		Statement stmt = null,stmt1=null;
		//String state = null;
		Connection conn = null;
	
		String totalSeats="";
		String stateId="";
		//String sttateNameHindi="";
		String Query1 ="";
		String gainLoss="";
		String partyColor = "";
		int totalResult = 0; 
		String partyName="";
		String allianceFullname="";
		String status="";
		String won="0";
		String lead="0";
		//String allinaceDeatils[]={"ANDHRA PRADESH","ODISHA","SIKKIM"};
		String allinaceDeatils[]={"BIHAR"};			
		String allianceColor="";
		String allianceOthersColor="";
		int totalResult1=0;
		
		for (int i = 0; i < allinaceDeatils.length; i++) {
		try {
			
				totalResult1=0;
				conn = Dbconnection.getInstance().getConnection();
			
				
			alliance=allinaceDeatils[i];			
			stmt = conn.createStatement();		
			
		
					String Query = "SELECT e.state, e.party, e.previouswon, e.currentwon AS won, e.currentleading AS lead, e.gainloss AS GAINLOSS, pm.party_color_code,pm.abbr_h AS PARTY_h FROM election_seat_count_master e, party_master pm WHERE e.assembly=1 AND e.state='"+allinaceDeatils[i]+"' AND e.active='11' AND TRIM(LOWER(pm.abbr))=TRIM(LOWER(e.party)) ORDER BY e.priority";
					//String Query = "SELECT sp.`STATE`,SUM(sp.WON) AS won,SUM(sp.LEAD) AS lead,SUM(sp.WON)+SUM(sp.LEAD) AS 'Lead+Won',sp.party,pm.`PARTY_COLOR_CODE` FROM `statewise_partydetails`sp,`party_master` pm WHERE sp.state='"+allinaceDeatils[i]+"' AND sp.active='8' AND sp.ASSEMBLY='1' AND sp.party=pm.ABBR AND sp.STATUS IN('LEADING','WON') GROUP BY sp.party";
			
	//out.println("@@@@@@@@@@@@@@"+Query);
			rs = stmt.executeQuery(Query);
			int counter=0;	
			int size=0;
			
			sb = new StringBuffer();
			parseData= new ArrayList();
			while (rs.next())
			{
				totalResult1=totalResult1+(rs.getInt("won")+rs.getInt("lead"));
				
				won=rs.getString("won");
				lead=rs.getString("lead");
				state=rs.getString("state");
				if(rs.getString("party_color_code")!=null && !rs.getString("party_color_code").equals("")) 
					partyColor = rs.getString("party_color_code").replace("0x","#");
				else
					partyColor = "#F7F7F7";
			
				
				if(won==null || won.equals("")){
					won="0";
				}
				if(lead==null || lead.equals("")){
					lead="0";
				}
				
				partyName=rs.getString("party");
				
				item = new XmlItem();				
				item.setTotalSeats(Integer.toString(totalResult1));
				item.setWon(won);
				item.setLead(lead);
				item.setPARTY(partyName);
				item.setColorCode(partyColor);
				item.setSTATE(state);
				parseData.add(item);
				
			}
			
			/*	if(alliance.equals("ANDHRA PRADESH")){
		totalResult=294 ;
		
		}else if(alliance.equals("ODISHA")){
		totalResult=147;
		
		}else if(alliance.equals("SIKKIM")){
		totalResult=32;
		
		}*/
		
//out.println("@@@@-->"+totalResult1);
         
			if(alliance.equalsIgnoreCase("BIHAR")){
		totalResult=243 ;
		
		}
				
		
			
			sb.append("e"+alliance.replaceAll(" ", "").replaceAll("&", "and").toLowerCase()+"2014({");
            sb.append("\"loksabha\": {");                
            sb.append("\"aName\": \""+alliance+"\",");
            sb.append("\"aFullName\": \""+alliance+"\",");
            sb.append("\"aFullNameHindi\": \""+alliance+"\",");
            sb.append("\"aSeats\": \""+totalResult+"\",");
            sb.append("\"aSeatOthers\": \""+(totalResult1)+"\",");
            sb.append("\"aColor\": \""+allianceColor+"\",");
            sb.append("\"aColorOthers\": \""+allianceOthersColor+"\"");
            sb.append(",\"items\": [");  
            
            if(parseData != null && parseData.size() > 0)
            {
                for(int j = 0; j < parseData.size(); j++)
                {
                     item = (XmlItem)parseData.get(j);
                     
                     
                     
                     
		       
                     
                     sb.append("{\"pName\": \""+item.getPARTY()+"\",\"pColor\":\""+item.getColorCode()+"\",\"pfullName\":\""+item.getPARTY()+"\",\"pLead\":\""+item.getLead()+"\",\"pWon\": \""+item.getWon()+"\"}");
 	                
 	                if(j!=parseData.size()-1){
 	                sb.append(",");
 	                }
                    
                }
                }else{
				sb.append("{\"pName\": \"\",\"pColor\":\"\",\"pfullName\":\"\",\"pLead\":\"\",\"pWon\": \"\"}");
				
			}
		
			 sb.append("]}})");
			 xmlData=sb.toString();
             fileName=alliance.replaceAll(" ", "-").replaceAll("&", "and").toLowerCase().replaceAll("%20", "").replaceAll(":", "")+"-assembly-alliance";
             generateXmlFile(xmlData, fileName,jsonPath,".json");       
       
		

		} catch (Exception e) {
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
			if (rs1 != null) {
				try {
					rs1.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				rs1 = null;
			}
			if (stmt1 != null) {
				try {
					stmt1.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				stmt1 = null;
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
       
       
               
      
       
		}
    

	
	%>
