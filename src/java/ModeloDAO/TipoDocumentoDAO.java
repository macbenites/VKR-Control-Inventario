/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.bd;
import Modelo.TipoDocumento;
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
public class TipoDocumentoDAO {

    public TipoDocumentoDAO() {
    }
    public List<TipoDocumento> getTipoDocumento(){
        List<TipoDocumento> lista = new ArrayList();
        
        String sql = "select * from tipodocumento";
        
        Connection c = null;
        
        try {
            c = new bd().getMysql();
            PreparedStatement pst = c.prepareCall(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                lista.add(new TipoDocumento(rs.getInt("id_tipodoc"),
                                        rs.getString("nom_tipo_doc")));
            }
            c.close();
            c = null;
        } catch (SQLException ex) {
            Logger.getLogger(TipoDocumento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
