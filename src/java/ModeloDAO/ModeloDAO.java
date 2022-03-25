package ModeloDAO;

import Config.bd;
import Modelo.Modelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModeloDAO {

    public ModeloDAO() {
    }

    public List<Modelo> getModelos() {
        List<Modelo> lista = new ArrayList();

        String sql = "select * from modelo";

        Connection c = null;

        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lista.add(new Modelo(rs.getInt("id_modelo"),
                        rs.getInt("id_marca"),
                        rs.getString("nom_mod"),
                        rs.getString("um_mod")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(Modelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
