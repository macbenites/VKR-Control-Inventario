package BR;

import Modelo.Tipousuario;
import ModeloDAO.TipousuarioDAO;
import java.util.List;

public class TipousuarioBR {

    public TipousuarioBR() {
    }

    public List<Tipousuario> listarTipoUsuarios() {
        return new TipousuarioDAO().getTipoUsuario();
    }
}
