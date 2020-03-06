<%-- 
    Document   : insertarsup
    Created on : 19-feb-2020, 12:17:44
    Author     : rodrigo.yanez
--%>

<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.supervisor"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            if(session.getAttribute("rol_user").toString().matches("2")){
                response.sendRedirect("supervisores.htm?msj=Denied");                   
            }
            else if(request.getParameter("nombre") == null || request.getParameter("nombre").isEmpty()){
                response.sendRedirect("supervisores.htm?msj=Emptyname");                   
             }
             else if(request.getParameter("ap_paterno") == null || request.getParameter("ap_paterno").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptyname1");                   
             }
             else if(request.getParameter("ap_materno") == null || request.getParameter("ap_materno").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptyname2");                   
             }
            else if(request.getParameter("celular") == null || request.getParameter("celular").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptycel");                   
             }
             else if(request.getParameter("email") == null || request.getParameter("email").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptymail");                   
             }
             else if(request.getParameter("ciudad") == null || request.getParameter("ciudad").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptycity");                   
             }
             else if(request.getParameter("ct") == null || request.getParameter("ct").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptyct");                   
             }
             else if(request.getParameter("zona") == null || request.getParameter("zona").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptyzn");                   
             }
             else if(request.getParameter("status").matches("") || request.getParameter("status") == null || request.getParameter("status").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptysta");                   
             }
             else if(request.getParameter("jefe").matches("") || request.getParameter("jefe") == null || request.getParameter("jefe").isEmpty()){
                    response.sendRedirect("supervisores.htm?msj=Emptyjefe");                   
             }
             

             else{
                 try{
              supervisor sup = new supervisor();
              String host = InetAddress.getLocalHost().toString();
               int res = sup.insertsupervisor(request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), request.getParameter("tel_oficina"), request.getParameter("tel_particular"), request.getParameter("celular"),  request.getParameter("email"), request.getParameter("ciudad"), request.getParameter("ct"), request.getParameter("zona"), request.getParameter("jefe"), request.getParameter("status"),host);
                        
                
                if(res == 0){
                     response.sendRedirect("supervisores.htm?msj=Error&e=Fallo al Insertar Director");
                }
                else if(res == 2) {
                    response.sendRedirect("supervisores.htm?msj=Exists");
                }
                else {
                    response.sendRedirect("supervisores.htm?msj=InsSuccess");
                }
                }
                catch(Exception e){
                    response.sendRedirect("supervisores.htm?msj=Error&e=" + e);
                }
                      
             }
    
    %>    

    
    </body>
</html>