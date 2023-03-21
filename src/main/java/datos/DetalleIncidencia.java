package datos;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DetalleIncidencia {

    private int IDIndicendia;
private int CodigoProducto;
private String NombreProducto;
private int Cantidad;
private String Motivo;
private float CostoTotal;


    public int getIDIndicendia() {
        return IDIndicendia;
    }

    public void setIDIndicendia(int IDIndicendia) {
        this.IDIndicendia = IDIndicendia;
    }

    public int getCodigoProducto() {
        return CodigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        CodigoProducto = codigoProducto;
    }

    public String getNombreProducto() {
        return NombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        NombreProducto = nombreProducto;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int cantidad) {
        Cantidad = cantidad;
    }

    public String getMotivo() {
        return Motivo;
    }

    public void setMotivo(String motivo) {
        Motivo = motivo;
    }

    public float getCostoTotal() {
        return CostoTotal;
    }

    public void setCostoTotal(float costoTotal) {
        CostoTotal = costoTotal;
    }
}
