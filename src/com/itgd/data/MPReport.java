package com.itgd.data;

import java.io.PrintStream;
import java.sql.*;



public class MPReport
{

    public MPReport()
    {
    }

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
        String Q = "";
        
        
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
                c = DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Excel Driver (*.xls)};DBQ=C:\\excel\\mpreport.xls");
                stmnt = c.createStatement();
            }
            catch(Exception ex)
            {
                System.out.println((new StringBuilder("Excel Error: ")).append(ex.toString()).toString());
            }
            //String query = "Select * from [Wannabe MBA's top 10$]";
            String query = "Select * from [Sheet1$]";
            rs = stmnt.executeQuery(query);
            MyValid3 val3 = new MyValid3();
           
            String sql1;
            while( rs.next() )
            {
               
            	A = rs.getString("Name");
            	B = rs.getString("const");            	
            	C = rs.getString("rank");            	
             	int D1 = rs.getInt("id");
            	
            	
                System.out.println(A); 
                System.out.println(B); 
                System.out.println(C); 
                
                
                sql1="INSERT INTO mp_records_extra (`NAME_OF_MAP`,`CONSTITUENCY`,`AGE_PER_OF_ATTENDANCE`,`SCORE_ON_THE_BASIS_OF_ATTENDANCE`) " +
                 		"" +
                 		"VALUES('"+A+"','"+val3.doAddSlashesString(B)+"','"+val3.doAddSlashesString(C)+"','"+D1+"')";
                
             
            	
                System.out.println(sql1); 
            	                
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
