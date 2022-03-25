/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BR;

import Modelo.TipoDocumento;
import ModeloDAO.TipoDocumentoDAO;
import java.util.List;

/**
 *
 * @author chris
 */
public class TipoDocumentoBR {

    public TipoDocumentoBR() {
    }
    public List<TipoDocumento> listarTipoDocumento(){
        return new TipoDocumentoDAO().getTipoDocumento();
    }
}
