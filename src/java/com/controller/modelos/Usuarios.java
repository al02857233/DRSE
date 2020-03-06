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
public class Usuarios {
     
    private int id_usuario;
    private String usuario,password;
    
    public Usuarios() {
    }


    public Usuarios(int id_usuario, String usuario, String password, String ap_Paterno, String ap_Materno, String fechaNacimiento, String sexo) {
        this.id_usuario = id_usuario;
        this.usuario = usuario;
        this.password = password;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

   
    
    
}
