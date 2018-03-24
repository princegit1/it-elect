package com.itgd.edit.constituency;

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
import com.itgd.parser.XmlItem;

public class ShowConstituencyData extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String pabbrname = null;
		String colorCode = null;
		String winingpabbrname = null;
		PrintWriter out = response.getWriter();
		String stateName= request.getParameter("state");
		String name=null;
		DbManager db = new DbManager();
		ArrayList parseData= null;
		if(stateName.equalsIgnoreCase("0")){
			parseData = (ArrayList)db.getParsedNewConstituencyData();
			stateName="National";
		}else{
		parseData = (ArrayList)db.getParsedNewConstituencyData(stateName);
		}
		
		
		
		HttpSession session = request.getSession(true);
		session.setAttribute("parseData", parseData);
		session.setAttribute("statecode", stateName);	
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("constituencydata.jsp");
		dispatcher.forward( request, response );
		
		
		
		
}
}
