/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.bd;
import Modelo.Proveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author chris
 */
public class ProveedorDAO {

    public ProveedorDAO() {
    }

    public List<Proveedor> getProveedor() {
        List<Proveedor> lista = new ArrayList();

        String sql = "select * from proveedores";

        Connection c = null;

        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                lista.add(new Proveedor(rs.getInt("id_proveedor"),
                                            rs.getString("razon_social_prove"),
                                            rs.getLong("ruc_prove"),
                                            rs.getInt("IdDepartamento"),
                                            rs.getInt("IdProvincia"),
                                            rs.getInt("IdDistrito"),
                                            rs.getString("dir_prove"),
                                            rs.getInt("tele_prove")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(Proveedor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
