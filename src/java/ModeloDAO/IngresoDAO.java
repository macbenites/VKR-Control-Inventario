package ModeloDAO;

import Config.Conexion;
import Modelo.DetalleIngreso;
import Modelo.Ingreso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IngresoDAO {

    private Connection conn;

    public IngresoDAO() {

        conn = Conexion.conectarBD();

    }

    public String guardarIngreso(Ingreso ingreso) {
        String res = "OK";
        String sql = "INSERT INTO ingresop VALUES (?,?,?,?,?)";
        try {
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, ingreso.getId_ingreso());
            ps.setString(2, ingreso.getAlmacen());
            ps.setString(3, ingreso.getFecha_ingreso());
            ps.setInt(4, ingreso.getId_empleado());
            ps.setInt(5, ingreso.getId_proveedor());
            if (ps.executeUpdate() != 0) {
                res = "OK";
            }
            for (DetalleIngreso detalle : ingreso.getDetalle()) {
                if (res.equals("OK")) {
                    res = guardarDetalleIngreso(detalle, ingreso.getId_ingreso());
                } else {
                    break;
                }
            }
            ps.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            res = e.getMessage();
        }
        return res;
    }

    public String guardarDetalleIngreso(DetalleIngreso detalle, int cod_ingreso) {
        String res = "";
        String sql = "INSERT INTO detalle_ingreso (id_ingreso, id_producto, stock_producto, cantidad_ingreso) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cod_ingreso);
            ps.setInt(2, detalle.getP_codigo());
            ps.setInt(3, detalle.getP_stock());
            ps.setInt(4, detalle.getP_cantidad());
            if (ps.executeUpdate() != 0) {
                res = "OK";
            }
            ps.close();
            ps = null;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            res = e.getMessage();
        }
        return res;
    }

    public List<DetalleIngreso> getDataIngresoDetalle(int codigo) {
        String sql = "select T1.id_producto, T2.des_producto,T3.nom_marca,T4.nom_mod,T4.um_mod, T1.cantidad_ingreso from detalle_ingreso T1 inner join producto T2 on T2.id_producto=T1.id_producto inner join marca T3 on T3.id_marca=T2.id_marca inner join modelo T4 on T4.id_modelo=T2.id_modelo where T1.id_ingreso=" + codigo + ";";
        List<DetalleIngreso> list = new ArrayList<>();
        try {
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DetalleIngreso detalle = new DetalleIngreso();
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
