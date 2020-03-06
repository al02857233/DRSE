<%-- 
    Document   : getatp
    Created on : 20-feb-2020, 11:42:27
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.atp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>


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
              atp atp = new atp();
              res = atp.getatp(request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), request.getParameter("tel_oficina"), request.getParameter("tel_particular"), request.getParameter("celular"),  request.getParameter("email"), request.getParameter("supervisor"), request.getParameter("status"));
              if(res != null){
                    if(res.size() > 1){
                        session.setAttribute("mapatp",res);
                    }
                    else{
                        session.setAttribute("id_atp", res.get(0).get("id_atp").toString());
                        session.setAttribute("nombre", res.get(0).get("nombre").toString());
                        session.setAttribute("ap_paterno", res.get(0).get("ap_paterno").toString());
                        session.setAttribute("ap_materno", res.get(0).get("ap_materno").toString());
                        session.setAttribute("tel_oficina", res.get(0).get("tel_oficina").toString());
                        session.setAttribute("tel_particular", res.get(0).get("tel_particular").toString());
                        session.setAttribute("celular", res.get(0).get("celular").toString());                        
                        session.setAttribute("email", res.get(0).get("email").toString());
                        session.setAttribute("supervisor", res.get(0).get("supervisor").toString());
                        session.setAttribute("status",res.get(0).get("status").toString());  
                    }
                    
                    session.setAttribute("mapsize",res.size());
                    response.sendRedirect("atps.htm?msj=getdone");
                }
              
            }
            catch(Exception e){
                response.sendRedirect("atps.htm?msj=Error&e=" + e);
            }
                 
        %>
        
    </body>
</html>
