/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codigo.controller;
import com.controller.modelos.Conectar;
import org.springframework.jdbc.core.JdbcTemplate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.List;


/**
 *
 * @author Prueba
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet{
    
    //connection
    private JdbcTemplate jdbcTemplate;
        
    public  login(){
        Conectar con= new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());                
    }
    
     public String login(String user, String psw){
        String sql="EXEC DRSE.[dbo].[sp_se_login] '"+ user  + "','" + psw + "'";
        String login = this.jdbcTemplate.queryForObject(sql, String.class);
        //String Access = login.get(0).toString();
        return login;
    }
     
          public Map getUserName(String user){
        String sql="EXEC DRSE.[dbo].[sp_se_user] '"+ user  + "'";
         Map<String, Object> map = jdbcTemplate.queryForMap(sql);
         return map;
    }
      
      public String getrol(String user){
        String sql="EXEC DRSE.[dbo].[sp_se_rol] '"+ user  + "'";
        return this.jdbcTemplate.queryForObject(sql, String.class);
         
    }
      
        public int insertuser(String nombre,String ap_paterno, String ap_materno,String usuario,String password,String rol, String status, String usr , String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_in_usuario] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + usuario + "','" + password + "','" + rol + "','" + status + "','" + usr+  "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);
         
    }
        
        public List getdatos(String nombre, String ap_paterno, String ap_materno, String usuario, String password, String rol, String status){
           String sql="EXEC DRSE.[dbo].[sp_se_datos] '" + nombre + "','" + ap_paterno + "','" + ap_materno + "','" + usuario + "','" + password + "','" + rol + "','" + status + "'" ;
           List retMap = jdbcTemplate.queryForList(sql);
           return retMap;
       }
    
       public int updateuser(String id_usuario, String nombre,String ap_paterno,String ap_materno, String psw, String rol, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_up_usuario] '"+ id_usuario  + "','" + nombre + "','" + ap_paterno + "','" + ap_materno + "','" + psw + "','" + rol +  "','" + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);
       }
       
       public int updatepsw(String id_usuario, String password, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_up_psw] '"+ id_usuario  + "','" + password + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);
       }
       //session.getAttribute("usr").toString(), request.getParameter("password"), request.getParameter("conf_password"));
       
       
       
     
     //httpSession
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession(false);
            String usr = request.getParameter("usr");
           sesion.setAttribute("usr", usr);
           request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
     

}
