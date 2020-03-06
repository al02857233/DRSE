/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.codigo.controller;
import com.controller.modelos.Conectar;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;

/**
 *
 * @author rodrigo.yanez
 */
public class supervisor {
    
    private JdbcTemplate jdbcTemplate;
           
    public  supervisor(){
        Conectar con= new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());                
    } 
    
    
    public List getsupervisor(String nombre,String ap_paterno, String ap_materno,String tel_oficina,String tel_particular, String celular,String email,String ciudad,String ct,String zona, String jefe, String status){
        String sql="EXEC DRSE.[dbo].[sp_li_supervisor] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina + "','" + tel_particular + "','" + celular + "','" + email + "','" + ciudad + "','"+ ct + "','" + zona + "','" + jefe + "','" + status + "'";
         List sup = jdbcTemplate.queryForList(sql);
        return sup;
    }
    
    public List getsupervisores(){
        String sql="EXEC DRSE.[dbo].[sp_li_supervisores]";
         List sup = jdbcTemplate.queryForList(sql);
        return sup;
    }
    
    public List getsupervisoresIdJefe(String id_jefe){
        String sql="EXEC DRSE.[dbo].[sp_li_supervisor_idjefe] '" + id_jefe + "'";
         List sup = jdbcTemplate.queryForList(sql);
        return sup;
    }
    
    public int insertsupervisor(String nombre, String ap_paterno, String ap_materno, String tel_oficina, String tel_particular, String celular, String email, String ciudad, String ct, String zona, String jefe, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_in_supervisor] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina  + "','" + tel_particular + "','" + celular + "','" + email  + "','" + ciudad + "','" + ct + "','" + zona + "','" + jefe + "','" + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
    
    public int updatesupervisor(String id_supervisor, String nombre,String ap_paterno, String ap_materno, String tel_oficina, String tel_particular, String celular, String email, String ciudad, String ct, String zona, String jefe, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_up_supervisor] '" + id_supervisor  + "','" + nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina + "','" + tel_particular + "','" + celular + "','" + email +  "','" + ciudad + "','" + ct + "','"  + zona + "','" + jefe + "','" + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
    
}
