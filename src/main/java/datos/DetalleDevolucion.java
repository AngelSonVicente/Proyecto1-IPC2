package datos;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DetalleDevolucion {

    private int IdDevolucion;
    private int CodigoProducto;
    private float CostoUnitario;
    private int Cantidad;
    private float CostoTotal;
    private String Motivo;


    public int getIdDevolucion() {
        return IdDevolucion;
    }

    public void setIdDevolucion(int idDevolucion) {
        IdDevolucion = idDevolucion;
    }

    public int getCodigoProducto() {
        return CodigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        CodigoProducto = codigoProducto;
    }

    public float getCostoUnitario() {
        return CostoUnitario;
    }

    public void setCostoUnitario(float costoUnitario) {
        CostoUnitario = costoUnitario;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int cantidad) {
        Cantidad = cantidad;
    }

    public float getCostoTotal() {
        return CostoTotal;
    }

    public void setCostoTotal(float costoTotal) {
        CostoTotal = costoTotal;
    }

    public String getMotivo() {
        return Motivo;
    }

    public void setMotivo(String motivo) {
        Motivo = motivo;
    }
}
