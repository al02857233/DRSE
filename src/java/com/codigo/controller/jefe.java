/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codigo.controller;
import com.controller.modelos.Conectar;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author rodrigo.yanez
 */
public class jefe {
    
     private JdbcTemplate jdbcTemplate;
        
    public  jefe(){
        Conectar con= new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());                
    } 
    
     public List getjefe(String nombre,String ap_paterno, String ap_materno,String tel_oficina,String tel_particular, String celular,String email, String sector, String status){
        String sql="EXEC DRSE.[dbo].[sp_li_jefe] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina + "','" + tel_particular + "','" + celular + "','" + email + "','"  + sector + "','" + status + "'";
         List jefe = jdbcTemplate.queryForList(sql);
        return jefe;
    }
    
    public List getjefes(){
        String sql="EXEC DRSE.[dbo].[sp_li_jefes]";
         List jefe = jdbcTemplate.queryForList(sql);
        return jefe;
    }
    
    public int insertjefe(String nombre, String ap_paterno, String ap_materno, String tel_oficina, String tel_particular, String celular, String email, String sector, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_in_jefe] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina  + "','" + tel_particular + "','" + celular + "','" + email  + "','" + sector  + "','" + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
    
    public int updatejefe(String id_atp, String nombre,String ap_paterno, String ap_materno, String tel_oficina, String tel_particular, String celular, String email,String sector, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_up_jefe] '" + id_atp  + "','" + nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina + "','" + tel_particular + "','" + celular + "','" + email +  "','" + sector  + "','" + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
    
}
