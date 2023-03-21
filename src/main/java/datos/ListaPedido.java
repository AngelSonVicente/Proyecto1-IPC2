package datos;


import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class ListaPedido {
private int IdPedido;
private int CodigoProducto;
private  String NombreProducto;
private float CostoU;
private int cantidad;
private float CostoTotal;


    public int getIdPedido() {
        return IdPedido;
    }

    public void setIdPedido(int idPedido) {
        IdPedido = idPedido;
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

    public float getCostoU() {
        return CostoU;
    }

    public void setCostoU(float costoU) {
        CostoU = costoU;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getCostoTotal() {
        return CostoTotal;
    }

    public void setCostoTotal(float costoTotal) {
        CostoTotal = costoTotal;
    }
}
