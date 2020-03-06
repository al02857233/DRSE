<%-- 
    Document   : insertaresc
    Created on : 05-feb-2020, 12:42:17
    Author     : rodrigo.yanez
--%>

<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.escuela"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            if(session.getAttribute("rol_user").toString().matches("2")){
                response.sendRedirect("escuelas.htm?msj=Denied");                   
            }
            else if(request.getParameter("nombre") == null || request.getParameter("nombre").isEmpty()){
                response.sendRedirect("escuelas.htm?msj=Emptyname");                   
             }
             else if(request.getParameter("cct") == null || request.getParameter("cct").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptycct");                   
             }
             else if(request.getParameter("nivel").matches("") || request.getParameter("nivel") == null || request.getParameter("nivel").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptyniv");                   
             }
             else if(request.getParameter("turno").matches("") || request.getParameter("turno") == null || request.getParameter("turno").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptytur");                   
             }
             else if(request.getParameter("calle") == null || request.getParameter("calle").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptyst");                   
             }
            else if(request.getParameter("colonia") == null || request.getParameter("colonia").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptycol");                   
             }
             else if(request.getParameter("cp") == null || request.getParameter("cp").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptycp");                   
             }
             else if(request.getParameter("ciudad").matches("") || request.getParameter("ciudad") == null || request.getParameter("ciudad").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptyct");                   
             }
             else if(request.getParameter("telefono") == null || request.getParameter("telefono").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptytel");                   
             }
             else if(request.getParameter("email") == null || request.getParameter("email").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptymail");                   
             }
             else if(request.getParameter("status").matches("") || request.getParameter("status") == null || request.getParameter("status").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptysta");                   
             }

             else{
                 try{
              escuela esc = new escuela();
              String host = InetAddress.getLocalHost().toString();
               int res = esc.insertescuela(request.getParameter("nombre"), request.getParameter("cct"), request.getParameter("nivel"), request.getParameter("turno"), request.getParameter("calle"), request.getParameter("colonia"), request.getParameter("cp"), request.getParameter("ciudad"), request.getParameter("director"), request.getParameter("telefono"), request.getParameter("email"),request.getParameter("status"),host);
                          
                
                if(res == 0){
                     response.sendRedirect("escuelas.htm?msj=Error&e=Fallo al Insertar Escuela");
                }
                else{
                    response.sendRedirect("escuelas.htm?msj=InsSuccess");
                }
                }
                catch(Exception e){
                    response.sendRedirect("escuelas.htm?msj=Error&e=" + e);
                }
                      
             }
    
    %>    

    
    </body>
</html>
