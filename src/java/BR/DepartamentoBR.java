package BR;

import Modelo.Departamento;
import ModeloDAO.DepartamentoDAO;
import java.util.List;

public class DepartamentoBR {

    public DepartamentoBR() {
    }
    
    public List<Departamento> listarDepartamentos(){
        return new DepartamentoDAO().getDepartamentos();
    }
}
