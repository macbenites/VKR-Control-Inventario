package ModeloDAO;

import Config.bd;
import Modelo.Distrito;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DistritoDAO {

    public DistritoDAO() {
    }

    public List<Distrito> getDistritos() {
        List<Distrito> lista = new ArrayList();

        String sql = "select * from distritos";

        Connection c = null;

        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lista.add(new Distrito(rs.getInt("IdDistritos"),
                        rs.getInt("IdProvincia"),
                        rs.getString("Distrito")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(Distrito.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
