/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author cabre
 */
public class ConexionDB {

    private static final String URL = "jdbc:mysql://localhost:3306/colegioDB";
    private static final String USUARIO = "root";
    private static final String CONTRASEÑA = "root";

    public static Connection conectar() {
        try {
            Connection conexion = DriverManager.getConnection(URL, USUARIO, CONTRASEÑA);
            System.out.println("Conexion exitosa a la base de datos");
            return conexion;

        } catch (Exception e) {
            System.out.println("Error de conexion con la base de datos: " + e.getMessage());
            return null;
        }
    }

    public static void cerrarConexion(Connection conexion) {
        try {
            if (conexion != null) {
                conexion.close();
                System.out.println("Conexión cerrada correctamente.");
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }

}
