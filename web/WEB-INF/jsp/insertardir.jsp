<%-- 
    Document   : insertadir
    Created on : 18-feb-2020, 11:13:36
    Author     : rodrigo.yanez
--%>

<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.director"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            if(session.getAttribute("rol_user").toString().matches("2")){
                response.sendRedirect("directores.htm?msj=Denied");                   
            }
            else if(request.getParameter("nombre") == null || request.getParameter("nombre").isEmpty()){
                response.sendRedirect("directores.htm?msj=Emptyname");                   
             }
             else if(request.getParameter("ap_paterno") == null || request.getParameter("ap_paterno").isEmpty()){
                    response.sendRedirect("directores.htm?msj=Emptyname1");                   
             }
             else if(request.getParameter("ap_materno") == null || request.getParameter("ap_materno").isEmpty()){
                    response.sendRedirect("directores.htm?msj=Emptyname2");                   
             }
            else if(request.getParameter("telefono") == null || request.getParameter("telefono").isEmpty()){
                    response.sendRedirect("directores.htm?msj=Emptytel");                   
             }
             else if(request.getParameter("email") == null || request.getParameter("email").isEmpty()){
                    response.sendRedirect("directores.htm?msj=Emptymail");                   
             }
             else if(request.getParameter("rfc") == null || request.getParameter("rfc").isEmpty()){
                    response.sendRedirect("directores.htm?msj=Emptyrfc");                   
             }
             else if(request.getParameter("status").matches("") || request.getParameter("status") == null || request.getParameter("status").isEmpty()){
                    response.sendRedirect("directores.htm?msj=Emptysta");                   
             }

             else{
                 try{
              director dir = new director();
              String host = InetAddress.getLocalHost().toString();
               int res = dir.insertdirector(request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), request.getParameter("telefono"), request.getParameter("email"), request.getParameter("rfc"),request.getParameter("status"),host);
                          
                
                if(res == 0){
                     response.sendRedirect("directores.htm?msj=Error&e=Fallo al Insertar Director");
                }
                else if(res == 2) {
                    response.sendRedirect("directores.htm?msj=Exists");
                }
                else {
                    response.sendRedirect("directores.htm?msj=InsSuccess");
                }
                }
                catch(Exception e){
                    response.sendRedirect("directores.htm?msj=Error&e=" + e);
                }
                      
             }
    
    %>    

    
    </body>
</html>