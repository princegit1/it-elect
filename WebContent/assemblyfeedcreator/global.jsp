<%@ page
	import=" java.io.File, java.io.FileOutputStream, java.io.IOException"%>
<%
String xmlPath = "C:\\xampp\\htdocs\\elections\\assembly-2016\\xml\\";
String jsonPath = "C:\\xampp\\htdocs\\elections\\assembly-2016\\";
String xmlPath_verse = "C:\\xampp\\htdocs\\elections\\assembly-2016\\verse\\";
String xmlPath_bsb = "C:\\xampp\\htdocs\\elections\\assembly-2016\\bsb\\";
String xmlPath_assembly = "C:\\xampp\\htdocs\\elections\\assembly-2016\\xml\\assembly\\"; 
//String jsonPath = "/home/sites/mob/elections/json/assembly/";
//String xmlPath = "/home/sites/mob/elections/xml/assembly/"; 
%>
<%!
public static int generateXmlFile(String xmlData, String fileName,String xmlPath,String type) {
		//String xmlPath="/home/sites/elections/feeds/assembly_election_2013/";
			//String xmlPath="C:\\excel\\xml\\cons\\";
			//String xmlPath="/home/jboss-4.2.2.GA/server/default/deploy/seatcount.war/xml/";
			int fileGenerated = 0;
			try {
				String xmllocalpath = "";
				//fileName = fileName.toLowerCase().replaceAll("%20", "").replaceAll(":", "")+"_constituency_tally";
			//System.out.println("@@@@@@@"+xmlPath+fileName+type);
				File sourceFile = new File(fileName+type);
				if (sourceFile.exists()) {
					File file = (new File(fileName));
					xmllocalpath = xmlPath + fileName;// reviews.xml";
					FileOutputStream out = new FileOutputStream(xmllocalpath);
					out.write(xmlData.getBytes());
					out.close();
				} else {
					xmllocalpath = xmlPath + fileName + type;
					FileOutputStream fos1 = new FileOutputStream(xmllocalpath);
					fos1.write(xmlData.getBytes());
					fos1.flush();
					fos1.close();
				}
				fileGenerated=1;
				//System.out.println("File Generated -> "+fileName);
			} catch (IOException ioe) {
				System.out.println("JSON generation error for <"+fileName+"> under  <"+xmlPath+" location.");
			}
			return fileGenerated;
		}


 %>
