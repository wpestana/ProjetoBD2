/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Welington
 */
public class UsuarioDAO {
    static final String nomeDoEsquema = "usuario";
    static final String usuarioBanco = "admin";
    static final String senhaBanco = "1234";

    Usuario usuario = new Usuario();
    Usuario usuarioNovo = new Usuario();//este usuario é apenas para para atualizar um usuario
    ConectaBanco conexao = new ConectaBanco();
    Connection c = conexao.getConnection(usuarioBanco, senhaBanco);
    
    public boolean consultaTodos() {
        try {
//            PreparedStatement p = c.prepareStatement("Select * from" + nomeDoEsquema + ".usuario;");            
                PreparedStatement p = c.prepareStatement("Select * from " + nomeDoEsquema );
            ResultSet r = p.executeQuery();
            while (r.next()){
                System.out.println(" user "+r.getString("nome"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }    
}
