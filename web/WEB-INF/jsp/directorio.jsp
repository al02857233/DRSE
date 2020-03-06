<%-- 
    Document   : directorio
    Created on : 04-feb-2020, 13:17:42
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Directorio .:</title>
    </head>
    <body>
         <%
             String action = "";
             String value = "";
             
            
            try{
                if(session.getAttribute("user")  == null){
                     response.sendRedirect("login.htm");   
                }
                if(session.getAttribute("rol_user").toString().matches("1")){
                     action = "admin.htm";
                     value = "Regresar";
                }
                else{
                    action = "index.htm?logout=true";
                     value = "Salir";
                }
                
                
                
                    
            }
            catch(Exception e){
            }
        %>
       <div style="text-align: right" ><h2>Bienvenido <%=session.getAttribute("user")%></h2>
           <form name="directorio" action="<%=action%>" method="POST">
               <input type="submit" value="<%=value%>" name="Regresar"/>
            </form>
        </div>
         <br>
         <div style="text-align: center" ><h2> Busqueda Introduzca los Datos </h2></div>
         <table border="0" align="center">
             <tbody>
                <tr align = "center">
                    <td>
                        <form id="form1" action="escuelas.htm" method="post" style="alignment-adjust: central">  
                            <input type="submit" value="Escuelas" name="Escuelas" />
                        </form>
                    </td>
                 </tr>
                 <tr align = "center">
                     <td>
                        <br>
                        <form id="form2" action="directores.htm" method="post" style="alignment-adjust: central">  
                            <input type="submit" value="Directores" name="Directores" />
                        </form>
                    </td>
                 </tr>
                 <tr align = "center">
                     <td>
                        <br>
                        <form id="form3" action="supervisores.htm" method="post" style="alignment-adjust: central">  
                            <input type="submit" value="Supervisores" name="supervisores" />
                        </form>
                    </td>
                 </tr>
                 <tr align = "center">
                     <td>
                        <br>
                        <form id="form4" action="atps.htm" method="post" style="alignment-adjust: central">  
                            <input type="submit" value="ATPs" name="atps" />
                        </form>
                    </td>
                 </tr>
                 <tr align = "center">
                     <td>
                        <br>
                        <form id="form5" action="jefes.htm" method="post" style="alignment-adjust: central">  
                            <input type="submit" value="Jefes de Sector" name="jefes" />
                        </form>
                    </td>
                 </tr>
             </tbody>
         </table>

    </body>
</html>
