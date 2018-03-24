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
    	 ResultSet rs=null;
        Statement stmt=null;  
        Connection conn = null;
        String totalseats="";
        String state ="";
        String id="";
        String sttateNameHindi="";
        String constituencyHindi="";
        String xmlData="";
        String fileName="";
        String cid = null;
        String stateId="";
        String party = null;
        String constituency = null;
        String candidate = null;
        String status = null;
        String seatingmp = null;
        String seatingpartyname = null;
        String assembly = null;
        String winingmp = null;
        String winingpartyname = null;
        String winingpartycode = null;
       	int constituencyId=0;
        
       	
       	if(request.getParameter("state")!=null)
       		state=request.getParameter("state");
       	
        DbManager db = new DbManager();
        ArrayList parseData = null;
        //CostituencyJsonGenerator sjgObject = new CostituencyJsonGenerator();
        try{
        parseData = (ArrayList)getAssenblyConstituencyData(state);
     
        // System.out.println("@@@@@@@@@@@@"+parseData.size());
       
        if(parseData != null && parseData.size() > 0)
        {
            for(int i = 0; i < parseData.size(); i++)
            {
                XmlItem item = (XmlItem)parseData.get(i);
               
                sb = new StringBuffer();
               
                
                 state = item.getSTATE();
                 constituency = item.getConstituency();
                 seatingmp = item.getSeatingmp();
                 seatingpartyname = item.getSeatingpartyname();
                 winingmp = item.getWiningmp();
                 winingpartyname = item.getWiningpartyname();
                 status = item.getStatus();
                 cid = item.getCid();
                 constituencyHindi=item.getConstituencyHindi();
                 sttateNameHindi=item.getSTATEHINDI();
                colorCode = item.getColorCode();
                String cCode="";
                
                
                
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
					cCode = "#ffffff";
					status="Result Awaited";

				}
                if(cCode.contains("0x")){
                	cCode=cCode.replace("0x", "#");
                    }
               
              
                
                constituencyId=Integer.parseInt(cid);
                //constituencyId=constituencyId-4000;
                
                //cCode="#fe9400";
                stateId="22";
                sb.append("e"+constituencyId+"({");
                sb.append("\"loksabha\":");  
                sb.append("{\"consID\":\""+constituencyId+"\",\"sID\":\""+stateId+"\",\"sName\":\""+state+"\",\"cName\":\""+constituency+"\",\"sNameHindi\":\""+state+"\",\"cNameHindi\":\""+constituency+"\",\"colorCode\":\""+cCode+"\",");
                sb.append("\"items\":[{\"pName\":\""+winingpartyname+"\",\"candName\":\""+winingmp+"\",\"candNameHindi\":\""+winingmp+"\",\"votes\":\"\",\"Status\":\""+status+"\",\"color\":\""+cCode+"\"");
                
                
                
                
                 try
        {
            conn = Dbconnection.getInstance().getConnection();
            stmt = conn.createStatement();
           
            String Query = "SELECT `state`,`constituency`,`candidate`,`image`,`party` FROM `mp_reports_master_key` WHERE `cons_id`='"+item.getId()+"' AND `party`='"+winingpartyname+"'";
            rs = stmt.executeQuery(Query);
            //System.err.println("&&&&&&&&&&&&&&&"+Query);
            
            if(rs.next())
            {
                sb.append(",\"sUrl\":\"http://election.intoday.in/candidates/"+rs.getString("state").replace(" ","-")+".html\",\"cUrl\":\"http://election.intoday.in/candidates/"+rs.getString("state").replace(" ","-")+"/"+rs.getString("constituency").replace(" ","-")+".html\",\"candImage\":\"http://media2.intoday.in/indiatoday/mpreport/candidates_img/"+rs.getString("image")+"\",\"candProfile\":\"http://election.intoday.in/candidates/"+rs.getString("state").replace(" ","-")+"/"+rs.getString("constituency").replace(" ","-")+"/"+rs.getString("candidate").replace(" ","-")+".html\"");
                
                
            }else{
               sb.append(",\"sUrl\":\"\",\"cUrl\":\"\",\"candImage\":\"http://media2.intoday.in/indiatoday/mpreport/candidates_img/default.jpg\",\"candProfile\":\"\"");
            }

           
        }
        catch(Exception e)
        {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
                 finally{
        
        
        
        if(rs != null)
        {
            try
            {
                rs.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            rs = null;
        }
        if(stmt != null)
        {
            try
            {
                stmt.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            stmt = null;
        } if(conn != null)
        {
            try
            {
                conn.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            conn = null;
        }
       
       
       
        }
                sb.append("}]");
                sb.append("}})");
                
                xmlData=sb.toString();
                fileName=""+constituencyId; 
                String jsonPathFind=jsonPath+state.toLowerCase()+"\\cons\\";
             	generateXmlFile(xmlData, fileName,jsonPathFind,".json"); 
            }

        }
      
        }catch(Exception e){
         System.err.println("12@@"+e.getMessage());	
      e.printStackTrace();
        }
        finally{
        
        
        
        if(rs != null)
        {
            try
            {
                rs.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            rs = null;
        }
        if(stmt != null)
        {
            try
            {
                stmt.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            stmt = null;
        }
        if(conn != null)
        {
            try
            {
                conn.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            conn = null;
        }
       
        }
       

	%>
<%!
	
	public List getAssenblyConstituencyData(String stateName)
    {
        List dataList;
        ResultSet rs;
        Statement stmt;
        dataList = new ArrayList();
        XmlItem item = null;
    	Connection conn = null;
        rs = null;
        stmt = null;
        String id = null;
        String cid = null;
        String state = null;
        String sttateNameHindi="";
        String party = null;
        String constituency = null;
        String constituencyHindi = null;
        String candidate = null;
        String status = null;
        String seatingmp = null;
        String seatingpartyname = null;
        String assembly = null;
        String winingmp = null;
        String winingpartyname = null;
        String winingpartycode = null;
        String colorCode = null;
        try
        {
            conn = Dbconnection.getInstance().getConnection();
            stmt = conn.createStatement();
           
            //String Query = "select CONSTITUENCY_ID_2014,CID,STATE_NAME,CNAME,SEATING_MP,SEATING_PARTY_NAME,WINING_MP,WINING_PARTY,STATUS,ASSEMBLY from constituency_master where   active='1' and ASSEMBLY='0' order by CID";
            String Query = "SELECT CONSTITUENCY_ID_2014,CID,STATE_NAME,CNAME,SEATING_MP,SEATING_PARTY_NAME,WINING_MP,WINING_PARTY,STATUS,ASSEMBLY FROM constituency_master WHERE   active='1' AND ASSEMBLY='1' AND `STATE_NAME` ='"+stateName+"' ORDER BY CID";
            rs = stmt.executeQuery(Query);
          System.err.println("&&&&&&&&&&&&&&&"+Query);
            while(rs.next())
            {
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
                  id = rs.getString("CID");
             	//sttateNameHindi=new String(new String(rs.getString("STATE_NAME_H")).getBytes("ISO-8859-1"), "UTF-8");
            	//constituencyHindi=new String(new String(rs.getString("CNAME_H")).getBytes("ISO-8859-1"), "UTF-8");
                item.setSTATE(state);
                item.setConstituency(constituency);
                item.setSeatingmp(seatingmp);
                item.setSeatingpartyname(seatingpartyname);
                item.setWiningmp(winingmp);
                item.setWiningpartyname(winingpartyname);
                item.setStatus(status);
                item.setCid(cid);
                 item.setId(id);
                item.setAssembly(assembly);
                item.setConstituencyHindi(constituencyHindi);
                item.setSTATEHINDI(sttateNameHindi);
                dataList.add(item);
            }

           
        }
        catch(Exception e)
        {
            System.err.println("@@"+e.getMessage());
            //e.printStackTrace();
        }finally{
        
        
        
        if(rs != null)
        {
            try
            {
                rs.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            rs = null;
        }
        if(stmt != null)
        {
            try
            {
                stmt.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            stmt = null;
        }
        if(conn != null)
        {
            try
            {
                conn.close();
            }
            catch(SQLException sqle)
            {
                System.err.println(sqle.getMessage());
            }
            conn = null;
        }
       
        }
        
       
        return dataList;
    }
	



%>