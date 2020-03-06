<%@page import="java.util.Base64"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.login"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.util.Enumeration" %>
<%@page import="java.util.Map"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Directorio DRSE Ocotlán</title>
    </head>
       
           <%
               if(request.getParameter("user") == null || request.getParameter("user").isEmpty()){
                    response.sendRedirect("index.htm?msj=EmptyUsr");                   
                }
               else if(request.getParameter("password") == null || request.getParameter("password").isEmpty()){
                    response.sendRedirect("index.htm?msj=EmptyPsw");                   
                }
               else{
               
                try{
                login l = new login();
                String psw = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
                String access = l.login(request.getParameter("user"), psw );
                
                
                if(access.matches("0")){
                     response.sendRedirect("index.htm?msj=InvalidUsr");
                }
                else{         
                    HttpSession sesion = request.getSession(false);
                    sesion.setAttribute("usr", access); 
                    Map<String, Object> map = l.getUserName(access);
                    sesion.setAttribute("user",(String) map.get("Nombre"));
                    sesion.setAttribute("rol_user",(String) map.get("Rol"));
                    sesion.setAttribute("cambiar_psw",(String) map.get("cambiar_psw"));
                    
                    
                    if(sesion.getAttribute("cambiar_psw").toString().matches("1")){
                        response.sendRedirect("cambiar_psw.htm");
                     }
                    else if(sesion.getAttribute("rol_user").toString().matches("1")){
                        response.sendRedirect("admin.htm");
                     }                
                     else{
                        response.sendRedirect("directorio.htm");
                     }
                }
                }
                catch(Exception e){
                    response.sendRedirect("index.htm?msj=Error&e=" + e);
                }
               }
                
                
             
            %>

    
</html>
    
