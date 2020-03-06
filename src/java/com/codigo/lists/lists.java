/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codigo.lists;
import com.codigo.controller.jefe;
import java.util.List;



/**
 *
 * @author rodrigo.yanez
 */
public class lists {
    
    public List getjefes(){
        jefe l = new jefe();
         List jefe = l.getjefes();
         
        return jefe;
    }
    
}
