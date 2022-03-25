/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.DetalleSalida;
import Modelo.Salida;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author chris
 */
public class SalidaDAO {
    
    private Connection conn;

    public SalidaDAO() {
        conn = Conexion.conectarBD();
    }
    
    public String guardarSalida(Salida salida) {
        String res = "OK";
        String sql = "INSERT INTO salidap VALUES (?,?,?,?,?)";
        try {
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, salida.getId_salida());
            ps.setString(2, salida.getAlmacen());
            ps.setString(3, salida.getFecha_salida());
            ps.setInt(4, salida.getId_empleado());
            ps.setInt(5, salida.getId_cliente());
            if (ps.executeUpdate() != 0) {
                res = "OK";
            }
            for (DetalleSalida detalle : salida.getDetalle()) {
                if (res.equals("OK")) {
                    res = guardarDetalleSalida(detalle, salida.getId_salida());
                } else {
                    break;
                }
            }
            ps.close();
        } catch (SQLException e) {
            System.out.println("1 "+e.getMessage());
            res = e.getMessage();
        }
        return res;
    }
    
    public String guardarDetalleSalida(DetalleSalida detalle, int cod_salida) {
        String res = "";
        String sql = "INSERT INTO detalle_salida (id_salida, id_producto, stock_producto, cantidad_salida) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cod_salida);
            ps.setInt(2, detalle.getP_codigo());
            ps.setInt(3, detalle.getP_stock());
            ps.setInt(4, detalle.getP_cantidad());
            if (ps.executeUpdate() != 0) {
                res = "OK";
            }
            ps.close();
            ps = null;
        } catch (SQLException e) {
            System.out.println("2 "+e.getMessage());
            res = e.getMessage();
        }
        return res;
    }
    
    public List<DetalleSalida> getDataSalidaDetalle(int codigo) {
        String sql = "select T1.id_producto, T2.des_producto,T3.nom_marca,T4.nom_mod,T4.um_mod, T1.cantidad_salida from detalle_salida T1 inner join producto T2 on T2.id_producto=T1.id_producto inner join marca T3 on T3.id_marca=T2.id_marca inner join modelo T4 on T4.id_modelo=T2.id_modelo where T1.id_salida=" + codigo + ";";
        List<DetalleSalida> list = new ArrayList<>();
        try {
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DetalleSalida detalle = new DetalleSalida();
                detalle.setP_codigo(rs.getInt(1));
                detalle.setP_descripcion(rs.getString(2));
                detalle.setP_marca(rs.getString(3));
                detalle.setP_modelo(rs.getString(4));
                detalle.setP_um(rs.getString(5));
                detalle.setP_cantidad(rs.getInt(6));
                list.add(detalle);
            }
            ps.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
}
