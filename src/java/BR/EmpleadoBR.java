package BR;

import Modelo.Empleado;
import ModeloDAO.EmpleadoDAO;
import java.util.List;

public class EmpleadoBR {
    
    public EmpleadoBR() {
    }
    public List<Empleado> listarEmpleados(){
        return new EmpleadoDAO().getEmpleados();
    }
}
