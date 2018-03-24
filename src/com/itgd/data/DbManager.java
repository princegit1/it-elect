package com.itgd.data;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.itgd.parser.ConstituencyItem;
import com.itgd.parser.NationalItem;
import com.itgd.parser.VipItem;
import com.itgd.parser.XmlItem;
/* @author Santosh Kumar Jena
 * @version
 */

public class DbManager {
	private static DbManager mgr = null;
	Connection conn = null;

	/**
	 * ***********************Helpre Methodes
	 * Starts*******************************
	 */

	public List getParsedData() {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String previouswon = null;
		String previousleading = null;
		String currentwon = null;
		String currentleading = null;

		try {

			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from election_seat_count_master where active='1' AND `ASSEMBLY`='1'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new XmlItem();

				state = rs.getString("STATE");
				party = rs.getString("PARTY");
				previouswon = rs.getString("PREVIOUSWON");
				previousleading = rs.getString("PREVIOUSLEADING");
				currentwon = rs.getString("CURRENTWON");
				currentleading = rs.getString("CURRENTLEADING");

				item.setSTATE(state);
				item.setPARTY(party);
				item.setPREVIOUSLEADING(previousleading);
				item.setPREVIOUSWON(previouswon);
				item.setCURRENTLEADING(currentleading);
				item.setCURRENTWON(currentwon);

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
	public List getParsedDataForEdit(String dataId) {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String previouswon = null;
		String previousleading = null;
		String currentwon = null;
		String currentleading = null;
		String id = null;
		String priority=null;
		

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from election_seat_count_master where ID='"
					+ dataId + "'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {
				
				item= new XmlItem();
				
				item = new XmlItem();
				
				id = rs.getString("ID");
				state = rs.getString("STATE");
				party = rs.getString("PARTY");
				previouswon = rs.getString("PREVIOUSWON");
				previousleading = rs.getString("PREVIOUSLEADING");
				currentwon = rs.getString("CURRENTWON");
				currentleading = rs.getString("CURRENTLEADING");
				priority=rs.getString("PRIORITY");

				item.setSTATE(state);
				item.setPARTY(party);
				item.setPREVIOUSLEADING(previousleading);
				item.setPREVIOUSWON(previouswon);
				item.setCURRENTLEADING(currentleading);
				item.setCURRENTWON(currentwon);
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
	
	public List getNationalDataForEdit(String dataId) {
		List dataList = new ArrayList();
		NationalItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String previouswon = null;
		String previousleading = null;
		String currentwon = null;
		String currentleading = null;
		String id = null;
		

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from national_seat_count_master where ID='"+ dataId + "'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {
				
				item= new NationalItem();
				id = rs.getString("ID");
				party = rs.getString("PARTY");
				previouswon = rs.getString("PREVIOUSWON");
				previousleading = rs.getString("PREVIOUSLEADING");
				currentwon = rs.getString("CURRENTWON");
				currentleading = rs.getString("CURRENTLEADING");

				
				item.setPARTY(party);
				item.setPREVIOUSLEADING(previousleading);
				item.setPREVIOUSWON(previouswon);
				item.setCURRENTLEADING(currentleading);
				item.setCURRENTWON(currentwon);
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
	
	public List getVipDataForEdit(String dataId) {
		List dataList = new ArrayList();
		VipItem item = null;
		ResultSet rs = null;
		Statement stmt = null;


		String state = null;
		String party = null;
		String constituency=null; 
		String candidate=null;
		String status=null;
		String id=null;
		

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from vip_master where SLNO='"+ dataId + "'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {
				
							
				item = new VipItem();
				
				id=rs.getString("SLNO");
				state = rs.getString("State");
				party = rs.getString("Party");
				constituency = rs.getString("Constituency");
				candidate = rs.getString("Candidate_Name");
				status = rs.getString("Status");

				item.setSTATE(state);
				item.setPARTY(party);
				item.setConstituency(constituency);
				item.setCandidate(candidate);
				item.setStatus(status);
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
	
	private static void sendGet(String url) throws Exception {

		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// optional default is GET
		con.setRequestMethod("GET");

		int responseCode = con.getResponseCode();
		
		BufferedReader in = new BufferedReader(
		        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
	}
	
	
	public List getParsedData(String stateName) {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String previouswon = null;
		String previousleading = null;
		String currentwon = null;
		String currentleading = null;
		String id = null;
		String priority=null;
		String gainloss = null;
		try {
			//String url="http://localhost:8080/elections-new/assemblyfeedcreator/StateJsonGenerator.jsp?state="+stateName+"&totalseats=126";
			String url="http://localhost:8080/elections-new/assemblyfeedcreator/AssemblyStateAllianceJsonGenerator-for-chart.jsp";
			sendGet(url);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from election_seat_count_master where STATE='"+ stateName + "' and ASSEMBLY='1' and ACTIVE='1' and PRIORITY>='1' order by PRIORITY";
			//System.out.println("@@@->"+Query);
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new XmlItem();
				id = rs.getString("ID");
				state = rs.getString("STATE");
				party = rs.getString("PARTY");
				previouswon = rs.getString("PREVIOUSWON");
				previousleading = rs.getString("PREVIOUSLEADING");
				currentwon = rs.getString("CURRENTWON");
				currentleading = rs.getString("CURRENTLEADING");
				priority=rs.getString("PRIORITY");
				gainloss=rs.getString("GAINLOSS");
				
				

				item.setSTATE(state);
				item.setPARTY(party);
				item.setPREVIOUSLEADING(previousleading);
				item.setPREVIOUSWON(previouswon);
				item.setCURRENTLEADING(currentleading);
				item.setCURRENTWON(currentwon);
				item.setId(id);
				item.setPriority(priority);
				item.setGainloss(gainloss);

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
	public List getAssemblyedData(String stateName) {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String alliance = null;
		String count = null;
		String previousleading = null;
		String currentwon = null;
		String currentleading = null;
		String id = null;
		String assembly=null;
		String priority=null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from state_alliance_details where STATE='"
					+ stateName + "'and ASSEMBLY='1' and ACTIVE='1' order by PRIORITY";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new XmlItem();
				id = rs.getString("ID");
				state = rs.getString("STATE");
				alliance = rs.getString("ALLIANCE");
				count = rs.getString("COUNT");				
				assembly = rs.getString("ASSEMBLY");
				priority=rs.getString("PRIORITY");

				item.setSTATE(state);
				item.setAlliance(alliance);
				item.setCount(count);
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
	public List getNewStatedData(String stateName) {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String alliance = null;
		String count = null;
		String previousleading = null;
		String currentwon = null;
		String currentleading = null;
		String id = null;
		String assembly=null;
		String priority=null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from state_alliance_details where STATE='"
					+ stateName + "'and ASSEMBLY='1' and active='1'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new XmlItem();
				id = rs.getString("ID");
				state = rs.getString("STATE");
				alliance = rs.getString("ALLIANCE");
				count = rs.getString("COUNT");				
				assembly = rs.getString("ASSEMBLY");
				priority=rs.getString("PRIORITY");

				item.setSTATE(state);
				item.setAlliance(alliance);
				item.setCount(count);
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
	public List getStatedData(String stateName) {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String count = null;		
		String id = null;
		String assembly=null;
		String priority=null;
		String gainloss=null;
		String lastwon = null;
		String won = null;
		String lead = null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from statewise_partydetails where STATE='"+ stateName + "'and ASSEMBLY='1'and ACTIVE='1' order by PRIORITY";
			//System.out.println("613. DbManager.java:: query: "+Query);
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new XmlItem();
				id = rs.getString("ID");
				state = rs.getString("STATE");
				party = rs.getString("PARTY");
				lastwon = rs.getString("LASTWON");				
				won = rs.getString("WON");
				lead=rs.getString("LEAD");
				gainloss = rs.getString("GAINLOSS");
				assembly = rs.getString("ASSEMBLY");				
				priority = rs.getString("PRIORITY");
			

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
	public List getNationalData() {
		List dataList = new ArrayList();
		NationalItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String previouswon = null;
		String previousleading = null;
		String currentwon = null;
		String currentleading = null;
		String id = null;
		String priority=null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from national_seat_count_master  WHERE PRIORITY>='1' and active='1' AND `ASSEMBLY`='1' order by PRIORITY";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new NationalItem();
				id = rs.getString("ID");
				party = rs.getString("PARTY");
				previouswon = rs.getString("PREVIOUSWON");
				previousleading = rs.getString("PREVIOUSLEADING");
				currentwon = rs.getString("CURRENTWON");
				currentleading = rs.getString("CURRENTLEADING");
				priority=rs.getString("PRIORITY");

				
				item.setPARTY(party);
				item.setPREVIOUSLEADING(previousleading);
				item.setPREVIOUSWON(previouswon);
				item.setCURRENTLEADING(currentleading);
				item.setCURRENTWON(currentwon);
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
	public List getNationalDataEdit() {
		List dataList = new ArrayList();
		NationalItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String previouswon = null;
		String previousleading = null;
		String currentwon = null;
		String currentleading = null;
		String id = null;
		String priority=null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from national_seat_count_master where active='1' AND `ASSEMBLY`='1' order by PRIORITY";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new NationalItem();
				id = rs.getString("ID");
				party = rs.getString("PARTY");
				previouswon = rs.getString("PREVIOUSWON");
				previousleading = rs.getString("PREVIOUSLEADING");
				currentwon = rs.getString("CURRENTWON");
				currentleading = rs.getString("CURRENTLEADING");
				priority=rs.getString("PRIORITY");

				
				item.setPARTY(party);
				item.setPREVIOUSLEADING(previousleading);
				item.setPREVIOUSWON(previouswon);
				item.setCURRENTLEADING(currentleading);
				item.setCURRENTWON(currentwon);
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
	public List getPartyData() {
		 
		List dataList = new ArrayList();
		VipItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

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
	public List getParsedConstituencyData(String stateName) {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String constituency=null; 
		String candidate=null;
		String status=null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from constituency_detail where STATE='"
					+ stateName + "' and active='1' AND `ASSEMBLY`='1'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new XmlItem();

				state = rs.getString("STATE");
				party = rs.getString("PARTY");
				constituency = rs.getString("CONSTITUENCY");
				candidate = rs.getString("CANDIDATE");
				status = rs.getString("STATUS");
				

				item.setSTATE(state);
				item.setPARTY(party);
				item.setConstituency(constituency);
				item.setCandidate(candidate);
				item.setStatus(status);
				

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
	
	
	//new constituency data
	
	public List getParsedNewConstituencyData(String stateName) {
		List dataList = new ArrayList();
		ConstituencyItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
		String cid=null;
		String state = null;
		String party = null;
		String constituency=null; 
		String candidate=null;
		String status=null;
		String seatingmp = null;
		String seatingpartyname = null;
		String seatingpartycode=null; 
		String winingmp=null;
		String winingpartyname=null;
		String winingpartycode=null;
		String id=null;
		String assembly=null; 		
		String name=null;
		
		

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from constituency_master where STATE_NAME like '%" + stateName + "%' and ASSEMBLY='1' and ACTIVE='1'";
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new ConstituencyItem();
				id=rs.getString("ID");
				cid=rs.getString("CID");
				state = rs.getString("STATE_NAME");
				constituency = rs.getString("CNAME");
				seatingmp = rs.getString("SEATING_MP");
				seatingpartyname = rs.getString("SEATING_PARTY_NAME");			
				winingmp = rs.getString("WINING_MP");
				winingpartyname = rs.getString("WINING_PARTY");			
				status = rs.getString("STATUS");
				assembly=rs.getString("ASSEMBLY");
				
				

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

	public List getParsedNewConstituencyData() {
		List dataList = new ArrayList();
		ConstituencyItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
		String cid=null;
		String state = null;
		String party = null;
		String constituency=null; 
		String candidate=null;
		String status=null;
		String seatingmp = null;
		String seatingpartyname = null;
		String seatingpartycode=null; 
		String winingmp=null;
		String winingpartyname=null;
		String winingpartycode=null;
		String id=null;
		String assembly=null; 

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from constituency_master where ASSEMBLY='1' and ACTIVE='1' ";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new ConstituencyItem();
				id=rs.getString("ID");
				cid=rs.getString("CID");
				state = rs.getString("STATE_NAME");
				constituency = rs.getString("CNAME");
				seatingmp = rs.getString("SEATING_MP");
				seatingpartyname = rs.getString("SEATING_PARTY_NAME");			
				winingmp = rs.getString("WINING_MP");
				winingpartyname = rs.getString("WINING_PARTY");
				status = rs.getString("STATUS");
				assembly=rs.getString("ASSEMBLY");
				

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

	public List getAssemblyConstituencyData(String stateName) {
		List dataList = new ArrayList();
		ConstituencyItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
		String cid=null;
		String state = null;
		String party = null;
		String constituency=null; 
		String candidate=null;
		String status=null;
		String seatingmp = null;
		String seatingpartyname = null;
		String seatingpartycode=null; 
		String winingmp=null;
		String winingpartyname=null;
		String winingpartycode=null;
		String id=null;
		String assembly=null; 

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from constituency_master where STATE_NAME='"+stateName+"' and ASSEMBLY='1' and ACTIVE='1' ";
			//String Query = "select * from constituency_master where  STATE_NAME in('assam','kerala','puducherry','tamil nadu','west bengal') and ASSEMBLY='1' and ACTIVE='1' ";
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new ConstituencyItem();
				id=rs.getString("ID");
				cid=rs.getString("CID");
				state = rs.getString("STATE_NAME");
				constituency = rs.getString("CNAME");
				seatingmp = rs.getString("SEATING_MP");
				seatingpartyname = rs.getString("SEATING_PARTY_NAME");			
				winingmp = rs.getString("WINING_MP");
				winingpartyname = rs.getString("WINING_PARTY");
				status = rs.getString("STATUS");
				assembly=rs.getString("ASSEMBLY");
				

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

	
	public List getConstituencyEdit(String id) {
		List dataList = new ArrayList();
		ConstituencyItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
		String cid=null;
		String state = null;
		String party = null;
		String constituency=null; 
		String candidate=null;
		String status=null;
		String seatingmp = null;
		String seatingpartyname = null;
		String seatingpartycode=null; 
		String winingmp=null;
		String winingpartyname=null;
		String winingpartycode=null;
		

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from constituency_master where ID='" + id + "'";
			//System.out.println("1281 > DbManager.getConstituencyEdit("+id+"):: Query: "+Query);
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new ConstituencyItem();
				id=rs.getString("ID");
				cid=rs.getString("CID");
				state = rs.getString("STATE_NAME");
				constituency = rs.getString("CNAME");
				seatingmp = rs.getString("SEATING_MP");
				seatingpartyname = rs.getString("SEATING_PARTY_NAME");			
				winingmp = rs.getString("WINING_MP");
				winingpartyname = rs.getString("WINING_PARTY");			
						
				status = rs.getString("STATUS");
				

				item.setSTATE(state);
				item.setConstituency(constituency);
				item.setSeatingmp(seatingmp);
				item.setSeatingpartyname(seatingpartyname);
				item.setWiningmp(winingmp);
				item.setWiningpartyname(winingpartyname);
				item.setStatus(status);
				item.setCid(cid);
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

	
	public String getSateName(String stateName) {
		
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
		String state = null;
		
		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select STATE_NAME from state_master where STATE_USED_ID='"+stateName+"'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				state = rs.getString("STATE_NAME");
				

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
		
		return state;

	}
	
	
public List getPartyAbbrName(String partyName) {
	List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
		String pabbrname = null;
		String colorCode = null;
		
		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select ABBR,PARTY_COLOR_CODE from party_master where PNAME='"+partyName+"'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {
				item = new XmlItem();
				pabbrname = rs.getString("ABBR");
				colorCode = rs.getString("PARTY_COLOR_CODE");
				
				item.setPabbrname(pabbrname);
				item.setColorCode(colorCode);
				
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
	
	
public  String getPartyColourName(String partyName) {
	
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;
		String pabbrname = null;
		String colorCode = null;
		
		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select ABBR,PARTY_COLOR_CODE from party_master where TRIM(ABBR)='"+partyName+"'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {
				item = new XmlItem();
				pabbrname = rs.getString("ABBR");
				colorCode = rs.getString("PARTY_COLOR_CODE");
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
		
		return colorCode;

	}
	
	
	
	//staeAllience data
	
	
	public List getParsedShowStateAllianceData(String stateName) {
		List dataList = new ArrayList();
		XmlItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state=null;
		String alliance=null;
		String count=null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from state_alliance_details where STATE='"
					+ stateName + "' and active='1' AND `ASSEMBLY`='1'";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new XmlItem();

				state = rs.getString("STATE");
				alliance = rs.getString("ALLIANCE");
				count = rs.getString("COUNT");
				
				

				item.setSTATE(state);
				item.setAlliance(alliance);
				item.setCount(count);
				
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


	public List getParsedVIPCandidatesData(String stateName) {
		List dataList = new ArrayList();
		VipItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String constituency=null; 
		String candidate=null;
		String status=null;
		String id=null;
		String nationalorder=null;
		String stateorder=null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from vip_master where STATE='"	+ stateName + "' and ASSEMBLY='1' and ACTIVE='1'  order by state_ordering asc ";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new VipItem();

				id=rs.getString("SLNO");
				state = rs.getString("State");
				party = rs.getString("Party");
				constituency = rs.getString("Constituency");
				candidate = rs.getString("Candidate_Name");
				status = rs.getString("Status");
				nationalorder=rs.getString("National_Ordering");
				stateorder=rs.getString("State_Ordering");
				

				item.setSTATE(state);
				item.setPARTY(party);
				item.setConstituency(constituency);
				item.setCandidate(candidate);
				item.setStatus(status);
				item.setId(id);
				item.setNationalorder(nationalorder);
				item.setStateorder(stateorder);
				

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

	
	public List getParsedNatioanlVIPCandidatesData() {
		List dataList = new ArrayList();
		VipItem item = null;
		ResultSet rs = null;
		Statement stmt = null;

		String state = null;
		String party = null;
		String constituency=null; 
		String candidate=null;
		String status=null;
		String id=null;
		String nationalorder=null;
		String stateorder=null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			stmt = conn.createStatement();
			String Query = "select * from vip_master where  ASSEMBLY='1' and ACTIVE='1'  order by National_Ordering asc ";
			
			rs = stmt.executeQuery(Query);
			while (rs.next()) {

				item = new VipItem();
				
				id=rs.getString("SLNO");
				state = rs.getString("State");
				party = rs.getString("Party");
				constituency = rs.getString("Constituency");
				candidate = rs.getString("Candidate_Name");
				status = rs.getString("Status");
				nationalorder=rs.getString("National_Ordering");
				stateorder=rs.getString("State_Ordering");
				

				item.setSTATE(state);
				item.setPARTY(party);
				item.setConstituency(constituency);
				item.setCandidate(candidate);
				item.setStatus(status);
				item.setId(id);
				item.setNationalorder(nationalorder);
				item.setStateorder(stateorder);

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

	

	public void insertParsedData(String state, String party,
			String previouswon, String previousleading, String currentwon,
			String currentleading) {

		ResultSet rs = null;
		Statement stmt = null, stmt1 = null;
		String inserttQuery = null;

		try {

			conn = Dbconnection.getInstance().getConnection();
			String selectQuery = "select * from election_seat_count_master where STATE= '"
					+ state + "' and PARTY='" + party + "' and ASSEMBLY='1' and ACTIVE='1'  ";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(selectQuery);

			if (rs.next()) {

				inserttQuery = "update election_seat_count_master set PREVIOUSWON='"
						+ previouswon
						+ "',PREVIOUSLEADING='"
						+ previousleading
						+ "',CURRENTWON='"
						+ currentwon
						+ "',CURRENTLEADING= '"
						+ currentleading
						+ "' , ASSEMBLY='1' , ACTIVE='1'  where STATE= '"
						+ state
						+ "' and PARTY='" + party + "' and  ASSEMBLY='1' and ACTIVE='1'  ";
			

			} else {

				inserttQuery = "insert into election_seat_count_master (STATE,PARTY,PREVIOUSWON,PREVIOUSLEADING,CURRENTWON,CURRENTLEADING,ASSEMBLY,ACTIVE) values ('"
						+ state
						+ "','"
						+ party
						+ "','"
						+ previouswon
						+ "','"
						+ previousleading
						+ "','"
						+ currentwon
						+ "','"
						+ currentleading + "',0,1)";
				
			}

			stmt1 = conn.createStatement();
			stmt1.executeUpdate(inserttQuery);

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

	

	// Insert constituency data

	public void insertConstituencyData(String state, String constituency,
			String candidate, String party, String status) {

		ResultSet rs = null;
		Statement stmt = null, stmt1 = null;
		String inserttQuery = null;

		try {

			conn = Dbconnection.getInstance().getConnection();
			String selectQuery = "select * from constituency_detail where STATE= '"
					+ state
					+ "' and CONSTITUENCY='"
					+ constituency
					+ "'and CANDIDATE='"
					+ candidate
					+ "' and PARTY='"
					+ party
					+ "' and  ASSEMBLY='1' and ACTIVE='1'";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(selectQuery);

			if (rs.next()) {

				inserttQuery = "update constituency_detail set STATUS='"
						+ status + "' where STATE= '" + state
						+ "' and CONSTITUENCY='" + constituency
						+ "'and CANDIDATE='" + candidate + "' and PARTY='"
						+ party + "' and  ASSEMBLY='1' and ACTIVE='1' ";
			

			} else {

				inserttQuery = "insert into constituency_detail (STATE,CONSTITUENCY,CANDIDATE,party,STATUS,ASSEMBLY,ACTIVE) values ('"
						+ state
						+ "','"
						+ constituency
						+ "','"
						+ candidate
						+ "','" + party + "','" + status + "','1','1')";
				
			}

			stmt1 = conn.createStatement();
			stmt1.executeUpdate(inserttQuery);

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

	

	// Insert Allience Data

	public void insertStateAllianceData(String state, String alliance,
			String count) {

		ResultSet rs = null;
		Statement stmt = null, stmt1 = null;
		String inserttQuery = null;

		try {

			conn = Dbconnection.getInstance().getConnection();
			String selectQuery = "select * from state_alliance_details where STATE= '"
					+ state + "' and ALLIANCE='" + alliance + "' and  ASSEMBLY='1' and ACTIVE='1'";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(selectQuery);

			if (rs.next()) {

				inserttQuery = "update state_alliance_details set COUNT='"
						+ count + "'where STATE= '" + state
						+ "' and ALLIANCE='" + alliance + "' and  ASSEMBLY='1' and ACTIVE='1'";
			

			} else {

				inserttQuery = "insert into state_alliance_details (STATE,ALLIANCE,COUNT,ASSEMBLY , ACTIVE) values ('"
						+ state + "','" + alliance + "','" + count + "','1','1')";
				
			}

			stmt1 = conn.createStatement();
			stmt1.executeUpdate(inserttQuery);

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

	

	public void insertVIPCandidatesData(String state, String constituency,
			String candidate, String party, String status) {

		ResultSet rs = null;
		Statement stmt = null, stmt1 = null;
		String inserttQuery = null;

		try {
			conn = Dbconnection.getInstance().getConnection();
			String selectQuery = "select * from vip_candidates_details where STATE= '"
					+ state
					+ "' and CONSTITUENCY='"
					+ constituency
					+ "'and CANDIDATE='"
					+ candidate
					+ "' and PARTY='"
					+ party
					+ "' and  ASSEMBLY='1' and ACTIVE='1'";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(selectQuery);

			if (rs.next()) {

				inserttQuery = "update vip_candidates_details set STATUS='"
						+ status + "'where STATE= '" + state
						+ "' and CONSTITUENCY='" + constituency
						+ "'and CANDIDATE='" + candidate + "' and PARTY='"
						+ party + "' and ASSEMBLY='1' and ACTIVE='1'";
			

			} else {

				inserttQuery = "insert into vip_candidates_details (STATE,CONSTITUENCY,CANDIDATE,party,STATUS,ASSEMBLY,ACTIVE) values ('"
						+ state
						+ "','"
						+ constituency
						+ "','"
						+ candidate
						+ "','" + party + "','" + status + "','1','1')";
				
			}

			stmt1 = conn.createStatement();
			stmt1.executeUpdate(inserttQuery);

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

	
	
public void UpdateParsedData(String[] id,String[] state, String[] party,  String[] currentwon, String[] currentleading,String[] priority,String[] gainloss) {
		
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	int w=0;
	int l=0;
	int lastData=0;

	try {
		conn = Dbconnection.getInstance().getConnection();
				

		for(int i=0;i<id.length;i++)
		{
			
			String selectQuery = "select id,CURRENTWON,CURRENTLEADING from election_seat_count_master where ID= '"+ id[i] + "' ";
			
			//System.out.println(selectQuery);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(selectQuery);

		if (rs.next()) {
			
			 w=rs.getInt("CURRENTWON");
			 l=rs.getInt("CURRENTLEADING");
			 lastData=w+l;
			
		}
			
		String sql = "update election_seat_count_master set PARTY=?,CURRENTLEADING=?,CURRENTWON=?, PRIORITY=?,GAINLOSS=? ,LASTDATA=? where ID=?";
		pstmt = conn.prepareStatement(sql);
		
        pstmt.setString(1,party[i]);
		pstmt.setString(2,currentleading[i]);
		pstmt.setString(3,currentwon[i]);		
		pstmt.setString(4,priority[i]);
		pstmt.setString(5,gainloss[i]);
		pstmt.setInt(6,lastData);
		pstmt.setString(7,id[i]);
		
        pstmt.executeUpdate();
        //cn.commit();
		}

		} catch (SQLException e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				rs = null;
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				pstmt = null;
			}if (stmt != null) {
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
		}
		


	

public void UpdateAssemblyData(String[] id,String[] state, String[] alliance,  String[] count,String[] priority) {
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	

	try {
		conn = Dbconnection.getInstance().getConnection();
				

		for(int i=0;i<id.length;i++)
		{
		String sql = "update state_alliance_details set ALLIANCE=?,COUNT=? , PRIORITY=? where ID=?";
		pstmt = conn.prepareStatement(sql);
		
        pstmt.setString(1,alliance[i]);
		pstmt.setString(2,count[i]);
		pstmt.setString(3,priority[i]);
		pstmt.setString(4,id[i]);
        pstmt.executeUpdate();
        //cn.commit();
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
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				pstmt = null;
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
		


	

public void UpdateNewStateData(String[] id,String[] state, String[] party,String[] lastwon ,String[] cown,String[] cleading,String[] priority,String[] gainloss)

{
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	

	try {
		conn = Dbconnection.getInstance().getConnection();
				

		for(int i=0;i<id.length;i++)
		{
		String sql = "update statewise_partydetails set LASTWON=? ,WON=?,LEAD=?,GAINLOSS=? ,PRIORITY=? where ID=?";
		//System.out.println("DbManager.java:: sql: "+sql);
		pstmt = conn.prepareStatement(sql);
		
        pstmt.setString(1,lastwon[i]);
		pstmt.setString(2,cown[i]);
		pstmt.setString(3,cleading[i]);
		pstmt.setString(4,gainloss[i]);
		pstmt.setString(5,priority[i]);
		pstmt.setString(6,id[i]);
        pstmt.executeUpdate();
        //cn.commit();
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
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				pstmt = null;
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
		


	
	
public void UpdateNationData(String[] id, String[] party,  String[] currentwon, String[] currentleading,String[] priority) {
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	

	try {
		conn = Dbconnection.getInstance().getConnection();
				

		for(int i=0;i<id.length;i++)
		{
		String sql = "update national_seat_count_master set PARTY=?,CURRENTLEADING=?,CURRENTWON=? ,PRIORITY=? where ID=?";
		pstmt = conn.prepareStatement(sql);
		
        pstmt.setString(1,party[i]);
		pstmt.setString(2,currentleading[i]);
		pstmt.setString(3,currentwon[i]);
		pstmt.setString(4,priority[i]);
		pstmt.setString(5,id[i]);
        pstmt.executeUpdate();
        //cn.commit();
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
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException sqle) {
					System.err.println(sqle.getMessage());
				}
				pstmt = null;
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
		


	

public void UpdateNationalData(String[] id, String[] party,String[] priority) {
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	

	try {
		conn = Dbconnection.getInstance().getConnection();
				

		for(int i=0;i<id.length;i++)
		{
		String sql = "update national_seat_count_master set PRIORITY=? where ID=?";
		pstmt = conn.prepareStatement(sql);
		
        pstmt.setString(1,priority[i]);
		pstmt.setString(2,id[i]);
        pstmt.executeUpdate();
        //cn.commit();
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
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException sqle) {
				System.err.println(sqle.getMessage());
			}
			pstmt = null;
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
	

	

public void UpdatePartyData(String[] id, String[] partyname,String[] partyabbr, String[] colorcode) {
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	

	try {
		conn = Dbconnection.getInstance().getConnection();
				

		for(int i=0;i<id.length;i++)
		{
		String sql = "update party_master set PNAME=?,ABBR=?,PARTY_COLOR_CODE=? where PCODE=?";
		pstmt = conn.prepareStatement(sql);
		
        pstmt.setString(1,partyname[i]);
		pstmt.setString(2,partyabbr[i]);
		pstmt.setString(3,colorcode[i]);
		pstmt.setString(4,id[i]);
        pstmt.executeUpdate();
        //cn.commit();
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
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException sqle) {
				System.err.println(sqle.getMessage());
			}
			pstmt = null;
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
	





public void UpdateVipdData(String id,String state, String party, String constituency, String candidate, String status) {
	
	ResultSet rs = null;
	Statement stmt = null;
	try {
		String url="http://localhost:8080/elections-new/assemblyfeedcreator/AssemblyVipcandidateXmlGenerator_verse.jsp?state="+state+"+&totalseats=126";
		sendGet(url);
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}

	try {
		conn = Dbconnection.getInstance().getConnection();
		stmt = conn.createStatement();
		String Query = "update vip_master set Status='"+status+"',Candidate_Name='"+candidate+"' where SLNO ='"+id+"' ";
		
		stmt.executeUpdate(Query);

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
	}
	




public void UpdateConstituencyData(String id,String state,String constituency, String seatingmp,String  seatingpartyname, String winingmp,String winingpartyname, String status) {
	
	ResultSet rs = null;
	Statement stmt = null;
	

	try {
		conn = Dbconnection.getInstance().getConnection();
		stmt = conn.createStatement();
		String Query = "update constituency_master set CNAME='"+constituency+"',STATE_NAME='"+state+"',SEATING_MP='"+seatingmp+"',SEATING_PARTY_NAME='"+seatingpartyname+"',WINING_MP='"+winingmp+"',WINING_PARTY='"+winingpartyname+"',STATUS='"+status+"' where ID ='"+id+"' ";
		//System.out.println("2554 DbManager.UpdateConstituencyData():: Query: "+Query);
		stmt.executeUpdate(Query);
		try {
			String url="http://localhost:8080/elections-new/assemblyfeedcreator/AssemblyCostituencyJsonGenerator.jsp?state="+state+"&totalseats=126";
			sendGet(url);
			 url="http://localhost:8080/elections-new/assemblyfeedcreator/StateJsonGenerator.jsp?state="+state+"&totalseats=126";
			sendGet(url);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
	}
	

public List getError() {
	List dataList = new ArrayList();
	XmlItem item = null;
	ResultSet rs = null;
	Statement stmt = null;

	String state = null;
	String party = null;
	String previouswon = null;
	String previousleading = null;
	String currentwon = null;
	String currentleading = null;
	String id = null;
	String priority=null;

	try {
		conn = Dbconnection.getInstance().getConnection();
		stmt = conn.createStatement();
		String Query = "select * from error_master ";
		
		rs = stmt.executeQuery(Query);
		while (rs.next()) {

			item = new XmlItem();
			id = rs.getString("Error");
			state = rs.getString("time");
			
			
			

			item.setId(id);
			item.setSTATE(state);
			
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



}
