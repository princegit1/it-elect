package com.itgd.edit.party;

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

public class PartyDataEdit extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

doPost(request, response);
}

public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {


String id[] = request.getParameterValues("id");
String partyname[]= request.getParameterValues("partyname");
String partyabbr[]= request.getParameterValues("partyabbr");
String colorcode[]= request.getParameterValues("colorcode");

DbManager db = new DbManager();

db.UpdatePartyData(id,partyname,partyabbr, colorcode);
		
RequestDispatcher dispatcher = request.getRequestDispatcher("showpartydata");
dispatcher.forward( request, response );
}
}
