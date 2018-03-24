package com.itgd.edit.assembly;

import com.itgd.data.DbManager;
import java.io.IOException;
import java.io.PrintStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AssemblyConstituencyUpdateData extends HttpServlet
{

    public AssemblyConstituencyUpdateData()
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
        String statename = request.getParameter("state");
        String constituency = request.getParameter("constituency");
        String seatingmp = request.getParameter("sitingmp");
        String seatingpartyname = request.getParameter("sitingparty");
        String winingmp = request.getParameter("winingmp");
        String winingpartyname = request.getParameter("winingparty");
        String status = request.getParameter("status");
        String name = request.getParameter("name");
        /*System.out.println((new StringBuilder("name in update---->")).append(name).toString());
        System.out.println((new StringBuilder("statename in update---->")).append(statename).toString());
        System.out.println((new StringBuilder("winingparty---->")).append(winingpartyname).toString());
        System.out.println((new StringBuilder("status---->")).append(status).toString());*/
        if(name.equalsIgnoreCase("National"))
        {
            name = "0";
        } else
        {
            name = statename;
        }
        DbManager db = new DbManager();
        db.UpdateConstituencyData(id, statename, constituency, seatingmp, seatingpartyname, winingmp, winingpartyname, status);
        RequestDispatcher dispatcher = request.getRequestDispatcher((new StringBuilder("showassemblyconstituencydata?state=")).append(name).toString());
        dispatcher.forward(request, response);
    }
}
