<%-- 
    Document   : getescuela
    Created on : 06-feb-2020, 13:18:12
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.escuela"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
              escuela esc = new escuela();
              res = esc.getescuela(request.getParameter("nombre"), request.getParameter("cct"), request.getParameter("nivel"), request.getParameter("turno"), request.getParameter("calle"), request.getParameter("colonia"), request.getParameter("cp"), request.getParameter("ciudad"), request.getParameter("director"), request.getParameter("telefono"), request.getParameter("email"), request.getParameter("status"));
              if(res != null){
                    if(res.size() > 1){
                        session.setAttribute("map",res);
                    }
                    else{
                        session.setAttribute("id_escuela", res.get(0).get("id_escuela").toString());
                        session.setAttribute("nombre", res.get(0).get("nombre").toString());
                        session.setAttribute("cct", res.get(0).get("cct").toString());
                        session.setAttribute("nivel", res.get(0).get("nivel").toString());
                        session.setAttribute("turno", res.get(0).get("turno").toString());
                        session.setAttribute("calleynum", res.get(0).get("calleynum").toString());
                        session.setAttribute("colonia", res.get(0).get("colonia").toString());
                        session.setAttribute("cp", res.get(0).get("cp").toString());
                        session.setAttribute("ciudad", res.get(0).get("ciudad").toString());
                        session.setAttribute("telefono", res.get(0).get("telefono").toString());
                        session.setAttribute("email", res.get(0).get("email").toString());
                        session.setAttribute("director", res.get(0).get("director").toString());
                        session.setAttribute("status",res.get(0).get("status").toString());  
                    }
                    
                    session.setAttribute("mapsize",res.size());
                    response.sendRedirect("escuelas.htm?msj=getdone");
                }
              
            }
            catch(Exception e){
                response.sendRedirect("escuelas.htm?msj=Error&e=" + e);
            }
                 
        %>
        
    </body>
</html>
