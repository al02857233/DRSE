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
public class director {
    private JdbcTemplate jdbcTemplate;
        
    public  director(){
        Conectar con= new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());                
    } 
    
    public List getdirector(String nombre,String ap_paterno, String ap_materno,String telefono,String email,String rfc,String status){
        String sql="EXEC DRSE.[dbo].[sp_li_director] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + telefono + "','" + email + "','" + rfc + "','" + status + "'";
         List dirs = jdbcTemplate.queryForList(sql);
        return dirs;
    }
    
    public List getdirectores(){
        String sql="EXEC DRSE.[dbo].[sp_li_directores]";
         List dirs = jdbcTemplate.queryForList(sql);
        return dirs;
    }
    
    public List getdirsIdsup(String ids_sup){
        String sql="EXEC DRSE.[dbo].[sp_li_directores_idsup] '" + ids_sup + "'" ;
         List atps = jdbcTemplate.queryForList(sql);
        return atps;
    }
    
    public int insertdirector(String nombre, String ap_paterno, String ap_materno, String telefono, String email,  String rfc ,String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_in_director] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + telefono + "','" + email  + "','" + rfc + "','" + status + "','" + host +"',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
    
    public int updatedirector(String id_director, String nombre,String ap_paterno, String ap_materno, String telefono, String email,String rfc, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_up_director] '" + id_director  + "','" + nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + telefono + "','" + email +  "','" + rfc + "','"  + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
}

