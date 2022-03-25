package ModeloDAO;

import Config.bd;
import Modelo.Marca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MarcaDAO {

    public MarcaDAO() {
    }

    public List<Marca> getMarcas() {
        List<Marca> lista = new ArrayList();

        String sql = "select id_marca, nom_marca from marca";

        Connection c = null;

        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lista.add(new Marca(rs.getInt("id_marca"),
                        rs.getString("nom_marca")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(Marca.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
