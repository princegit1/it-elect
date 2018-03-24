package com.itgd.edit.state;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itgd.data.DbManager;

public class UpdateNewState extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

doPost(request, response);
}

public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {


String id[] = request.getParameterValues("id");
String state[]= request.getParameterValues("state");
String party[]= request.getParameterValues("party");
String lastwon[]= request.getParameterValues("lastwon");
String cleading[]= request.getParameterValues("cleading");
String cown[]= request.getParameterValues("cown");
String priority[]=request.getParameterValues("priority");
String gainloss[]= request.getParameterValues("gainloss");
String name=request.getParameter("name");

DbManager db = new DbManager();
db.UpdateNewStateData(id,state, party, lastwon,cown,cleading,priority,gainloss); 
		
RequestDispatcher dispatcher = request.getRequestDispatcher("shownewstate?state="+name+"");
dispatcher.forward( request, response );
}
}
