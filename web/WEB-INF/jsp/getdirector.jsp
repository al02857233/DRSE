<%-- 
    Document   : getdirector
    Created on : 18-feb-2020, 11:57:06
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.director"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Map<String, Object>> res = null; 
            try{
              director dir = new director();
              res = dir.getdirector(request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), request.getParameter("telefono"), request.getParameter("email"), request.getParameter("rfc"), request.getParameter("status"));
              if(res != null){
                    if(res.size() > 1){
                        session.setAttribute("mapdir",res);
                    }
                    else{
                        session.setAttribute("id_director", res.get(0).get("id_director").toString());
                        session.setAttribute("nombre", res.get(0).get("nombre").toString());
                        session.setAttribute("ap_paterno", res.get(0).get("ap_paterno").toString());
                        session.setAttribute("ap_materno", res.get(0).get("ap_materno").toString());
                        session.setAttribute("telefono", res.get(0).get("telefono").toString());
                        session.setAttribute("email", res.get(0).get("email").toString());
                        session.setAttribute("rfc", res.get(0).get("rfc").toString());
                        session.setAttribute("status",res.get(0).get("status").toString());  
                    }
                    
                    session.setAttribute("mapsize",res.size());
                    response.sendRedirect("directores.htm?msj=getdone");
                }
              
            }
            catch(Exception e){
                response.sendRedirect("directores.htm?msj=Error&e=" + e);
            }
                 
        %>
        
    </body>
</html>
