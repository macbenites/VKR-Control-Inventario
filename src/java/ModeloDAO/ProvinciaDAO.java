package ModeloDAO;

import Config.bd;
import Modelo.Provincia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProvinciaDAO {

    public ProvinciaDAO() {
    }

    public List<Provincia> getProvincias() {
        List<Provincia> lista = new ArrayList();

        String sql = "SELECT * FROM Provincias";

        Connection c = null;

        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lista.add(new Provincia(rs.getInt("IdProvincia"),
                        rs.getInt("IdDepartamento"),
                        rs.getString("Provincia")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(Provincia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
