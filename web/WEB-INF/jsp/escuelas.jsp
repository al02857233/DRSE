<%-- 
    Document   : escuelas
    Created on : 04-feb-2020, 13:52:57
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
        <title>:. Escuelas .:</title>
    </head>
    <body>
         <%
            String msj = "";
            String color = "red";
            String nombre = "";
            String cct = "";
            String nivel = "";
            int nivel_int = 0;
            String turno = "";
            int turno_int = 0;
            String calleynum = "";
            String colonia = "";
            String cp = "";
            String ciudad = "";
            int ciudad_int = 0;
            String telefono = "";
            String email = "";
            String director = "";
            int dir_int = 0;
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
                    cct = session.getAttribute("cct").toString();
                    nivel = session.getAttribute("nivel").toString();
                    if(nivel.matches("Preescolar")){nivel_int = 1;}
                    if(nivel.matches("Primaria")){nivel_int = 2;}
                    if(nivel.matches("Secundaria")){nivel_int = 3;}
                    turno = session.getAttribute("turno").toString();
                    if(turno.matches("Matutino")){turno_int = 1;}
                    if(turno.matches("Vespertino")){turno_int = 2;}
                    calleynum = session.getAttribute("calleynum").toString();
                    colonia = session.getAttribute("colonia").toString();
                    cp = session.getAttribute("cp").toString();
                    ciudad = session.getAttribute("ciudad").toString();
                    if(ciudad.matches("Ocotlan")){ciudad_int = 1;}
                    telefono = session.getAttribute("telefono").toString();
                    email = session.getAttribute("email").toString();
                    director = session.getAttribute("director").toString();
                    status = session.getAttribute("status").toString();
                    if(status.matches("Activa")){status_int = 1;}
                    if(status.matches("Inactiva")){status_int = 2;}
                    session.removeAttribute("nombre");
                    session.removeAttribute("cct");
                    session.removeAttribute("nivel");
                    session.removeAttribute("turno");
                    session.removeAttribute("calleynum");
                    session.removeAttribute("colonia");
                    session.removeAttribute("cp");
                    session.removeAttribute("ciudad");
                    session.removeAttribute("telefono");
                    session.removeAttribute("email");
                    session.removeAttribute("director");
                    session.removeAttribute("status");
                    session.removeAttribute("map");
                }
                
                   
            }
            catch(Exception e){
            }
            
            // Directores
            List<Map<String, Object>> dir = null; 
             try{
                director l = new director();
                 dir = l.getdirectores();
             }
                  
                catch(Exception e){
                   
                }
             
             //traer dir_id
             for(int i=0;i<dir.size();i++){
                 if(director.matches(dir.get(i).get("nombre").toString())){
                     dir_int = i + 1;
                 }
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
                                    <tr>
                                        <td style="text-align: right" >Nombre:</td>
                                        <td><input type="text" name="nombre" id="nombre" value="<%=nombre%>" /></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >CCT:</td>
                                        <td><input type="text" name="cct" value="<%=cct%>" /></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Nivel:</td>
                                        <td>
                                            <select id="nivel" name="nivel">
                                            <option></option>
                                            <option>Preescolar</option>
                                            <option>Primaria</option>
                                            <option>Secundaria</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Turno:</td>
                                        <td>
                                            <select id="turno" name="turno">
                                             <option></option>
                                            <option>Matutino</option>
                                            <option>Vespertino</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Calle y Num:</td>
                                        <td><input type="text" name="calle" value="<%=calleynum%>" /></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Colonia:</td>
                                        <td><input type="text" name="colonia" value="<%=colonia%>" /></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >CP:</td>
                                        <td><input type="text" name="cp" value="<%=cp%>" /></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Ciudad:</td>
                                        <td>
                                            <select id="ciudad" name="ciudad">
                                            <option></option>
                                            <option>Ocotlan</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Director:</td>
                                            <td>
                                                <select id="director" name="director">
                                                    <option></option>
                                                    <c:forEach items="<%=dir%>" var="list">
                                                        <option>
                                                            <c:out value="${list.nombre}" />
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Telefono:</td>
                                        <td><input type="text" name="telefono" value="<%=telefono%>" maxlength="10" onkeypress="Onlynumbers(event)" /></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Email:</td>
                                        <td><input type="text" name="email" value="<%=email%>" /></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" >Estatus:</td>
                                        <td>
                                            <select id="status" name="status">
                                                <option></option>
                                                <option>Activa</option>
                                                <option>Inactiva</option>
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
                        <form name="insescuela" action="insertaresc.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('insescuela')">
                            <input type="submit" value="Alta Escuela" name="insescuela" />
                            <table border="0" hidden="true">
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="nombre" id="nombre" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="cct" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="nivel" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="turno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="calle" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="colonia" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="cp" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ciudad" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="director" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="telefono" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="status" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form name="getescuela" action="getescuela.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('getescuela')">
                        <input type="submit" value="Traer Escuela" name="getescuela"/>
                        <table border="0" hidden="true">
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="nombre" id="nombre" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="cct" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="nivel" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="turno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="calle" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="colonia" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="cp" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ciudad" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="director" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="telefono" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="status" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form name="modescuela" action="modescuela.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('modescuela')">
                        <input type="submit" value="Modificar Escuela" name="modescuela"/>
                        <table border="0" hidden="true">
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="nombre" id="nombre" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="cct" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="nivel" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="turno" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="calle" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="colonia" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="cp" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="ciudad" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="director" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="telefono" value="" maxlength="10"</td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="email" value="" /></td>
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
                 msj = "Nombre de Escuela Requerido, Favor de Capturarlo";
               }
              else if(request.getParameter("msj").matches("Emptycct")){
                  msj = "CCT Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyst")){
                  msj = "Calle Requerida, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyniv")){
                  msj = "Nivel Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptytur")){
                  msj = "Turno Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyct")){
                  msj = "Ciudad Requerida, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptysta")){
                  msj = "Estatus Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptycol")){
                  msj = "Colonia Requerida, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptycp")){
                  msj = "Codigo Postal requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptytel")){
                  msj = "Telefono Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptymail")){
                  msj = "Email Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptydir")){
                  msj = "Director Requerido, Favor de Capturarlo";
                }
               else if(request.getParameter("msj").matches("Error")){
                   if(request.getParameter("e").contains("Index: 0, Size: 0")){
                       msj = "No se Encontró Registro" ;
                       color = "black";
                       session.removeAttribute("map");
                   }
                   else if(request.getParameter("e").contains("NullPointerException")){
                       msj = "Escuela Invalida, Favor de apuntar al registro correcto" ;
                       session.removeAttribute("map");
                   }
                   else if(request.getParameter("e").contains("UNIQUE KEY"))
                       msj = "Verifique el CCT, ya esta asignado" ;
                   else
                        msj = "Ocurrió un Error favor de Contactar al Departamento de Sistemas y proporcionar este error " + "</br></br>" +  request.getParameter("e") ;
                }
              else if(request.getParameter("msj").matches("InsSuccess")){
                  msj = "Escuela Insertada Correctamente" ;
                }
               else if(request.getParameter("msj").matches("Invalidesc")){
                  msj = "Escuela Invalida" ;
                }
              else if(request.getParameter("msj").matches("UpSuccess")){
                  msj = "Escuela Actualizada Correctamente" ;
                }
              else if(request.getParameter("msj").matches("Exists")){
                  msj = "Escuela Ya Existe" ;
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
                <td>CCT</td>
                <td>Nivel</td>
                <td>Turno</td>
                <td>Calle y Num</td>
                <td>Colonia</td>
                <td>CP</td>
                <td>Ciudad</td>
                <td>Telefono</td>
                <td>Email</td>
                <td>Director</td>
                <td>Estatus</td>
                </thead>
                <c:forEach items="${map}" var="list">
                  <tr>
                    <td><c:out value="${list.nombre}" /></td>
                    <td><c:out value="${list.cct}" /></td>
                    <td><c:out value="${list.nivel}" /></td>
                    <td><c:out value="${list.turno}" /></td>
                    <td><c:out value="${list.calleynum}" /></td>
                    <td><c:out value="${list.colonia}" /></td>
                    <td><c:out value="${list.cp}" /></td>
                    <td><c:out value="${list.ciudad}" /></td>
                    <td><c:out value="${list.telefono}" /></td>
                    <td><c:out value="${list.email}" /></td>
                    <td><c:out value="${list.director}" /></td>
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
                 document.forms[source].elements['cct'].value = document.forms['setdatos'].elements['cct'].value;
                 document.forms[source].elements['nivel'].value = document.forms['setdatos'].elements['nivel'].value;
                 document.forms[source].elements['turno'].value = document.forms['setdatos'].elements['turno'].value;
                 document.forms[source].elements['calle'].value = document.forms['setdatos'].elements['calle'].value;
                 document.forms[source].elements['colonia'].value = document.forms['setdatos'].elements['colonia'].value;
                 document.forms[source].elements['cp'].value = document.forms['setdatos'].elements['cp'].value;
                 document.forms[source].elements['ciudad'].value = document.forms['setdatos'].elements['ciudad'].value;
                 document.forms[source].elements['director'].value = document.forms['setdatos'].elements['director'].value;
                 document.forms[source].elements['telefono'].value = document.forms['setdatos'].elements['telefono'].value;
                 document.forms[source].elements['email'].value = document.forms['setdatos'].elements['email'].value;
                 document.forms[source].elements['status'].value = document.forms['setdatos'].elements['status'].value;

            }
        
         </script>
         
         <script type="text/javascript">
             document.forms['setdatos'].elements['nivel'].selectedIndex = <%=nivel_int%>;
             document.forms['setdatos'].elements['turno'].selectedIndex = <%=turno_int%>;
             document.forms['setdatos'].elements['ciudad'].selectedIndex = <%=ciudad_int%>;
             document.forms['setdatos'].elements['status'].selectedIndex = <%=status_int%>;
             document.forms['setdatos'].elements['director'].selectedIndex = <%=dir_int%>;
        </script>
             
        <% 
        session.removeAttribute("map");
        session.removeAttribute("mapsize");
        %>
    </body>
</html>

