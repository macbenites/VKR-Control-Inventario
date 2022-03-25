package ModeloDAO;

import Config.bd;
import Modelo.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmpleadoDAO {

    public EmpleadoDAO() {
    }

    public List<Empleado> getEmpleados() {
        List<Empleado> lista = new ArrayList();

        String sql = "SELECT id_empleado, nom_emp FROM empleado";

        Connection c = null;

        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lista.add(new Empleado(rs.getInt("id_empleado"),
                        rs.getString("nom_emp")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(Empleado.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

}
