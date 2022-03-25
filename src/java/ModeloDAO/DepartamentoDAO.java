package ModeloDAO;

import Config.bd;
import Modelo.Departamento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DepartamentoDAO {

    public DepartamentoDAO() {
    }

    public List<Departamento> getDepartamentos() {

        List<Departamento> lista = new ArrayList();

        String sql = "select * from departamentos";

        Connection c = null;

        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lista.add(new Departamento(rs.getInt("IdDepartamento"),
                        rs.getString("Departamento")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(Departamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
