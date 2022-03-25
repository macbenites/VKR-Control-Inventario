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
public class TipoDocumento {
    private int id_tipodoc;
    private String nom_tipo_doc;

    public TipoDocumento() {
    }

    public TipoDocumento(int id_tipodoc, String nom_tipo_doc) {
        this.id_tipodoc = id_tipodoc;
        this.nom_tipo_doc = nom_tipo_doc;
    }

    public int getId_tipodoc() {
        return id_tipodoc;
    }

    public void setId_tipodoc(int id_tipodoc) {
        this.id_tipodoc = id_tipodoc;
    }

    public String getNom_tipo_doc() {
        return nom_tipo_doc;
    }

    public void setNom_tipo_doc(String nom_tipo_doc) {
        this.nom_tipo_doc = nom_tipo_doc;
    }
}
