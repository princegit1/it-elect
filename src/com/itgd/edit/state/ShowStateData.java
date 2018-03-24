package com.itgd.edit.state;

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

public class ShowStateData extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

	HttpSession session = request.getSession(true);
	String stateName= request.getParameter("state");
	String state=null;
	DbManager db = new DbManager();
	ArrayList parseData = (ArrayList)db.getNewStatedData(stateName);
	
	if(parseData!= null && parseData.size()>0)
	{
		
		for(int i=0;i<parseData.size();i++)
			{
	XmlItem item= (XmlItem) parseData.get(i);
	state=item.getSTATE();
		}
	}
	
	session.setAttribute("parseData", parseData);	
	session.setAttribute("state", state);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("newstatetally.jsp");
	dispatcher.forward( request, response );
}

}
