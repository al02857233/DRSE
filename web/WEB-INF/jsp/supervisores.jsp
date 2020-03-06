<%-- 
    Document   : supervisores
    Created on : 18-feb-2020, 13:52:39
    Author     : rodrigo.yanez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.codigo.lists.lists"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Supervisores .:</title>
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
            String ciudad = "";
            int ciudad_int = 0;
            String ct = "";
            String zona = "";
            String jefe = "";
            int jefe_int = 0;
            String status = "";
            int status_int = 0;
            String table_sup = "display:none;";            
            String table_atp = "display:none;";          
            String table_dir = "display:none;";
            
           
            try{
                if(session.getAttribute("user")  == null){
                     response.sendRedirect("login.htm");   
                }
                
                if(Integer.parseInt(session.getAttribute("mapsize").toString()) > 1){
                    msj = "Se Encontro mas de un registro con su busqueda";
                    color = "black";
                    table_sup = "";  
                }
                else{
                    nombre = session.getAttribute("nombre").toString();
                    ap_paterno = session.getAttribute("ap_paterno").toString();
                    ap_materno = session.getAttribute("ap_materno").toString();
                    tel_oficina = session.getAttribute("tel_oficina").toString();
                    tel_particular = session.getAttribute("tel_particular").toString();
                    celular = session.getAttribute("celular").toString();
                    email = session.getAttribute("email").toString();
                    ciudad = session.getAttribute("ciudad").toString();
                    if(ciudad.matches("Ocotlan")){ciudad_int = 1;}
                    ct = session.getAttribute("ct").toString();
                    zona = session.getAttribute("zona").toString();
                    jefe = session.getAttribute("jefe").toString();
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
                    session.removeAttribute("ct");
                    session.removeAttribute("zona");
                    session.removeAttribute("jefe");
                    session.removeAttribute("status");
                    session.removeAttribute("mapsup");
                    table_sup = "display:none";    
                    table_atp = "";    
                    table_dir = "";  
                }
                
                   
            }
            catch(Exception e){
            }
            
             // Jefes
            List<Map<String, Object>> jefes = null; 
             try{
                lists l = new lists();
                 jefes = l.getjefes();
                 
                  //traer dir_id
             for(int i=0;i<jefes.size();i++){
                 if(jefe.matches(jefes.get(i).get("nombre").toString())){
                     jefe_int = i + 1;
                 }
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
                                    <tr>
                                        <td colspan="2" style="text-align: right" >Ciudad:</td>
                                        <td>
                                            <select id="ciudad" name="ciudad">
                                            <option></option>
                                            <option>Ocotlan</option>
                                            </select>
                                        </td>
                                    </tr>
                                     <tr align = "center">
                                        <td colspan="2" style="text-align: right" >CT:</td>
                                        <td><input type="text" name="ct" value="<%=ct%>" /></td>
                                    </tr>
                                    <tr align = "center">
                                        <td colspan="2" style="text-align: right" >Zona:</td>
                                        <td><input type="text" name="zona" value="<%=zona%>" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: right" >Jefe de Sector:</td>
                                        <td>
                                            <select id="jefe" name="jefe">
                                                <option></option>
                                                <c:forEach items="<%=jefes%>" var="list">
                                                        <option>
                                                            <c:out value="${list.nombre}" />
                                                        </option>
                                                </c:forEach>
                                            </select>
                                        </td>
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
                        <form name="inssupervisor" action="insertarsup.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('inssupervisor')">
                            <input type="submit" value="Alta Supervisor" name="inssupervisor" />
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
                                        <td><input type="text" name="ciudad" value=""</td>
                                    </tr>
                                     <tr>
                                        <td><input type="text" name="ct" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="zona" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="jefe" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form name="getsupervisor" action="getsupervisor.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('getsupervisor')">
                        <input type="submit" value="Traer Supervisor" name="getsupervisor"/>
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
                                        <td><input type="text" name="ciudad" value="" /></td>
                                    </tr>
                                     <tr>
                                        <td><input type="text" name="ct" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="zona" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="jefe" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="status" value="" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </td>
                    <td>
                        <form name="modsupervisor" action="modsupervisor.htm" method="POST" style="alignment-adjust: central" onsubmit="parsedatos('modsupervisor')">
                        <input type="submit" value="Modificar Supervisor" name="modsupervisor"/>
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
                                        <td><input type="text" name="ciudad" value="" /></td>
                                    </tr>
                                     <tr>
                                        <td><input type="text" name="ct" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="zona" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" name="jefe" value="" /></td>
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
                 msj = "Nombre de Supervisor Requerido, Favor de Capturarlo";
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
              else if(request.getParameter("msj").matches("Emptycity")){
                  msj = "Ciudad Requerida, Favor de Capturarla";
                }
              else if(request.getParameter("msj").matches("Emptyct")){
                  msj = "CT Requerido, Favor de Capturarlo";
                }
              else if(request.getParameter("msj").matches("Emptyzn")){
                  msj = "Zona Requerida, Favor de Capturarla";
                }
              else if(request.getParameter("msj").matches("Emptyjefe")){
                  msj = "Jefe de Sector Requerido, Favor de Capturarla";
                }
              else if(request.getParameter("msj").matches("Emptysta")){
                  msj = "Estatus Requerido, Favor de Capturarlo";
                }
             else if(request.getParameter("msj").matches("Error")){
                   if(request.getParameter("e").contains("Index: 0, Size: 0")){
                       msj = "No se Encontró Registro" ;
                       color = "black";
                       session.removeAttribute("mapsup");
                   }
                   else if(request.getParameter("e").contains("NullPointerException")){
                       msj = "Supervisor Invalido, Favor de apuntar al registro correcto" ;
                       session.removeAttribute("mapsup");
                   }
                   else
                        msj = "Ocurrió un Error favor de Contactar al Departamento de Sistemas y proporcionar este error " + "</br></br>" +  request.getParameter("e") ;
                }
              else if(request.getParameter("msj").matches("InsSuccess")){
                  msj = "Supervisor Insertado Correctamente" ;
                }
               else if(request.getParameter("msj").matches("Invalidir")){
                  msj = "Supervisor Invalido" ;
                }
              else if(request.getParameter("msj").matches("UpSuccess")){
                  msj = "Supervisor Actualizado Correctamente" ;
                }
              else if(request.getParameter("msj").matches("Exists")){
                  msj = "Verifique el Nombre, Supervisor ya existe" ;
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
                <td>Jefe de Sector</td>
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
                    <td><c:out value="${list.jefe}" /></td>
                    <td><c:out value="${list.status}" /></td>
                  </tr>
                </c:forEach>
            </table>
                
            <div style="text-align: center; <%=table_atp%>" ><h2>ATPs</h2></div>
             <table border="1" align="center" class="tabladatos" style="<%=table_atp%>">
             <link rel="stylesheet" href="<c:url value="/img/table.css"/>" />
                <thead>
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
                 document.forms[source].elements['tel_oficina'].value = document.forms['setdatos'].elements['tel_oficina'].value;
                 document.forms[source].elements['tel_particular'].value = document.forms['setdatos'].elements['tel_particular'].value;
                 document.forms[source].elements['celular'].value = document.forms['setdatos'].elements['celular'].value;     
                 document.forms[source].elements['email'].value = document.forms['setdatos'].elements['email'].value;
                 document.forms[source].elements['ciudad'].value = document.forms['setdatos'].elements['ciudad'].value;
                 document.forms[source].elements['ct'].value = document.forms['setdatos'].elements['ct'].value;
                 document.forms[source].elements['zona'].value = document.forms['setdatos'].elements['zona'].value;
                 document.forms[source].elements['jefe'].value = document.forms['setdatos'].elements['jefe'].value;
                 document.forms[source].elements['status'].value = document.forms['setdatos'].elements['status'].value;

            }
        
         </script>
         
         <script type="text/javascript">
             document.forms['setdatos'].elements['status'].selectedIndex = <%=status_int%>;
             document.forms['setdatos'].elements['ciudad'].selectedIndex = <%=ciudad_int%>;
             document.forms['setdatos'].elements['jefe'].selectedIndex = <%=jefe_int%>;
        </script>
             
        <% 
        session.removeAttribute("mapsup");
        session.removeAttribute("mapatp");
        session.removeAttribute("mapdir");
        session.removeAttribute("mapsize");
        %>
    </body>
</html>
