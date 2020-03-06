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
public class escuela {
     private JdbcTemplate jdbcTemplate;
        
    public  escuela(){
        Conectar con= new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());                
    }
    
    public int insertescuela(String nombre,String cct, String nivel,String turno,String calle,String colonia,String cp,String ciudad,String telefono, String email, String director, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_in_escuela] '"+ nombre  + "','" + cct + "','" + nivel + "','" + turno + "','" + calle + "','" + colonia + "','" + cp + "','" + ciudad + "','" + telefono + "','" + email + "','" + director + "','" + status + "','" + host + "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
    
    public List getescuela(String nombre,String cct, String nivel,String turno,String calle,String colonia,String cp,String ciudad,String telefono, String email, String director, String status){
        String sql="EXEC DRSE.[dbo].[sp_li_escuela] '"+ nombre  + "','" + cct + "','" + nivel + "','" + turno + "','" + calle + "','" + colonia + "','" + cp + "','" + ciudad + "','" + telefono + "','" + email + "','" + director + "','" + status + "'";
         List Escuelas = jdbcTemplate.queryForList(sql);
        return Escuelas;
    }
    
    public int updatescuela(String id_escuela, String nombre,String cct, String nivel,String turno,String calle,String colonia,String cp,String ciudad,String telefono, String email, String director, String status, String host){
        String sql="declare @RESULT int EXEC DRSE.[dbo].[sp_up_escuela] '" + id_escuela  + "','" + nombre  + "','" + cct + "','" + nivel + "','" + turno + "','" + calle + "','" + colonia + "','" + cp + "','" + ciudad + "','" + telefono + "','" + email + "','" + director + "','" + status + "','" + host +  "',@RESULT OUTPUT select @RESULT";
        return this.jdbcTemplate.queryForObject(sql, Integer.class);      
    }
    
}
