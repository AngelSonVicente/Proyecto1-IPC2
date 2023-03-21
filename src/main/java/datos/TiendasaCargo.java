package datos;
import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class TiendasaCargo {
    private int CodigoTienda;
    private int CodigoUsuarioBodega;


    public int getCodigoTienda() {
        return CodigoTienda;
    }

    public void setCodigoTienda(int codigoTienda) {
        CodigoTienda = codigoTienda;
    }

    public int getCodigoUsuarioBodega() {
        return CodigoUsuarioBodega;
    }

    public void setCodigoUsuarioBodega(int codigoUsuarioBodega) {
        CodigoUsuarioBodega = codigoUsuarioBodega;
    }
}


