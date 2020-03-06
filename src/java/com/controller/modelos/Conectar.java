/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.modelos;

/**
 *
 * @author Prueba
 */
import org.springframework.jdbc.datasource.DriverManagerDataSource;
/**
 *
 * @author Prueba
 */
public class Conectar {
    

    
    public DriverManagerDataSource conectar(){
       DriverManagerDataSource datasource = new DriverManagerDataSource();
       datasource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       datasource.setUrl("jdbc:sqlserver://localhost\\DRSE;databaseName=DRSE");
       datasource.setUsername("sa");
       datasource.setPassword("Drseoco2020");
       return datasource;
    }
    
}
