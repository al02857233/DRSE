<%-- 
    Document   : modescuela
    Created on : 11-feb-2020, 13:42:56
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
             else if(request.getParameter("nivel") == null || request.getParameter("nivel").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptyniv");                   
             }
             else if(request.getParameter("turno") == null || request.getParameter("turno").isEmpty()){
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
             else if(request.getParameter("ciudad") == null || request.getParameter("ciudad").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptyct");                   
             }
             else if(request.getParameter("director") == null || request.getParameter("director").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptydir");                   
             }
             else if(request.getParameter("telefono") == null || request.getParameter("telefono").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptytel");                   
             }
             else if(request.getParameter("email") == null || request.getParameter("email").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptymail");                   
             }
             else if(request.getParameter("status") == null || request.getParameter("status").isEmpty()){
                    response.sendRedirect("escuelas.htm?msj=Emptysta");                   
             }

             else{
                 try{
              escuela clientes = new escuela();
              String host = InetAddress.getLocalHost().toString();
               int res = clientes.updatescuela(session.getAttribute("id_escuela").toString(), request.getParameter("nombre"), request.getParameter("cct"), request.getParameter("nivel"), request.getParameter("turno"), request.getParameter("calle"), request.getParameter("colonia"), request.getParameter("cp"), request.getParameter("ciudad"), request.getParameter("telefono"), request.getParameter("email"), request.getParameter("director"), request.getParameter("status"),host);
                             
                if(res == 0){
                     response.sendRedirect("escuelas.htm?msj=Error&e=Fallo al Actualizar la Escuela");
                }
                else if(res == 2){
                     response.sendRedirect("escuelas.htm?msj=Invalidcct");
                }
                else if(res == 1){
                    session.removeAttribute("id_escuela");
                    response.sendRedirect("escuelas.htm?msj=UpSuccess");
                }
                }
                catch(Exception e){
                    response.sendRedirect("escuelas.htm?msj=Error&e=" + e);
                }
                      
             }
    
    %>  
    </body>
</html>
