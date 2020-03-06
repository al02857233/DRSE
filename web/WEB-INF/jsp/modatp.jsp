<%-- 
    Document   : modatp
    Created on : 20-feb-2020, 11:55:41
    Author     : rodrigo.yanez
--%>


<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.atp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             if(session.getAttribute("rol_user").toString().matches("2")){
                response.sendRedirect("atps.htm?msj=Denied");                   
            }
            else if(request.getParameter("nombre") == null || request.getParameter("nombre").isEmpty()){
                response.sendRedirect("atps.htm?msj=Emptyname");                   
             }
            else if(request.getParameter("ap_paterno") == null || request.getParameter("ap_paterno").isEmpty()){
                    response.sendRedirect("atps.htm?msj=Emptyname1");                   
             }
             else if(request.getParameter("ap_materno") == null || request.getParameter("ap_materno").isEmpty()){
                    response.sendRedirect("atps.htm?msj=Emptyname2");                   
             }
             else if(request.getParameter("celular") == null || request.getParameter("celular").isEmpty()){
                    response.sendRedirect("atps.htm?msj=Emptytel");                   
             }
             else if(request.getParameter("email") == null || request.getParameter("email").isEmpty()){
                    response.sendRedirect("atps.htm?msj=Emptymail");                   
             }
             else if(request.getParameter("supervisor") == null || request.getParameter("supervisor").isEmpty()){
                    response.sendRedirect("atps.htm?msj=Emptysup");                   
             }
             else if(request.getParameter("status") == null || request.getParameter("status").isEmpty()){
                    response.sendRedirect("atps.htm?msj=Emptysta");                   
             }

             else{
                 try{
              atp atp = new atp();
              String host = InetAddress.getLocalHost().toString();
               int res = atp.updateatp(session.getAttribute("id_atp").toString(), request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), request.getParameter("tel_oficina"), request.getParameter("tel_particular"), request.getParameter("celular"),request.getParameter("email"), request.getParameter("supervisor") , request.getParameter("status"),host);
                             
                if(res == 0){
                     response.sendRedirect("atps.htm?msj=Error&e=Fallo al Actualizar ATP");
                }
                else if(res == 2){
                     response.sendRedirect("atps.htm?msj=Exists");
                }
                else if(res == 1){
                    session.removeAttribute("id_atp");
                    response.sendRedirect("atps.htm?msj=UpSuccess");
                }
                }
                catch(Exception e){
                    response.sendRedirect("atps.htm?msj=Error&e=" + e);
                }
                      
             }
    
    %>  
    </body>
</html>
