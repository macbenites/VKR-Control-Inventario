package Modelo;

import java.util.List;

public class Ingreso {

    private int id_ingreso;
    private String almacen;
    private String fecha_ingreso;
    private int id_empleado;
    private int id_proveedor;

    private List<DetalleIngreso> detalle;

    public Ingreso() {
    }

    public int getId_ingreso() {
        return id_ingreso;
    }

    public void setId_ingreso(int id_ingreso) {
        this.id_ingreso = id_ingreso;
    }

    public String getAlmacen() {
        return almacen;
    }

    public void setAlmacen(String almacen) {
        this.almacen = almacen;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public List<DetalleIngreso> getDetalle() {
        return detalle;
    }

    public void setDetalle(List<DetalleIngreso> detalle) {
        this.detalle = detalle;
    }
    
    

}
