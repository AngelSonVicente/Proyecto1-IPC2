package datos;
import lombok.*;

@ToString
@NoArgsConstructor @AllArgsConstructor
public class Usuarios {
    String TipoUsuario;
    int Codigo;
    String Nombre;
    int CodigoTiendaut;
    String Usuario;
    String Contrasena;
    String Correo;
    String Estado;


    public String getTipoUsuario() {
        return TipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        TipoUsuario = tipoUsuario;
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int codigo) {
        Codigo = codigo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public int getCodigoTiendaut() {
        return CodigoTiendaut;
    }

    public void setCodigoTiendaut(int codigoTiendaut) {
        CodigoTiendaut = codigoTiendaut;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String usuario) {
        Usuario = usuario;
    }

    public String getContrasena() {
        return Contrasena;
    }

    public void setContrasena(String contrasena) {
        Contrasena = contrasena;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String correo) {
        Correo = correo;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        Estado = estado;
    }
}
