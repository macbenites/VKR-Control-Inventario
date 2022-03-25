package Modelo;

public class Modelo {

    private int id_modelo;
    private int id_marca;
    private String nom_mod;
    private String um_mod;

    public Modelo(int id_modelo, int id_marca, String nom_mod, String um_mod) {
        this.id_modelo = id_modelo;
        this.id_marca = id_marca;
        this.nom_mod = nom_mod;
        this.um_mod = um_mod;
    }

    public int getId_modelo() {
        return id_modelo;
    }

    public void setId_modelo(int id_modelo) {
        this.id_modelo = id_modelo;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public String getNom_mod() {
        return nom_mod;
    }

    public void setNom_mod(String nom_mod) {
        this.nom_mod = nom_mod;
    }

    public String getUm_mod() {
        return um_mod;
    }

    public void setUm_mod(String um_mod) {
        this.um_mod = um_mod;
    }
    
    
}
