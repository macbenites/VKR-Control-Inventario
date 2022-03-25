package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private static String bd = "pswad";
    private static String user = "root";
    private static String pass = "1234";
    private static String link = "jdbc:mysql://localhost:3307/" + bd + "?useTimezone=true&serverTimezone=UTC";

    public static Connection conectarBD() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(link, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return conn;
    }

}
