<%-- 
    Document   : jefes
    Created on : 20-feb-2020, 13:46:07
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
        <title>:. Jefes de Sector .:</title>
    </head>
    <body>
         <%
            String msj = "";
            String color = "red";
            String nombre = "";
            String ap_paterno = "";
            String ap_materno = "";
            String tel_oficina = "";
            String tel_particular = "";
            String celular = "";
            String email = "";
            String sector = "";
            String status = "";
            String table_jefe = "display:none;";
            String table_sup = "display:none;";            
            String table_atp = "display:none;";          
            String table_dir = "display:none;";          
            int status_int = 0;
           
            try{
                if(session.getAttribute("user")  == null){
                     response.sendRedirect("login.htm");   
                }
                
                if(Integer.parseInt(session.getAttribute("mapsize").toString()) > 1){
                    color = "black";
                    msj = "Se Encontro mas de un registro con su busqueda";
                    table_jefe = "";
                }
                else{
                    nombre = session.getAttribute("nombre").toString();
                    ap_paterno = session.getAttribute("ap_paterno").toString();
                    ap_materno = session.getAttribute("ap_materno").toString();
                    tel_oficina = session.getAttribute("tel_oficina").toString();
                    tel_particular = session.getAttribute("tel_particular").toString();
                    celular = session.getAttribute("celular").toString();
                    email = session.getAttribute("email").toString();
                    sector = session.getAttribute("sector").toString();
                    status = session.getAttribute("status").toString();
                    if(status.matches("Activo")){status_int = 1;}
                    if(status.matches("Inactivo")){status_int = 2;}                    
                    session.removeAttribute("nombre");
                    session.removeAttribute("ap_paterno");
                    session.removeAttribute("ap_materno");
                    session.removeAttribute("tel_oficina");
                    session.removeAttribute("tel_particular");
                    session.removeAttribute("celular");
                    session.removeAttribute("email");
                    session.removeAttribute("status");
                    session.removeAttribute("sector");
                    session.removeAttribute("mapjefe"); 
                    table_jefe = "display:none;";
                    table_sup = "";    
                    table_atp = "";    
                    table_dir = "";  
                   
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
                                        <td colspan="2" style="text-align: right" >Tel Oficina:</td>
                                        <td><input type="text" name="tel_oficina" value="<%=tel_oficina%>"  maxlength="10" onkeypress="Onlynumbers(event)"/></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Tel Particular:</td>
                                        <td><input type="text" name="tel_particular" value="<%=tel_particular%>"  maxlength="10" onkeypress="Onlynumbers(event)"/></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Celular:</td>
                                        <td><input type="text" name="celular" value="<%=celular%>"  maxlength="10" onkeypress="Onlynumbers(event)"/></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Email:</td>
                                        <td><input type="text" name="email" value="<%=email%>" /></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Sector:</td>
                                        <td><input type="text" name="sector" value="<%=sector%>" /></td>
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
                        <form name="insjefe" action="insertarjefe.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('insjefe')">
                            <input type="submit" value="Alta Jefe de Sector" name="insjefe" />
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
                                        <td><input type="text" name="tel_oficina" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="tel_particular" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="celular" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="sector" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="status" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form name="getjefe" action="getjefe.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('getjefe')">
                        <input type="submit" value="Traer Jefe de Sector" name="getjefe"/>
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
                                        <td><input type="text" name="tel_oficina" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="tel_particular" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="celular" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="sector" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="status" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form name="modjefe" action="modjefe.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('modjefe')">
                        <input type="submit" value="Modificar Jefe de Sector" name="modjefe"/>
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
                                        <td><input type="text" name="tel_oficina" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="tel_particular" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="celular" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="sector" value="" /></td>
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
                 msj = "Nombre de Jefe de Sector Requerido, Favor de Capturarlo";
               }
              else if(request.getParameter("msj").matches("Emptyname1")){
                  msj = "Apellido Paterno Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyname2")){
                  msj = "Apellido Materno Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptycel")){
                  msj = "Celular Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptymail")){
                  msj = "Email Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptysect")){
                  msj = "Sector Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptysta")){
                  msj = "Estatus Requerido, Favor de Capturarlo";
                }
             else if(request.getParameter("msj").matches("Error")){
                   if(request.getParameter("e").contains("Index: 0, Size: 0")){
                       msj = "No se Encontró Registro" ;
                       color = "black";
                       session.removeAttribute("mapjefe");
                   }
                   else if(request.getParameter("e").contains("NullPointerException")){
                       msj = "ATP Invalido, Favor de apuntar al registro correcto" ;
                       session.removeAttribute("mapjefe");
                   }
                   else
                        msj = "Ocurrió un Error favor de Contactar al Departamento de Sistemas y proporcionar este error " + "</br></br>" +  request.getParameter("e") ;
                }
              else if(request.getParameter("msj").matches("InsSuccess")){
                  msj = "Jefe de Sector Insertado Correctamente" ;
                }
               else if(request.getParameter("msj").matches("Invalidjefe")){
                  msj = "Jefe de Sector Invalido" ;
                }
              else if(request.getParameter("msj").matches("UpSuccess")){
                  msj = "Jefe de Sector Actualizado Correctamente" ;
                }
              else if(request.getParameter("msj").matches("Exists")){
                  msj = "Verifique el Nombre, Jefe de Sector ya existe" ;
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
            <div style="text-align: center; <%=table_jefe%> " ><h2>Jefes de Sector</h2></div>
            <table border="1" align="center" class="tabladatos" style="<%=table_jefe%>">
             <link rel="stylesheet" href="<c:url value="/img/table.css"/>" />
                <thead>
                <td>Nombre</td>
                <td>Ap Paterno</td>
                <td>Ap Materno</td>
                <td>Tel Oficina</td>
                <td>Tel Particular</td>
                <td>Celular</td>
                <td>Email</td>
                <td>Sector</td>
                <td>Estatus</td>
                </thead>
                <c:forEach items="${mapjefe}" var="list">
                  <tr>
                    <td><c:out value="${list.nombre}" /></td>
                    <td><c:out value="${list.ap_paterno}" /></td>
                    <td><c:out value="${list.ap_materno}" /></td>
                    <td><c:out value="${list.tel_oficina}" /></td>
                    <td><c:out value="${list.tel_particular}" /></td>
                    <td><c:out value="${list.celular}" /></td>
                    <td><c:out value="${list.email}" /></td>
                    <td><c:out value="${list.sector}" /></td>
                    <td><c:out value="${list.status}" /></td>
                  </tr>
                </c:forEach>
            </table>
                
             <div style="text-align: center; <%=table_sup%>" ><h2>Supervisores</h2></div>
             <table border="1" align="center" class="tabladatos" style="<%=table_sup%>">
             <link rel="stylesheet" href="<c:url value="/img/table.css"/>" />
                <thead>
                <td>Nombre</td>
                <td>Ap Paterno</td>
                <td>Ap Materno</td>
                <td>Tel Oficina</td>
                <td>Tel Particular</td>
                <td>Celular</td>
                <td>Email</td>
                <td>Ciudad</td>
                <td>CT</td>
                <td>Zona</td>
                <td>Estatus</td>
                </thead>
                <c:forEach items="${mapsup}" var="list">
                  <tr>
                    <td><c:out value="${list.nombre}" /></td>
                    <td><c:out value="${list.ap_paterno}" /></td>
                    <td><c:out value="${list.ap_materno}" /></td>
                    <td><c:out value="${list.tel_oficina}" /></td>
                    <td><c:out value="${list.tel_particular}" /></td>
                    <td><c:out value="${list.celular}" /></td>
                    <td><c:out value="${list.email}" /></td>
                    <td><c:out value="${list.ciudad}" /></td>
                    <td><c:out value="${list.ct}" /></td>
                    <td><c:out value="${list.zona}" /></td>
                    <td><c:out value="${list.status}" /></td>
                  </tr>
                </c:forEach>
            </table>
                
             <div style="text-align: center; <%=table_atp%>" ><h2>ATPs</h2></div>
             <table border="1" align="center" class="tabladatos" style="<%=table_atp%>">
             <link rel="stylesheet" href="<c:url value="/img/table.css"/>" />
                <thead>
                <td>Supervisor</td>
                <td>Nombre</td>
                <td>Ap Paterno</td>
                <td>Ap Materno</td>
                <td>Tel Oficina</td>
                <td>Tel Particular</td>
                <td>Celular</td>
                <td>Email</td>
                <td>Estatus</td>
                </thead>
                <c:forEach items="${mapatp}" var="list">
                  <tr>
                    <td><c:out value="${list.supervisor}" /></td>
                    <td><c:out value="${list.nombre}" /></td>
                    <td><c:out value="${list.ap_paterno}" /></td>
                    <td><c:out value="${list.ap_materno}" /></td>
                    <td><c:out value="${list.tel_oficina}" /></td>
                    <td><c:out value="${list.tel_particular}" /></td>
                    <td><c:out value="${list.celular}" /></td>
                    <td><c:out value="${list.email}" /></td>
                    <td><c:out value="${list.status}" /></td>
                  </tr>
                </c:forEach>
            </table>
          
            <div style="text-align: center; <%=table_dir%>" ><h2>Directores</h2></div>
             <table border="1" align="center" class="tabladatos" style="<%=table_dir%>">
             <link rel="stylesheet" href="<c:url value="/img/table.css"/>" />
                <thead>
                <td>Supervisor</td>
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
                    <td><c:out value="${list.supervisor}" /></td>
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
                 document.forms[source].elements['tel_oficina'].value = document.forms['setdatos'].elements['tel_oficina'].value;
                 document.forms[source].elements['tel_particular'].value = document.forms['setdatos'].elements['tel_particular'].value;
                 document.forms[source].elements['celular'].value = document.forms['setdatos'].elements['celular'].value;     
                 document.forms[source].elements['email'].value = document.forms['setdatos'].elements['email'].value;
                 document.forms[source].elements['sector'].value = document.forms['setdatos'].elements['sector'].value;
                 document.forms[source].elements['status'].value = document.forms['setdatos'].elements['status'].value;

            }
        
         </script>
         
         <script type="text/javascript">
             document.forms['setdatos'].elements['status'].selectedIndex = <%=status_int%>;
        </script>
             
        <% 
        session.removeAttribute("mapjefe");
        session.removeAttribute("mapsup");
        session.removeAttribute("mapatp");
        session.removeAttribute("mapdir");
        session.removeAttribute("mapsize");
        %>
    </body>
</html>
