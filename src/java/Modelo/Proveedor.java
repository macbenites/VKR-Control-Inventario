/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
/**
 *
 * @author chris
 */
public class Proveedor {
    private int id_proveedor;
    private String raz_soc_prove;
    private long ruc_prove;
    private int dep_prove;
    private int pro_prove;
    private int dis_prove;
    private String dir_prove;
    private int tel_prove;

    public Proveedor() {
    }

    public Proveedor(int id_proveedor, String raz_soc_prove, long ruc_prove, int dep_prove, int pro_prove, int dis_prove, String dir_prove, int tel_prove) {
        this.id_proveedor = id_proveedor;
        this.raz_soc_prove = raz_soc_prove;
        this.ruc_prove = ruc_prove;
        this.dep_prove = dep_prove;
        this.pro_prove = pro_prove;
        this.dis_prove = dis_prove;
        this.dir_prove = dir_prove;
        this.tel_prove = tel_prove;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public String getRaz_soc_prove() {
        return raz_soc_prove;
    }

    public void setRaz_soc_prove(String raz_soc_prove) {
        this.raz_soc_prove = raz_soc_prove;
    }

    public long getRuc_prove() {
        return ruc_prove;
    }

    public void setRuc_prove(long ruc_prove) {
        this.ruc_prove = ruc_prove;
    }

    public int getDep_prove() {
        return dep_prove;
    }

    public void setDep_prove(int dep_prove) {
        this.dep_prove = dep_prove;
    }

    public int getPro_prove() {
        return pro_prove;
    }

    public void setPro_prove(int pro_prove) {
        this.pro_prove = pro_prove;
    }

    public int getDis_prove() {
        return dis_prove;
    }

    public void setDis_prove(int dis_prove) {
        this.dis_prove = dis_prove;
    }

    public String getDir_prove() {
        return dir_prove;
    }

    public void setDir_prove(String dir_prove) {
        this.dir_prove = dir_prove;
    }

    public int getTel_prove() {
        return tel_prove;
    }

    public void setTel_prove(int tel_prove) {
        this.tel_prove = tel_prove;
    }

    
    
    
    
}
