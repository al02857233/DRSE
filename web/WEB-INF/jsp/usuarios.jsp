<%-- 
    Document   : usuarios
    Created on : 13-feb-2020, 11:03:36
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Usuarios .:</title>
    </head>
    <body>
         <%
            String msj = "";
            String color = "red";
            String nombre = "";
            String ap_paterno = "";
            String ap_materno = "";
            String usuario = "";
            String password = "";
            String rol = "";
            int rol_int = 0;
            String status = "";
            int status_int = 0;
             
            try{
                if(session.getAttribute("user")  == null){
                     response.sendRedirect("login.htm");   
                }
                if(!session.getAttribute("rol_user").toString().matches("1")){
                     response.sendRedirect("login.htm?logout=true");   
                }
                
                if(Integer.parseInt(session.getAttribute("mapsize").toString()) > 1){
                    msj = "Se Encontro mas de un registro con su busqueda";
                    color = "black";
                }
                else if(Integer.parseInt(session.getAttribute("mapsize").toString()) == 0){
                    msj = "No se Encontró Registro" ;
                    color = "black";
                    session.removeAttribute("map");
                }
                else{
                    nombre = session.getAttribute("nombre").toString();
                    ap_paterno = session.getAttribute("ap_paterno").toString();
                    ap_materno = session.getAttribute("ap_materno").toString();
                    usuario = session.getAttribute("usuario").toString();
                    password = session.getAttribute("password").toString();
                    rol = session.getAttribute("rol").toString();
                    if(rol.matches("Usuario")){rol_int = 1;}
                    if(rol.matches("Administrador")){rol_int = 2;}
                    if(rol.matches("Directorio")){rol_int = 3;}
                    status = session.getAttribute("status").toString();
                    if(status.matches("Activo")){status_int = 1;}
                    if(status.matches("Inactivo")){status_int = 2;}
                    session.removeAttribute("nombre");
                    session.removeAttribute("ap_paterno");
                    session.removeAttribute("ap_materno");
                    session.removeAttribute("usuario");
                    session.removeAttribute("password");
                    session.removeAttribute("rol");
                    session.removeAttribute("status");
                    session.removeAttribute("map");
                }
            
                    
            }
            catch(Exception e){
            }
        %>
         <div style="text-align: right" ><h2>Bienvenido <%=session.getAttribute("user")%></h2>
             <form name="admin" action="admin.htm" method="POST">
                    <input type="submit" value="Regresar" name="Regresar"/>
            </form>
         </div>
          <br>
         <div style="text-align: center" ><h2>Seleccione la Opcion Deseada</h2></div>  
        <table border="0" align="center">
            <tbody>
                <tr>
                    <td colspan="2" align="center">
                        <form id="setdatos" name="setdatos" method="POST" style="alignment-adjust: central">
                        <table border="0" align="center">
                            <tbody>
                                <tr>
                                    <td>Nombre:</td>
                                    <td><input type="text" name="nombre" value="<%=nombre%>" /></td>
                                </tr>
                                 <tr>
                                    <td>Apellido Paterno:</td>
                                    <td><input type="text" name="ap_paterno" value="<%=ap_paterno%>" /></td>
                                </tr>
                                 <tr>
                                    <td>Apellido Materno:</td>
                                    <td><input type="text" name="ap_materno" value="<%=ap_materno%>" /></td>
                                </tr>
                                <tr>
                                    <td>Usuario:</td>
                                    <td><input type="text" name="usuario" value="<%=usuario%>" /></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type="password" name="password" value="<%=password%>" /></td>
                                </tr>
                                <tr>
                                    <td>Rol:</td>
                                    <td><select name="rol">
                                            <option></option>
                                            <option>Usuario</option>
                                            <option>Administrador</option>
                                            <option>Directorio</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Estatus:</td>
                                    <td><select name="status">
                                            <option></option>
                                            <option>Activo</option>
                                            <option>Inactivo</option>
                                        </select></td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form id="crearusuario" name="crearusuario" action="insertar.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('crearusuario')">
                            <input type="submit" value="Alta Usuario" name="Alta Usuario" />
                            <table border="0" hidden="true">
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="nombre" id="nombre" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ap_paterno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ap_materno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="usuario" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="password" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="rol" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form  name="datosusuario" action="datosusuario.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('datosusuario')">
                        <input type="submit" value="Traer Usuario" name="datosusuario"/>
                        <table border="0" hidden="true">
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="nombre" id="nombre" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ap_paterno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ap_materno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="usuario" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="password" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="rol" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form id="modusuario" name="modusuario" action="actualizar.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('modusuario')">
                        <input type="submit" value="Modificar Usuario" name="modusuario"/>
                        <table border="0" hidden="true">
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="nombre" id="nombre" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ap_paterno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ap_materno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="usuario" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="password" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="rol" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="status" value="" /></td>
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
              if(request.getParameter("msj").matches("Emptyname")){
                 msj = "Nombre de Usuario Requerido, Favor de Capturarlo";
               }
              else if(request.getParameter("msj").matches("Emptylname1")){
                  msj = "Apellido Paterno Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptylname2")){
                  msj = "Apellido Materno Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyuser")){
                  msj = "Usuario Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptypsw")){
                  msj = "Password Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyrol")){
                  msj = "Rol Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptysta")){
                  msj = "Estatus Requerido, Favor de Capturarlo";
                }
               else if(request.getParameter("msj").matches("Error")){
                   if(request.getParameter("e").contains("UNIQUE KEY"))
                       msj = "Usuario ya existe" ;
                   else
                    msj = "Ocurrió un Error favor de Contactar al Departamento de Sistemas y proporcionar este error " + "</br></br>" +  request.getParameter("e") ;
                }
              else if(request.getParameter("msj").matches("Success")){
                  msj = "Usuario Registrado Correctamente" ;
                }
              else if(request.getParameter("msj").matches("upsuccess")){
                  msj = "Usuario Actualizado Correctamente" ;
                }
              else if(request.getParameter("msj").matches("upfailed")){
                  msj = "Fallo al Actualizar Registro" ;
                }
              
              
          }
          catch(Exception e){
                
                }
          %>
         
         <div style="text-align: center" > <h2 style="color: <%=color%>">
            <%=msj%>
             </h2> </div>
            <br>
             <table border="1" align="center" class="tabladatos">
             <link rel="stylesheet" href="<c:url value="/img/table.css"/>" />
                <thead>
                <td>Nombre</td>
                <td>Ap Paterno</td>
                <td>Ap Materno</td>
                <td>Usuario</td>
                <td>Rol</td>
                <td>Estatus</td>
                </thead>
                <c:forEach items="${map}" var="list">
                  <tr>
                    <td><c:out value="${list.nombre}" /></td>
                    <td><c:out value="${list.ap_paterno}" /></td>
                    <td><c:out value="${list.ap_materno}" /></td>
                    <td><c:out value="${list.usuario}" /></td>
                    <td><c:out value="${list.rol}" /></td>
                    <td><c:out value="${list.status}" /></td>
                  </tr>
                </c:forEach>
            </table>
                
            <script>
             
             
             function parsedatos(source){
                 document.forms[source].elements['nombre'].value = document.forms['setdatos'].elements['nombre'].value;
                 document.forms[source].elements['ap_paterno'].value = document.forms['setdatos'].elements['ap_paterno'].value;
                 document.forms[source].elements['ap_materno'].value = document.forms['setdatos'].elements['ap_materno'].value;
                 document.forms[source].elements['usuario'].value = document.forms['setdatos'].elements['usuario'].value;
                 document.forms[source].elements['password'].value = document.forms['setdatos'].elements['password'].value;
                 document.forms[source].elements['rol'].value = document.forms['setdatos'].elements['rol'].value;
                 document.forms[source].elements['status'].value = document.forms['setdatos'].elements['status'].value;
            }
        
         </script>
         
         <script type="text/javascript">
             document.forms['setdatos'].elements['rol'].selectedIndex = <%=rol_int%>;
             document.forms['setdatos'].elements['status'].selectedIndex = <%=status_int%>;
        </script>
        
        <% 
        session.removeAttribute("map");
        session.removeAttribute("mapsize");
        %>

    </body>
</html>
