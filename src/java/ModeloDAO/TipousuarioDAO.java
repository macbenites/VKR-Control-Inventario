package ModeloDAO;

import Config.bd;
import Modelo.Tipousuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TipousuarioDAO {

    public TipousuarioDAO() {
    }

    public List<Tipousuario> getTipoUsuario() {
        List<Tipousuario> lista = new ArrayList();

        String sql = "select * from tipousuario";

        Connection c = null;

        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lista.add(new Tipousuario(rs.getInt("id_tipousu"),
                        rs.getString("nom_tipo_usu")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(Tipousuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
