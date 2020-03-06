<%-- 
    Document   : getsupervisor
    Created on : 19-feb-2020, 13:01:39
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.supervisor"%>
<%@page import="com.codigo.controller.atp"%>
<%@page import="com.codigo.controller.director"%>
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
            List<Map<String, Object>> atpMap = null; 
            List<Map<String, Object>> dirMap = null; 
            try{
              supervisor sup = new supervisor();
              res = sup.getsupervisor(request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), request.getParameter("tel_oficina"), request.getParameter("tel_particular"), request.getParameter("celular"),  request.getParameter("email"), request.getParameter("ciudad"), request.getParameter("ct"), request.getParameter("zona"), request.getParameter("jefe"), request.getParameter("status"));
              if(res != null){
                    if(res.size() > 1){
                        session.setAttribute("mapsup",res);
                    }
                    else if (res.size() == 1){
                        session.setAttribute("id_supervisor", res.get(0).get("id_supervisor").toString());
                        session.setAttribute("nombre", res.get(0).get("nombre").toString());
                        session.setAttribute("ap_paterno", res.get(0).get("ap_paterno").toString());
                        session.setAttribute("ap_materno", res.get(0).get("ap_materno").toString());
                        session.setAttribute("tel_oficina", res.get(0).get("tel_oficina").toString());
                        session.setAttribute("tel_particular", res.get(0).get("tel_particular").toString());
                        session.setAttribute("celular", res.get(0).get("celular").toString());                        
                        session.setAttribute("email", res.get(0).get("email").toString());
                        session.setAttribute("ciudad", res.get(0).get("ciudad").toString());
                        session.setAttribute("ct", res.get(0).get("ct").toString());
                        session.setAttribute("zona", res.get(0).get("zona").toString());
                        session.setAttribute("jefe", res.get(0).get("jefe").toString());
                        session.setAttribute("status",res.get(0).get("status").toString());  
                        try{//atps
                                    atp atp = new atp();
                                    atpMap = atp.getatpsIdsup(res.get(0).get("id_supervisor").toString());
                                    if(atpMap != null){
                                        if(atpMap.size() > 0){
                                            session.setAttribute("mapatp",atpMap);
                                        }
                                    }
                                }
                                catch(Exception e){
                                }
                                
                                try{//dirs
                                    director dir = new director();
                                    dirMap = dir.getdirsIdsup(res.get(0).get("id_supervisor").toString());
                                    if(dirMap != null){
                                        if(dirMap.size() > 0){
                                            session.setAttribute("mapdir",dirMap);
                                        }
                                    }
                                }
                                catch(Exception e){
                                }
                        
                    }
                    
                    session.setAttribute("mapsize",res.size());
                    response.sendRedirect("supervisores.htm?msj=getdone");
                }
              
            }
            catch(Exception e){
                response.sendRedirect("supervisores.htm?msj=Error&e=" + e);
            }
                 
        %>
        
    </body>
</html>
