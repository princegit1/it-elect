package com.itgd.edit.assembly;

import com.itgd.data.DbManager;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ShowAsseblyConstituencyData extends HttpServlet
{

    public ShowAsseblyConstituencyData()
    {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        String pabbrname = null;
        String colorCode = null;
        String winingpabbrname = null;
        java.io.PrintWriter out = response.getWriter();
        String stateName = request.getParameter("state");
        String name = null;
        DbManager db = new DbManager();
        ArrayList parseData = null;
       
        
            parseData = (ArrayList)db.getAssemblyConstituencyData(stateName);
        
        HttpSession session = request.getSession(true);
        session.setAttribute("parseData", parseData);
        session.setAttribute("statecode", stateName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("assemblyconstituencydata.jsp");
        dispatcher.forward(request, response);
    }
}
