package Config;

import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class bd {

    private Connection con = null;
    private ResultSet data = null;
    private Statement consulta = null;

    public bd() {
    }

  
     public Connection getMysql() {
        /*Connection c = null;*/
        String usr = "root";
        String pwd = "1234";
        String url = "jdbc:mysql://localhost:3307/pswad?useTimezone=true&serverTimezone=UTC";
      
        try {
            DriverManager.registerDriver(new Driver());
            con = DriverManager.getConnection(url, usr, pwd);
            this.consulta = con.createStatement();
//            if (con != null) {
//                System.out.println("Conexión a base de datos OK");
//            }
        } catch (SQLException ex) {
            Logger.getLogger(bd.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    public Connection getCon() {
        return con;
    }
    
    public ResultSet getDatos(String com) {
        try {
            this.getMysql();
            this.data = this.consulta.executeQuery(com);
        } catch (Exception e) {
            System.out.println("Error de la consulta " + e.getMessage());
        }
        return data;
    }

    public void desconectar() {
        try {
            if (con != null) {
                this.con.close();
            }
        } catch (Exception e) {
            System.out.println("Error de desconexion " + e.getMessage());
        }
    }
}
