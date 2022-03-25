package Modelo;

public class Distrito {
    private int IdDistritos;
    private int IdProvincia;
    private String Distrito;

    public Distrito() {
    }

    public Distrito(int IdDistritos, int IdProvincia, String Distrito) {
        this.IdDistritos = IdDistritos;
        this.IdProvincia = IdProvincia;
        this.Distrito = Distrito;
    }

    public int getIdDistritos() {
        return IdDistritos;
    }

    public void setIdDistritos(int IdDistritos) {
        this.IdDistritos = IdDistritos;
    }

    public int getIdProvincia() {
        return IdProvincia;
    }

    public void setIdProvincia(int IdProvincia) {
        this.IdProvincia = IdProvincia;
    }

    public String getDistrito() {
        return Distrito;
    }

    public void setDistrito(String Distrito) {
        this.Distrito = Distrito;
    }
    
    
    
}
