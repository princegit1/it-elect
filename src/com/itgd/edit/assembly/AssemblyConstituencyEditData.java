package com.itgd.edit.assembly;

import com.itgd.data.DbManager;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AssemblyConstituencyEditData extends HttpServlet
{

    public AssemblyConstituencyEditData()
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        //System.out.println((new StringBuilder("name in edit --->")).append(name).toString());
        DbManager db = new DbManager();
        ArrayList parseData = (ArrayList)db.getConstituencyEdit(id);
        HttpSession session = request.getSession(true);
        session.setAttribute("parseData", parseData);
        session.setAttribute("name", name);
        RequestDispatcher dispatcher = request.getRequestDispatcher("assemblyconstituencyeditdata.jsp");
        dispatcher.forward(request, response);
    }
}
