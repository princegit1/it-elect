package com.itgd.data;

import java.io.PrintStream;
import java.sql.*;



public class MasterTable
{

    

    public static void main(String args[])
    {
        Connection c = null;
        Statement stmnt = null;
        ResultSet rs = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs1 = null;
        Statement dbstmt = null;
        String A = "";
        String B = "";
        String C = "";
        String D = "";
        String E = "";
        String F = "";
        String G = "";
        String H = "";
        String I = "";
        String J = "";
        String K = "";
        String L = "";
        String M = "";
        String N = "";
        String O = "";
        String P = "";
        
        
        String B_Caption="";
        String C_Caption="";
        String D_Caption="";
        String E_Caption="";
        String F_Caption="";
        String G_Caption="";
        String H_Caption="";
        String I_Caption="";
        String J_Caption="";
        
        try
        {
            cn = Dbconnection.getInstance().getConnection();
            st = cn.createStatement();
            try 
            {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                c = DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Excel Driver (*.xls)};DBQ=C:\\excel\\party-master1.xls");
                stmnt = c.createStatement();
            }
            catch(Exception ex)
            {
                System.out.println((new StringBuilder("Excel Error: ")).append(ex.toString()).toString());
            }
            
            String query = "Select * from [Sheet1$]";
            rs = stmnt.executeQuery(query);
            MyValid3 val3 = new MyValid3();
           
            String sql1;
            while( rs.next() )
            {
               
            	
            	A = rs.getString("PCODE");
            	B = rs.getString("PNAME").trim();
            	C = rs.getString("ABBR");
            	D = rs.getString("PARTY_COLOR_CODE");
            	
            	
                //System.out.println(A); 
             
              
                
              sql1 = "update elections.party_master set `PNAME`= '"+val3.doAddSlashesString(B)+"',`ABBR`= '"+val3.doAddSlashesString(C)+"',`PARTY_COLOR_CODE`='"+val3.doAddSlashesString(D)+"'  where PCODE='"+A+"' ";
                

                /*sql1="INSERT INTO constituency_master (`CID`,`CNAME`,`STATE_NAME`,`ASSEMBLY`,`ACTIVE`,`CONSTITUENCY_ID_2014`,`YEAR`,`MONTH`) " +
                		"" +
                		"VALUES('"+A+"','"+val3.doAddSlashesString(B)+"','"+val3.doAddSlashesString(C)+"','"+D+"','7','"+A+"','2014','5')";
               
            	*/
            	
               // System.out.println(sql1); 
            	                
                dbstmt = cn.createStatement();
                dbstmt.executeUpdate(sql1);
               
            }
            
            cn.close();
            c.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
