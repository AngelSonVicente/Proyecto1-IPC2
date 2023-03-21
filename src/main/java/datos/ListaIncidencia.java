package datos;
import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ListaIncidencia {
 private int ID;
 private int IdEnvio;
 private int CodigoTienda;
 private  int CodigoUT;
 private String FechaIncidencia;
 private String estado;
 private String Solucion;


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

    public String getFechaIncidencia() {
        return FechaIncidencia;
    }

    public void setFechaIncidencia(String fechaIncidencia) {
        FechaIncidencia = fechaIncidencia;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getSolucion() {
        return Solucion;
    }

    public void setSolucion(String solucion) {
        Solucion = solucion;
    }
}
