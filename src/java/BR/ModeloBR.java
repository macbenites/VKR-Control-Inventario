package BR;

import Modelo.Modelo;
import ModeloDAO.ModeloDAO;
import java.util.List;

public class ModeloBR {

    public ModeloBR() {
    }

    public List<Modelo> listarModelos() {
        return new ModeloDAO().getModelos();
    }
}
