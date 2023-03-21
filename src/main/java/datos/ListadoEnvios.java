package datos;

import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ListadoEnvios {
    private int IDEnvio;
    private int CodigoProducto;
    private String Nombre;
    private float CostoUnitario;
    private int Cantidad;
    private float CostoTotal;


    public int getIDEnvio() {
        return IDEnvio;
    }

    public void setIDEnvio(int IDEnvio) {
        this.IDEnvio = IDEnvio;
    }

    public int getCodigoProducto() {
        return CodigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        CodigoProducto = codigoProducto;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
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
}
