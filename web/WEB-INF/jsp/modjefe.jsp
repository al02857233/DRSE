<%-- 
    Document   : modjefe
    Created on : 21-feb-2020, 13:22:49
    Author     : rodrigo.yanez
--%>

<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.jefe"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             if(session.getAttribute("rol_user").toString().matches("2")){
                response.sendRedirect("jefes.htm?msj=Denied");                   
            }
            else if(request.getParameter("nombre") == null || request.getParameter("nombre").isEmpty()){
                response.sendRedirect("jefes.htm?msj=Emptyname");                   
             }
            else if(request.getParameter("ap_paterno") == null || request.getParameter("ap_paterno").isEmpty()){
                    response.sendRedirect("jefes.htm?msj=Emptyname1");                   
             }
             else if(request.getParameter("ap_materno") == null || request.getParameter("ap_materno").isEmpty()){
                    response.sendRedirect("jefes.htm?msj=Emptyname2");                   
             }
             else if(request.getParameter("celular") == null || request.getParameter("celular").isEmpty()){
                    response.sendRedirect("jefes.htm?msj=Emptytel");                   
             }
             else if(request.getParameter("email") == null || request.getParameter("email").isEmpty()){
                    response.sendRedirect("jefes.htm?msj=Emptymail");                   
             }
             else if(request.getParameter("sector") == null || request.getParameter("sector").isEmpty()){
                    response.sendRedirect("jefes.htm?msj=Emptysect");                   
             }
             else if(request.getParameter("status") == null || request.getParameter("status").isEmpty()){
                    response.sendRedirect("jefes.htm?msj=Emptysta");                   
             }

             else{
                 try{
              jefe jefe = new jefe();
              String host = InetAddress.getLocalHost().toString();
               int res = jefe.updatejefe(session.getAttribute("id_jefe").toString(), request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), request.getParameter("tel_oficina"), request.getParameter("tel_particular"), request.getParameter("celular"),request.getParameter("email"),  request.getParameter("sector"), request.getParameter("status"),host);
                             
                if(res == 0){
                     response.sendRedirect("jefes.htm?msj=Error&e=Fallo al Actualizar Jefe");
                }
                else if(res == 2){
                     response.sendRedirect("jefes.htm?msj=Exists");
                }
                else if(res == 1){
                    session.removeAttribute("id_jefe");
                    response.sendRedirect("jefes.htm?msj=UpSuccess");
                }
                }
                catch(Exception e){
                    response.sendRedirect("jefes.htm?msj=Error&e=" + e);
                }
                      
             }
    
    %>  
    </body>
</html>
