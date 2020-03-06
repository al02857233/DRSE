<%-- 
    Document   : menu_admin
    Created on : 29-ene-2020, 17:42:12
    Author     : Prueba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Menu .:</title>
    </head>
    <body>
        <%
            try{
                if(session.getAttribute("user")  == null){
                     response.sendRedirect("login.htm");   
                }
                if(!session.getAttribute("rol_user").toString().matches("1")){
                     response.sendRedirect("login.htm?logout=true");   
                }
            }
            catch(Exception e){
            }
        %>
        <div style="text-align: right" ><h2>Bienvenido <%=session.getAttribute("user")%></h2></div>
        <tr>
        </tr>
        <h1 style="text-align: center">Menú</h1>
        <table align="center" style="text-align: center" >
            <tbody>
                <tr>
                    <td>
                        <form name="Usuarios" action="usuarios.htm" method="POST">
                        <input type="submit" value="Usuarios" name="Usuarios"/>
                        </form>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form name="Directorio" action="directorio.htm" method="POST">
                        <input type="submit" value="Directorio" name="Directorio"/>
                        </form>
                        <br>
                    </td>
                </tr>
                    <td>
                        <form name="Salir" action="index.htm?logout=true" method="POST">
                        <input type="submit" value="Salir" name="Salir"/>
                        </form>
                        <br>
                    </td>
            </tbody>
        </table>

    </body>
</html>
