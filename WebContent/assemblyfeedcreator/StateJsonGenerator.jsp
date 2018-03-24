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
        StringBuffer sb = new StringBuffer();
    
        String totalseats="";
        String state ="";
        String id="";
        String sttateNameHindi="";
        String xmlData="";
        String fileName="";
        DbManager db = new DbManager();
        ArrayList parseData = null;
      
        try{
      //  parseData = (ArrayList)getSateName();
     
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
		String state1="TAMIL NADU";
		String toSeats="234";
		//kerala 140
		//puducherry 30
		//tamil nadu 234
		//west bengal 294
		//assam 126
		
		
	  	if(request.getParameter("state")!=null)
	  		state1=request.getParameter("state");
       	
		
	  	if(request.getParameter("totalseats")!=null)
	  		toSeats=request.getParameter("totalseats");
		
		
		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select `STATE_ID_2014`,`TOTAL_SEATS_2014`,`STATE_NAME`,`STATE_NAME_H` from state_master where STATE_NAME='"+state1+"' order by STATE_NAME ";
			rs = stmt.executeQuery(Query);
			
			out.println(Query);
			
			while (rs.next()) {
				
			//Query1="SELECT sp.STATE,sp,sp.PARTY,sp.LEAD,sp.WON,sp.GAINLOSS, pm.party_color_code, pm.abbr FROM statewise_partydetails sp, party_master pm where sp.ASSEMBLY=1 and sp.ACTIVE='0' and sp.STATE='"+rs.getString("STATE_NAME")+"' and trim(sp.party)=trim(pm.abbr) order by sp.priority";
				
				state = rs.getString("STATE_NAME");
				totalSeats = rs.getString("TOTAL_SEATS_2014");
				//for delhi assembly elections
				totalSeats = toSeats;
				stateId= rs.getString("STATE_ID_2014");
				sttateNameHindi=new String(new String(rs.getString("STATE_NAME_H")).getBytes("ISO-8859-1"), "UTF-8");
				sb = new StringBuffer();
				
				//System.out.println("@@@@@@@-->"+totalSeats);
				
				sb.append("e"+state.replaceAll(" ", "").replaceAll("&", "and").toLowerCase()+"2014({");
                sb.append("\"loksabha\": {");                
                sb.append("\"sName\": \""+state+"\",");
                sb.append("\"sNameHindi\": \""+state+"\",");
                sb.append("\"sID\": \""+stateId+"\",");
                sb.append("\"totalSeats\": \""+totalSeats+"\"");	   
			
			//Query1="SELECT sm.`STATE_ID_2014`,sm.`TOTAL_SEATS_2014`,sm.`STATE_NAME`,sm.`STATE_NAME_H`,sp.STATE,sp.PARTY,sp.LEAD,sp.WON,sp.GAINLOSS, pm.party_color_code, pm.abbr FROM statewise_partydetails sp, party_master pm ,`state_master` sm	WHERE sp.ASSEMBLY='0' AND sp.ACTIVE='0' and sm.`STATE_NAME`='"+rs.getString("STATE_NAME")+"' AND TRIM(sp.party)=TRIM(pm.abbr) AND sm.`STATE_NAME`=sp.STATE ORDER BY sp.priority";
			
			//Query1="SELECT sp.STATE,pm.PARTY_COLOR_CODE,sp.PARTY,SUM(sp.LEAD) AS LEAD,SUM(sp.WON) AS WON	FROM  statewise_partydetails AS sp, party_master AS pm  WHERE sp.STATE='"+rs.getString("STATE_NAME")+"' AND TRIM(pm.ABBR)=TRIM(sp.PARTY) AND sp.ACTIVE=6 AND sp.STATUS!='NA' GROUP BY sp.PARTY ORDER BY sp.PRIORITY";
			//Query1="SELECT STATE_NAME,`WINING_PARTY`,COUNT(`STATUS`)AS COUNT FROM `constituency_master` WHERE active='7' AND `ASSEMBLY`='0' AND `STATE_NAME`='"+rs.getString("STATE_NAME")+"' AND `STATUS`IN('LEADING','WON') AND `WINING_PARTY`<>'NOTA' GROUP BY `WINING_PARTY`";
			//Query1="SELECT cm.STATE_NAME,cm.WINING_PARTY,COUNT(cm.STATUS)AS COUNT,pm.PARTY_COLOR_CODE FROM `constituency_master` cm,`party_master` pm WHERE cm.active='7' AND cm.ASSEMBLY='0' AND pm.`ABBR`=cm.WINING_PARTY AND cm.STATE_NAME='"+rs.getString("STATE_NAME")+"' AND cm.STATUS IN('LEADING','WON') AND cm.WINING_PARTY<>'NOTA' GROUP BY cm.WINING_PARTY ORDER BY COUNT DESC";
			//for delhi assembly election
			Query1="SELECT cm.STATE_NAME,cm.WINING_PARTY,COUNT(cm.STATUS)AS COUNT,pm.PARTY_COLOR_CODE FROM `constituency_master` cm,`party_master` pm WHERE cm.active='1' AND cm.ASSEMBLY='1' AND pm.`ABBR`=cm.WINING_PARTY AND cm.STATE_NAME='"+rs.getString("STATE_NAME")+"' AND cm.STATUS IN('LEADING','WON') AND cm.WINING_PARTY<>'NOTA' GROUP BY cm.WINING_PARTY ORDER BY COUNT DESC";
			stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs1 = stmt1.executeQuery(Query1);
			int counter=0;
			out.println("@@@@@@@@@@--->"+Query1);
			
			rs1.last();     
			int size = rs1.getRow() ;       
			rs1.beforeFirst();
			
			out.println("@@@@@@@@@@--->"+size);
			
			while (rs1.next()) {
				
			
				totalResult = rs1.getInt("COUNT");
				
				if(rs1.getString("party_color_code")!=null && !rs1.getString("party_color_code").equals("")) 
					partyColor = rs1.getString("party_color_code").replace("0x","#");
				else
					partyColor = "#fffff";
				
				partyName=rs1.getString("WINING_PARTY");
				
				//System.out.println("totalResult-->"+totalResult);
				
				 
				 if(counter==0){
	                             
	                sb.append(",\"items\": [");        
				 }
	                sb.append("{\"pName\": \""+partyName+"\",\"pSeats\": \""+totalResult+"\",\"pColor\":\""+partyColor+"\"}");
	                
	                if(counter!=size-1){
	                sb.append(",");
	                }
	                if(counter==size-1){	                	
	                sb.append("]");
	                }
	               
				
				counter++;

			}
			if(counter==0){
				sb.append(",\"items\": ["); 
				  //sb.append("{\"pName\": \"\",\"pSeats\": \"0\",\"pColor\":\"\"}");
				  sb.append("{\"pName\": \"BJP+\",\"pSeats\": \"0\",\"pColor\":\"#F57B19\"},{\"pName\": \"JDU+\",\"pSeats\": \"0\",\"pColor\":\"#DDBC0F\"},{\"pName\": \"OTH\",\"pSeats\": \"0\",\"pColor\":\"#9933ff\"}");
				  sb.append("]");
				
			}
			
			
			 sb.append("}})");
			 xmlData=sb.toString();
             fileName=state.replaceAll(" ", "-").replaceAll("&", "and").toLowerCase();
            generateXmlFile(xmlData, fileName,jsonPath+"state/",".json");      
       
			}

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
       
       
               
      
        }catch(Exception e){
        	
        e.printStackTrace();
        }
        
       
		
    

	%>
