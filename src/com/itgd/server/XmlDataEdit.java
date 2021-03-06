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


public class XmlDataEdit extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String id = request.getParameter("id");		
		DbManager db = new DbManager();
		ArrayList parseData = (ArrayList)db.getParsedDataForEdit(id);
		HttpSession session = request.getSession(true);
		session.setAttribute("parseData", parseData);	
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("xmleditdata.jsp");
		dispatcher.forward( request, response );
	}

}
