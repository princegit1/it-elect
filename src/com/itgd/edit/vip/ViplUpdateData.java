package com.itgd.edit.vip;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itgd.data.DbManager;

public class ViplUpdateData extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String id = request.getParameter("id");
		String statename= request.getParameter("state");
		String party= request.getParameter("party");
		String constituency=  request.getParameter("constituency");
		String candidate= request.getParameter("candidate");
		String status= request.getParameter("status");
		
		String name=request.getParameter("name");
		//System.out.println("name in update---->"+name);
		//System.out.println("statename in update---->"+statename);
		if(name.equalsIgnoreCase("National")){
			name="0";
		}else{
			name=statename;
		}

		
		DbManager db = new DbManager();
		db.UpdateVipdData(id,statename, party, constituency, candidate, status);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("showvipdata?state="+name+"");
		dispatcher.forward( request, response );
	}
}
