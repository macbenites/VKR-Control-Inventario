/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BR;

import Modelo.Proveedor;        
import ModeloDAO.ProveedorDAO;
import java.util.List;

/**
 *
 * @author chris
 */
public class ProveedorBR {
    
    public ProveedorBR() {
    }
    public List<Proveedor> listarProveedor(){
        return new ProveedorDAO().getProveedor();
    }
}
