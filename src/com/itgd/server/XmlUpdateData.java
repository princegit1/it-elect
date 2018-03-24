package com.itgd.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itgd.data.DbManager;

public class XmlUpdateData extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id[] = request.getParameterValues("id");
		String state[]= request.getParameterValues("state");
		String party[]= request.getParameterValues("party");
		String currentwon[]= request.getParameterValues("cown");
		String currentleading[]= request.getParameterValues("cleading");
		String priority[]=request.getParameterValues("priority");
		String gainloss[]=request.getParameterValues("gainloss");
		String name=request.getParameter("name");
		
		DbManager db = new DbManager();
		db.UpdateParsedData(id,state, party, currentwon, currentleading,priority,gainloss);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("showdata?state="+name+"");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("showdata");
		dispatcher.forward( request, response );
	}

}
