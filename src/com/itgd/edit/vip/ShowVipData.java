package com.itgd.edit.vip;

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

public class ShowVipData extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

	PrintWriter out = response.getWriter();
	String stateName= request.getParameter("state");
	DbManager db = new DbManager();
	ArrayList parseData= null;
	
	if(stateName.equalsIgnoreCase("0")){
		parseData = (ArrayList)db.getParsedNatioanlVIPCandidatesData();
		stateName="National";
	}else{
	parseData = (ArrayList)db.getParsedVIPCandidatesData(stateName);
	}
	
	HttpSession session = request.getSession(true);
	session.setAttribute("parseData", parseData);
	session.setAttribute("statecode", stateName);
	
	
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("vipdata.jsp");
	dispatcher.forward( request, response );
}
}
