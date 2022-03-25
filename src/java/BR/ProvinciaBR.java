/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BR;

import Modelo.Provincia;
import ModeloDAO.ProvinciaDAO;
import java.util.List;

/**
 *
 * @author chris
 */
public class ProvinciaBR {

    public ProvinciaBR() {
    }
    public List<Provincia> listarProvincias(){
        return new ProvinciaDAO().getProvincias();
    }
}
