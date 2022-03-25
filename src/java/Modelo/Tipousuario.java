package Modelo;

public class Tipousuario {
    private int id_tipousu;
    private String nom_tipo_usu;

    public Tipousuario() {
    }

    public Tipousuario(int id_tipousu, String nom_tipo_usu) {
        this.id_tipousu = id_tipousu;
        this.nom_tipo_usu = nom_tipo_usu;
    }

    public int getId_tipousu() {
        return id_tipousu;
    }

    public void setId_tipousu(int id_tipousu) {
        this.id_tipousu = id_tipousu;
    }

    public String getNom_tipo_usu() {
        return nom_tipo_usu;
    }

    public void setNom_tipo_usu(String nom_tipo_usu) {
        this.nom_tipo_usu = nom_tipo_usu;
    }    
}
