<%-- 
    Document   : directores
    Created on : 17-feb-2020, 13:58:15
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.codigo.controller.director"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Directores .:</title>
    </head>
    <body>
         <%
            String msj = "";
            String color = "red";
            String nombre = "";
            String ap_paterno = "";
            String ap_materno = "";
            String telefono = "";
            String email = "";
            String rfc = "";
            String status = "";
            int status_int = 0;
           
            try{
                if(session.getAttribute("user")  == null){
                     response.sendRedirect("login.htm");   
                }
                
                if(Integer.parseInt(session.getAttribute("mapsize").toString()) > 1){
                    msj = "Se Encontro mas de un registro con su busqueda";
                    color = "black";
                }
                else{
                    nombre = session.getAttribute("nombre").toString();
                    ap_paterno = session.getAttribute("ap_paterno").toString();
                    ap_materno = session.getAttribute("ap_materno").toString();
                    telefono = session.getAttribute("telefono").toString();
                    email = session.getAttribute("email").toString();
                    rfc = session.getAttribute("rfc").toString();
                    status = session.getAttribute("status").toString();
                     if(status.matches("Activo")){status_int = 1;}
                    if(status.matches("Inactivo")){status_int = 2;}                    
                    session.removeAttribute("nombre");
                    session.removeAttribute("ap_paterno");
                    session.removeAttribute("ap_materno");
                    session.removeAttribute("telefono");
                    session.removeAttribute("email");
                    session.removeAttribute("rfc");
                    session.removeAttribute("status");
                    session.removeAttribute("mapdir");
                }
                
                   
            }
            catch(Exception e){
            }

            
         %>
         <div style="text-align: right" ><h2>Bienvenido <%=session.getAttribute("user")%></h2>
                <form name="directorio" action="directorio.htm" method="POST">
                    <input type="submit" value="Regresar" name="Regresar"/>
               </form></div>
         </div>
         <br>
         <div style="text-align: center" ><h2>Seleccione la Opcion Deseada</h2></div>
         <table border="0" align="center">
            <tbody>
                
                <tr>
                    <td colspan="3" align="center">
                        <form id="setdatos" name="setdatos" method="POST" style="alignment-adjust: central">
                            <table border="0">
                                <tbody>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Nombre:</td>
                                        <td><input type="text" name="nombre" id="nombre" value="<%=nombre%>" /></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Ap Paterno:</td>
                                        <td><input type="text" name="ap_paterno" value="<%=ap_paterno%>" /></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Ap Materno:</td>
                                        <td><input type="text" name="ap_materno" value="<%=ap_materno%>" /></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Telefono</td>
                                        <td><input type="text" name="telefono" value="<%=telefono%>"  maxlength="10" onkeypress="Onlynumbers(event)"/></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Email:</td>
                                        <td><input type="text" name="email" value="<%=email%>" /></td>
                                    </tr>
                                     <tr align = "center">
                                        <td colspan="2" style="text-align: right" >RFC:</td>
                                        <td><input type="text" name="rfc" value="<%=rfc%>" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: right" >Estatus:</td>
                                        <td>
                                            <select id="status" name="status">
                                                <option></option>
                                                <option>Activo</option>
                                                <option>Inactivo</option>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form name="insdirector" action="insertardir.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('insdirector')">
                            <input type="submit" value="Alta Director" name="insdirector" />
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
                                        <td><input type="text" name="telefono" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                     <tr>
                                        <td><input type="text" name="rfc" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="status" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form name="getdirector" action="getdirector.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('getdirector')">
                        <input type="submit" value="Traer Director" name="getdirector"/>
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
                                        <td><input type="text" name="telefono" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                     <tr>
                                        <td><input type="text" name="rfc" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="status" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form name="moddirector" action="moddirector.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('moddirector')">
                        <input type="submit" value="Modificar Director" name="moddirector"/>
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
                                        <td><input type="text" name="telefono" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                     <tr>
                                        <td><input type="text" name="rfc" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="status" name="status" value="" /></td>
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
                 msj = "Nombre de Director Requerido, Favor de Capturarlo";
               }
              else if(request.getParameter("msj").matches("Emptyname1")){
                  msj = "Apellido Paterno Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyname2")){
                  msj = "Apellido Materno Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptytel")){
                  msj = "Telefono Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptymail")){
                  msj = "Email Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyrfc")){
                  msj = "RFC Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptysta")){
                  msj = "Estatus Requerido, Favor de Capturarlo";
                }
             else if(request.getParameter("msj").matches("Error")){
                   if(request.getParameter("e").contains("Index: 0, Size: 0")){
                       msj = "No se Encontró Registro" ;
                       color = "black";
                       session.removeAttribute("mapdir");
                   }
                   else if(request.getParameter("e").contains("NullPointerException")){
                       msj = "Director Invalido, Favor de apuntar al registro correcto" ;
                       session.removeAttribute("mapdir");
                   }
                   else
                        msj = "Ocurrió un Error favor de Contactar al Departamento de Sistemas y proporcionar este error " + "</br></br>" +  request.getParameter("e") ;
                }
              else if(request.getParameter("msj").matches("InsSuccess")){
                  msj = "Director Insertado Correctamente" ;
                }
               else if(request.getParameter("msj").matches("Invalidir")){
                  msj = "Director Invalido" ;
                }
              else if(request.getParameter("msj").matches("UpSuccess")){
                  msj = "Director Actualizado Correctamente" ;
                }
              else if(request.getParameter("msj").matches("Exists")){
                  msj = "Verifique el Nombre, Director ya existe" ;
                }
              else if(request.getParameter("msj").matches("Denied")){
                  msj = "Usted no cuenta con estos privilegios, contacte al Administrador" ;
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
                <td>Telefono</td>
                <td>Email</td>
                <td>RFC</td>
                <td>Estatus</td>
                </thead>
                <c:forEach items="${mapdir}" var="list">
                  <tr>
                    <td><c:out value="${list.nombre}" /></td>
                    <td><c:out value="${list.ap_paterno}" /></td>
                    <td><c:out value="${list.ap_materno}" /></td>
                    <td><c:out value="${list.telefono}" /></td>
                    <td><c:out value="${list.email}" /></td>
                    <td><c:out value="${list.rfc}" /></td>
                    <td><c:out value="${list.status}" /></td>
                  </tr>
                </c:forEach>
            </table>
          


         <script>
             function Onlynumbers(evt){
                 var theevent = evt || windows.event;
                 if(theevent.type === 'paste'){
                     key = event.clipboardData.getdata('text/plain');
                 }
                 else{
                     var key = theevent.keyCode || theevent.which;
                     key = String.fromCharCode(key);
                 }
                 var regex = /[0-9]/;
                 if(!regex.test(key)){
                     theevent.returnValue = false;
                     if(theevent.preventDefault)
                         theevent.preventDefault();
                 }
             }
             
             function parsedatos(source){
                 document.forms[source].elements['nombre'].value = document.forms['setdatos'].elements['nombre'].value;
                 document.forms[source].elements['ap_paterno'].value = document.forms['setdatos'].elements['ap_paterno'].value;
                 document.forms[source].elements['ap_materno'].value = document.forms['setdatos'].elements['ap_materno'].value;
                 document.forms[source].elements['telefono'].value = document.forms['setdatos'].elements['telefono'].value;
                 document.forms[source].elements['email'].value = document.forms['setdatos'].elements['email'].value;
                 document.forms[source].elements['rfc'].value = document.forms['setdatos'].elements['rfc'].value;
                 document.forms[source].elements['status'].value = document.forms['setdatos'].elements['status'].value;

            }
        
         </script>
         
         <script type="text/javascript">
             document.forms['setdatos'].elements['status'].selectedIndex = <%=status_int%>;
        </script>
             
        <% 
        session.removeAttribute("mapdir");
        session.removeAttribute("mapsize");
        %>
    </body>
</html>

