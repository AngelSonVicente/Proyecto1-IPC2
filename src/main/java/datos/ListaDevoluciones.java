package datos;
import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ListaDevoluciones {
    private int ID;
    private int IdEnvio;
    private int CodigoTienda;
    private int CodigoUT;
    private String FechaDevolucion;
    private float TotalDevolucion;
    private String Estado;


    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIdEnvio() {
        return IdEnvio;
    }

    public void setIdEnvio(int idEnvio) {
        IdEnvio = idEnvio;
    }

    public int getCodigoTienda() {
        return CodigoTienda;
    }

    public void setCodigoTienda(int codigoTienda) {
        CodigoTienda = codigoTienda;
    }

    public int getCodigoUT() {
        return CodigoUT;
    }

    public void setCodigoUT(int codigoUT) {
        CodigoUT = codigoUT;
    }

    public String getFechaDevolucion() {
        return FechaDevolucion;
    }

    public void setFechaDevolucion(String fechaDevolucion) {
        FechaDevolucion = fechaDevolucion;
    }

    public float getTotalDevolucion() {
        return TotalDevolucion;
    }

    public void setTotalDevolucion(float totalDevolucion) {
        TotalDevolucion = totalDevolucion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        Estado = estado;
    }
}
