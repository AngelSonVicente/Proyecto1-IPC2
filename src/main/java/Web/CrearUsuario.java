package Web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/CrearUsuario")
public class CrearUsuario extends HttpServlet {
    private datosBD datos;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        datos = new datosBD();

        datos.conectar();

        String TipoUsuario= request.getParameter("usuario");

    String Codigo=request.getParameter("CodigoUsuario");
    String Nombre=request.getParameter("Nombre");
    String Usuario =request.getParameter("Usuario");
    String Contra=request.getParameter("contra");
    String Correo=request.getParameter("correo");
    String Estado ="Activo";

    if(TipoUsuario.equals("tienda")){
    String CodigoTienda=request.getParameter("tienda");
    datos.CrearUsuario("tienda",Codigo,Nombre,CodigoTienda,Usuario,Contra,Correo,Estado);


    }
    if(TipoUsuario.equals("bodega")){

    datos.CrearUsuario("bodega",Codigo,Nombre,"",Usuario,Contra,Correo,Estado);


        String[] tiendas = request.getParameterValues("tiendas");

        for (int i = 0; i < tiendas.length; i++) {
            String producto = tiendas[i];
            String[] IDTiendas = producto.split(",");
          String   IDTienda = IDTiendas[0];
datos.SubirTiendasaCargo(IDTienda,Codigo);

        }

    }
    if(TipoUsuario.equals("supervisor")){

    datos.CrearUsuario("supervisor",Codigo,Nombre,"",Usuario,Contra,Correo,Estado);
    }
        response.sendRedirect("UsuarioCreado.jsp");

    }
}
