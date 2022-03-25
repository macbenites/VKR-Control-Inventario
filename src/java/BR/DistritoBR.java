package BR;

import Modelo.Distrito;
import ModeloDAO.DistritoDAO;
import java.util.List;

public class DistritoBR {

    public DistritoBR() {
    }
    public List<Distrito> listarDistritos(){
        return new DistritoDAO().getDistritos();
    }
}
