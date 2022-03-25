package Modelo;

public class Marca {

    private int id_marca;
    private String nom_mar;

    public Marca() {
    }

    public Marca(int id_marca, String nom_mar) {
        this.id_marca = id_marca;
        this.nom_mar = nom_mar;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public String getNom_mar() {
        return nom_mar;
    }

    public void setNom_mar(String nom_mar) {
        this.nom_mar = nom_mar;
    }   
}