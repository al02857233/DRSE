<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Directorio DRSE Ocotlán .:</title>
    </head>
       <body>
           <table border="0" align="center">
               <thead>
                   <tr>
                       <th></th>
                       <th></th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td></td>
                       <td align="left" ><img src="<c:url value="/img/jalisco.jpg"/>" /></td>
                   </tr>
               </tbody>
           </table>                  
                   
           

           <h1 align="center">Bienvenido al Sistema de Directorio de la DRSE Ocotlán</h1>
        <form action="login.htm" method="post">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="right"><label>Usuario:</label></td>
                        <td><input type="text" name="user" value=""></td>
                    </tr>
                    <tr>
                        <td><label>Password:</label></td>
                        <td><input type="password" name="password" value=""></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Entrar"></td>
                    </tr>
                </tbody>
            </table>
        
        </form>
        <%
          String msj = "";
          try{
              session.invalidate();
              if(request.getParameter("msj").matches("EmptyUsr")){
                 msj = "Usuario Requerido, Favor de Capturarlo";
               }
              else if(request.getParameter("msj").matches("EmptyPsw")){
                  msj = "Password Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("InvalidUsr")){
                  msj = "Nombre de Usuario y/o Password Invalidos";
                }
               else if(request.getParameter("msj").matches("Error")){
                  msj = "Occurrió un Error favor de Contactar al Departamento de Sistemas y proporcionar este error " + "</br></br>" +  request.getParameter("e") ;
                }
          }
          catch(Exception e){
                
                }

        %>
        <h2 style="color: red" align="center">
            <%=msj%>
        </h2>
        
        
    </body>
</html>
