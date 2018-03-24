
<% 
String uname=(String)session.getAttribute("uname");


if(uname.equalsIgnoreCase("ADMIN")){

response.sendRedirect("admin.jsp");

}else if(uname.equalsIgnoreCase("NATIONAL")){

response.sendRedirect("user.jsp");

}else if(uname.equalsIgnoreCase("india")){

response.sendRedirect("assembly.jsp");

}

%>
