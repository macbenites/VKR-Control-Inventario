package BR;

import Modelo.Marca;
import ModeloDAO.MarcaDAO;
import java.util.List;

public class MarcaBR {

    public MarcaBR() {
    }

    public List<Marca> listarMarcas() {
        return new MarcaDAO().getMarcas();
    }
}
