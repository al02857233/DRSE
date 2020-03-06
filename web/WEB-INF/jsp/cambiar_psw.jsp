<%-- 
    Document   : cambiar_psw
    Created on : 24-feb-2020, 13:52:54
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Password .:</title>
    </head>
    <body>
        <%
            String color = "Red";
            String msj = "";
        %>
        <div style="text-align: right" >
                <h2>
                    Bienvenido <%=session.getAttribute("user")%>
                </h2>
                <form name="login" action="login.htm" method="POST">
                    <input type="submit" value="Regresar" name="Regresar"/>
               </form>
        </div>
        <br><br>
        <div style="text-align: center" >
            <h3>Por Motivos de Seguridad es importante que cambie su password</h3>
        </div>
        
        <table border="0" align="center">
            <tbody>
                <tr>
                    <td>
                        <form id="setdatos" name="setdatos" action="modpsw.htm"  method="POST" style="alignment-adjust: central">
                        <table border="0" align="center">
                            <tbody>
                                <tr>
                                    <td align="right">Password:</td>
                                    <td><input type="password" name="password" value="" /></td>
                                </tr>
                                 <tr>
                                    <td>Confirmar Password:</td>
                                    <td><input type="password" name="conf_password" value="" /></td>
                                </tr>
                                <tr align="center">
                                    <td colspan="2">
                                        <input type="submit" value="Actualizar" name="Actualizar"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                    </td>
                </tr>
               </tbody>
            </table>
        <%
         try{
              color = "red";
              if(request.getParameter("msj").matches("Emptypsw")){
                 msj = "Password Requerido, Favor de Capturarlo";
               }
              else if(request.getParameter("msj").matches("Emptypswc")){
                  msj = "Confirmaciòn de Password Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("notmatch")){
                  msj = "Password y Confirmación No Coinciden, Favor de Verificarlo";
                }
              else if(request.getParameter("msj").matches("UpSuccess")){
                  msj = "Password Actualizado Correctamente" ;
                  color = "Black";
                }
              else if(request.getParameter("msj").matches("upfailed")){
                  msj = "Fallo al Actualizar Password" ;
                }
              
              
          }
          catch(Exception e){
                
                }
          %>
           <div style="text-align: center" > 
               <h2 style="color: <%=color%>">
                    <%=msj%>
               </h2> 
           </div>
        
    </body>
</html>
