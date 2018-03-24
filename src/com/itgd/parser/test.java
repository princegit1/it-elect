package com.itgd.parser;


import java.sql.*;
import java.util.SortedMap;
import java.util.TreeMap;



public class test
{

    
    public static void main(String args[])
    {
        Connection c = null;
        Statement stmnt = null;
        ResultSet rs = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs1 = null;
        Statement dbstmt = null,dbstmt1 = null;
        String A = "";
        String B = "";
        String C = "";        
        String sql1,sql2;
       
        final   String Aa = "";
         final String Bb = "";
         final String Cc = "";      
        
        
        try
        {
           /* cn = DriverManager.getConnection("");
            st = cn.createStatement();*/
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        	cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elections","root", "root");
        	
        	st=cn.createStatement();
            String query = "SELECT PARTY FROM statewise_partydetails WHERE `ACTIVE`='2' group by PARTY";
           int t =1;
                         
            rs = st.executeQuery(query);
            while( rs.next() )
            {
            	t=t+1;
            	
            	B = rs.getString("PARTY").trim().toLowerCase();
            	//System.out.println(A); 
               
                
                dbstmt=cn.createStatement();
                sql2="SELECT  `ABBR` FROM party_master group by abbr ";                
                rs1 = dbstmt.executeQuery(sql2);           
                while( rs1.next() )
                {
                	
                	C=rs1.getString("ABBR").trim().toLowerCase();
                	                	
                	if(B.equals(C)){
                		//System.out.println(t); 
                		
                		
                	}else{
                		
                		System.out.println(B.toUpperCase()); 
                	}
                	
                	
                }
                
                
                
              
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
