<%-- 
    Document   : modpsw
    Created on : 25-feb-2020, 10:42:13
    Author     : rodrigo.yanez
--%>

<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.login"%>
<%@page import="java.net.InetAddress"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            if(request.getParameter("password") == null || request.getParameter("password").isEmpty()){
                response.sendRedirect("cambiar_psw.htm?msj=Emptypsw");                   
             }
            else if(request.getParameter("conf_password") == null || request.getParameter("conf_password").isEmpty()){
                    response.sendRedirect("cambiar_psw.htm?msj=Emptypswc");                   
             }
             else if(!request.getParameter("password").matches(request.getParameter("conf_password"))){
                    response.sendRedirect("cambiar_psw.htm?msj=notmatch");                   
             }
            else{
               try{
               login pswup = new login();
               String psw = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
               String host = InetAddress.getLocalHost().toString();
               
               int res = pswup.updatepsw(session.getAttribute("usr").toString(), psw, host);
                             
                if(res == 0){
                     response.sendRedirect("cambiar_psw.htm?msj=upfailed");
                }
                else if(res == 1){
                    response.sendRedirect("cambiar_psw.htm?msj=UpSuccess");
                }
                }
                catch(Exception e){
                    response.sendRedirect("cambiar_psw.htm?msj=Error&e=" + e);
                }
                      
             }
    
    %>  
    </body>
</html>