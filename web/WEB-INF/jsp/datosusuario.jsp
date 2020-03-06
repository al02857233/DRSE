
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.login"%>
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
                login l = new login();
                 res = l.getdatos(request.getParameter("nombre"),request.getParameter("ap_paterno"),request.getParameter("ap_materno"),request.getParameter("usuario"),request.getParameter("password"),request.getParameter("rol"),request.getParameter("status")); 
                  if(res != null){
                    if(res.size() > 1){
                        session.setAttribute("map",res);
                    }
                    else if(res.size() == 1){
                        session.setAttribute("id_usuario", res.get(0).get("id_usuario").toString());
                        session.setAttribute("nombre", res.get(0).get("nombre").toString());
                        session.setAttribute("ap_paterno", res.get(0).get("ap_paterno").toString());
                        session.setAttribute("ap_materno", res.get(0).get("ap_materno").toString());                        
                        session.setAttribute("usuario", res.get(0).get("usuario").toString());
                        byte[] decpsw = Base64.getDecoder().decode(res.get(0).get("password").toString());
                        String psw = new String(decpsw);
                        session.setAttribute("password",psw);
                        session.setAttribute("rol", res.get(0).get("rol").toString());
                        session.setAttribute("status", res.get(0).get("status").toString());
                        
                    }

                    session.setAttribute("mapsize",res.size());
                    response.sendRedirect("usuarios.htm?msj=getdone");
                    } 
                }
                  
                catch(Exception e){
                    response.sendRedirect("usuarios.htm?msj=Error&e=" + e);
                }
           %>
    </body>
</html>
