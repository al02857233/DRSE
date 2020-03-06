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
public class atp {
    
    private JdbcTemplate jdbcTemplate;
        
    public  atp(){
        Conectar con= new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());                
    } 
    
     public List getatp(String nombre,String ap_paterno, String ap_materno,String tel_oficina,String tel_particular, String celular,String email,String supervisor,String status){
        String sql="EXEC DRSE.[dbo].[sp_li_atp] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina + "','" + tel_particular + "','" + celular + "','" + email + "','" + supervisor + "','" + status + "'";
         List atps = jdbcTemplate.queryForList(sql);
        return atps;
    }
    
    public List getatps(){
        String sql="EXEC DRSE.[dbo].[sp_li_atps]";
         List atps = jdbcTemplate.queryForList(sql);
        return atps;
    }
    
    public List getatpsIdsup(String ids_sup){
        String sql="EXEC DRSE.[dbo].[sp_li_atps_idsup] '" + ids_sup + "'" ;
         List atps = jdbcTemplate.queryForList(sql);
        return atps;
    }
    
    
    
    public int insertatp(String nombre, String ap_paterno, String ap_materno, String tel_oficina, String tel_particular, String celular, String email, String supervisor, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_in_atp] '"+ nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina  + "','" + tel_particular + "','" + celular + "','" + email  + "','" + supervisor + "','" + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
    
    public int updateatp(String id_atp, String nombre,String ap_paterno, String ap_materno, String tel_oficina, String tel_particular, String celular, String email, String supervisor,String status,String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_up_atp] '" + id_atp  + "','" + nombre  + "','" + ap_paterno + "','" + ap_materno + "','" + tel_oficina + "','" + tel_particular + "','" + celular + "','" + email +  "','" + supervisor + "','" + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
}
