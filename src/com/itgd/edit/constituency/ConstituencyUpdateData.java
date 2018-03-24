package com.itgd.edit.constituency;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itgd.data.DbManager;

public class ConstituencyUpdateData extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

doPost(request, response);
}

public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

	
String id = request.getParameter("id");
String statename= request.getParameter("state");
String constituency=  request.getParameter("constituency");
String seatingmp =request.getParameter("sitingmp");
String seatingpartyname = request.getParameter("sitingparty");
String winingmp=request.getParameter("winingmp");
String winingpartyname=request.getParameter("winingparty");
String status= request.getParameter("status");
String name=request.getParameter("name");
//System.out.println("name in update---->"+name);
//System.out.println("statename in update---->"+statename);
//System.out.println("winingparty---->"+winingpartyname);
//System.out.println("status---->"+status);
if(name.equalsIgnoreCase("National")){
	name="0";
}
else{
	name=statename;
}

DbManager db = new DbManager();
db.UpdateConstituencyData(id,statename, constituency, seatingmp, seatingpartyname, winingmp,winingpartyname,status);
		
RequestDispatcher dispatcher = request.getRequestDispatcher("showconstituencydata?state="+name+"");
dispatcher.forward( request, response );
}

}
