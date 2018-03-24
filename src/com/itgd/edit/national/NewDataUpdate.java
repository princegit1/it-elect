package com.itgd.edit.national;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itgd.data.DbManager;

public class NewDataUpdate extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

doPost(request, response);
}

public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {


String id[] = request.getParameterValues("id");
String state[]= request.getParameterValues("state");
String allience[]= request.getParameterValues("allience");
String count[]= request.getParameterValues("count");
String currentleading[]= request.getParameterValues("cleading");
String name=request.getParameter("name");
String priority[]=request.getParameterValues("priority");

DbManager db = new DbManager();
db.UpdateAssemblyData(id,state, allience, count,priority); 
		
RequestDispatcher dispatcher = request.getRequestDispatcher("national");
dispatcher.forward( request, response );
}
}
