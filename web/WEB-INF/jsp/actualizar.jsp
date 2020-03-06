<%-- 
    Document   : insertar
    Created on : 30-ene-2020, 0:37:49
    Author     : Prueba
--%>

<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.login"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
             
             HttpSession sesion=request.getSession(false);
             if(request.getParameter("nombre") == null || request.getParameter("nombre").isEmpty()){
                response.sendRedirect("usuarios.htm?msj=Emptyname");                   
             }
             else if(request.getParameter("ap_paterno") == null || request.getParameter("ap_paterno").isEmpty()){
                    response.sendRedirect("usuarios.htm?msj=Emptylname1");                   
             }
             else if(request.getParameter("ap_materno") == null || request.getParameter("ap_materno").isEmpty()){
                    response.sendRedirect("usuarios.htm?msj=Emptylname2");                   
             }
             else if(request.getParameter("password") == null || request.getParameter("password").isEmpty()){
                    response.sendRedirect("usuarios.htm?msj=Emptypsw");                   
             }
             else if(request.getParameter("rol").toString().matches("") || request.getParameter("rol") == null || request.getParameter("rol").isEmpty()){
                    response.sendRedirect("usuarios.htm?msj=Emptyrol");                   
             }
             else if(request.getParameter("status").toString().matches("") || request.getParameter("status") == null || request.getParameter("status").isEmpty()){
                    response.sendRedirect("usuarios.htm?msj=Emptysta");                   
             }
             else{
                  try{
                login l = new login();
                String psw = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
                String host = InetAddress.getLocalHost().toString();
               int access = l.updateuser(session.getAttribute("id_usuario").toString(), request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), psw ,request.getParameter("rol"),request.getParameter("status"),host);
                        
                
                if(access == 0){
                     response.sendRedirect("usuarios.htm?msj=rError&e=upfailed");
                }
                else{
                    response.sendRedirect("usuarios.htm?msj=upsuccess");
                }
                }
                catch(Exception e){
                    response.sendRedirect("usuarios.htm?msj=Error&e=" + e);
                }
             }
    

    %>    
    
    </body>
</html>
