<%-- 
    Document   : getjefe
    Created on : 21-feb-2020, 13:15:42
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codigo.controller.jefe"%>
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
            List<Map<String, Object>> supMap = null; 
            List<Map<String, Object>> atpMap = null; 
            List<Map<String, Object>> dirMap = null; 
            try{
              jefe jefe = new jefe();
              res = jefe.getjefe(request.getParameter("nombre"), request.getParameter("ap_paterno"), request.getParameter("ap_materno"), request.getParameter("tel_oficina"), request.getParameter("tel_particular"), request.getParameter("celular"),  request.getParameter("email"),  request.getParameter("sector"), request.getParameter("status"));
              if(res != null){
                    if(res.size() > 1){
                        session.setAttribute("mapjefe",res);
                    }
                    else if(res.size() == 1){
                        session.setAttribute("id_jefe", res.get(0).get("id_jefe").toString());
                        session.setAttribute("nombre", res.get(0).get("nombre").toString());
                        session.setAttribute("ap_paterno", res.get(0).get("ap_paterno").toString());
                        session.setAttribute("ap_materno", res.get(0).get("ap_materno").toString());
                        session.setAttribute("tel_oficina", res.get(0).get("tel_oficina").toString());
                        session.setAttribute("tel_particular", res.get(0).get("tel_particular").toString());
                        session.setAttribute("celular", res.get(0).get("celular").toString());                        
                        session.setAttribute("email", res.get(0).get("email").toString());
                        session.setAttribute("sector", res.get(0).get("sector").toString());
                        session.setAttribute("status",res.get(0).get("status").toString());  
                       
                        try{//supervisor
                        supervisor sup  = new supervisor();
                        supMap = sup.getsupervisoresIdJefe(res.get(0).get("id_jefe").toString());
                        if(supMap != null){
                            if(supMap.size() > 1){
                            session.setAttribute("mapsup",supMap);
                                try{//atps
                                    atp atp = new atp();
                                    String sups = "";
                                    for(int i =0;i<supMap.size();i++){
                                        if(i == 0)
                                            sups = sups + supMap.get(i).get("id_supervisor").toString();
                                        else
                                            sups = sups + "," + supMap.get(i).get("id_supervisor").toString();
                                    }
                                    atpMap = atp.getatpsIdsup(sups);
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
                                    String sups = "";
                                    for(int i =0;i<supMap.size();i++){
                                        if(i == 0)
                                            sups = sups + supMap.get(i).get("id_supervisor").toString();
                                        else
                                            sups = sups + "," + supMap.get(i).get("id_supervisor").toString();
                                    }
                                    dirMap = dir.getdirsIdsup(sups);
                                    if(dirMap != null){
                                        if(dirMap.size() > 0){
                                            session.setAttribute("mapdir",dirMap);
                                        }
                                    }
                                }
                                catch(Exception e){
                                }
                                
                            }
                        }
                        }
                        catch(Exception e){ //Supervisor
                        }
                        
                        
                        
                        
                    }
                    
                    session.setAttribute("mapsize",res.size());
                    response.sendRedirect("jefes.htm?msj=getdone");
                }
              
            }
            catch(Exception e){
                response.sendRedirect("jefes.htm?msj=Error&e=" + e);
            }
                 
        %>
        
    </body>
</html>

