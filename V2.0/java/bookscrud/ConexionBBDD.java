/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookscrud;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alejandro
 */

/*
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookscrud", "root", "");
            Statement s = conexion.createStatement();
*/
public class ConexionBBDD {

    private static String servidor = "jdbc:mysql://localhost";
    private static String puerto = "3306";
    private static String nombre = "bookscrud2";
    private static String usuario = "root";
    private static String contrasena = "";
    
    public static Statement conecta() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionBBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            Connection conexion;
            conexion = (Connection) DriverManager.getConnection(servidor + ":" + puerto + "/" + nombre, usuario, contrasena);
            Statement s = conexion.createStatement();
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
