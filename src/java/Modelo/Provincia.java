package Modelo;

public class Provincia {
    private int IdProvincia;
    private int IdDepartamento;
    private String Provincia;

    public Provincia() {
    }

    public Provincia(int IdProvincia, int IdDepartamento, String Provincia) {
        this.IdProvincia = IdProvincia;
        this.IdDepartamento = IdDepartamento;
        this.Provincia = Provincia;
    }

    public int getIdProvincia() {
        return IdProvincia;
    }

    public void setIdProvincia(int IdProvincia) {
        this.IdProvincia = IdProvincia;
    }

    public int getIdDepartamento() {
        return IdDepartamento;
    }

    public void setIdDepartamento(int IdDepartamento) {
        this.IdDepartamento = IdDepartamento;
    }

    public String getProvincia() {
        return Provincia;
    }

    public void setProvincia(String Provincia) {
        this.Provincia = Provincia;
    }
    
    
}
