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
		
		//request.get
		String name = db.getSateName(stateName);
		name=request.getParameter("state");
		
		//AssemblyCostituencyXmlGenerator objCxgen = new AssemblyCostituencyXmlGenerator();
		
		
		ResultSet rs = null;
		Statement stmt = null;
	
		String statetotalseats = null;
		Connection conn = null;
		String imagePath="http://media2.intoday.in/indiatoday/assemblypoll/";
		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "SELECT Candidate_Name, Party, Constituency, State, STATUS,`main_text`  FROM vip_master WHERE Assembly=1 AND Active=1 AND State='"+stateName+"' ORDER BY State_Ordering";

			rs = stmt.executeQuery(Query);
				sb= new StringBuffer();
		
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<ROOT>");
		sb.append("<STATE NAME=\"Kerala\">");
			while (rs.next()) {
				

		
				sb.append("<VIP ID=" + '"' + rs.getString("main_text")
						+ '"' + " CONSTITUENCY=" + '"'
						+ rs.getString("Constituency") + '"' + " CANDIDATE="
						+ '"' + rs.getString("Candidate_Name") + '"'
						+ " PARTY=" + '"'
						+ rs.getString("Party")  + '"' + " "
						+ "STATUS=" + '"' + rs.getString("STATUS")
						+ '"' + " IMAGE=" + '"'
						+ imagePath+rs.getString("Candidate_Name").replaceAll("\\(","").replaceAll("\\)","").replaceAll(" ","-")+".gif" + '"'+ "/>");
		
	}
	
sb.append("</STATE>");
		sb.append("</ROOT>");
		String xmlData=sb.toString();
 String fileName=name.replace(" ", "-").toLowerCase()+"_assembly_key_candidate_verse";
 //generateXmlFile(xmlData, fileName); 
        generateXmlFile(xmlData, fileName,xmlPath_verse,".xml");     


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
