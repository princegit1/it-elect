package com.itgd.edit.national;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itgd.data.DbManager;

public class NationalMasterUpdate extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String id[] = request.getParameterValues("id");
		String party[]= request.getParameterValues("party");
				String priority[]= request.getParameterValues("priority");
		
		DbManager db = new DbManager();
		
		db.UpdateNationalData(id,party,priority);
		
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("nationalmaster.jsp");
		dispatcher.forward( request, response );
	}

}
