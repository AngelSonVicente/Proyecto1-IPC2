package Web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
    @WebServlet("/ActualizarUsuario")

public class ActualizarUsario extends HttpServlet {
        private datosBD datos;

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            datos = new datosBD();

            datos.conectar();

            String TipoUsuario = request.getParameter("TipoDeUsuario");
            String Codigo = request.getParameter("CodigoUsuario");
            String Nombre = request.getParameter("Nombre");
            String Usuario = request.getParameter("Usuario");
            String Correo = request.getParameter("correo");
            String Contra = request.getParameter("contra");
            String CodigoTiendaUT = request.getParameter("CodigoTienda");
            String Estado = request.getParameter("estado");


            if (TipoUsuario.equals("tienda")) {
                datos.ActualizarUsuarioTienda("tienda", Codigo, Nombre, CodigoTiendaUT, Usuario, Contra, Correo, Estado);
            }
            if (TipoUsuario.equals("supervisor")) {

                datos.ActualizarUsuarioTienda("supervisor", Codigo, Nombre, CodigoTiendaUT, Usuario, Contra, Correo, Estado);

            }
            if (TipoUsuario.equals("bodega")) {

                datos.ActualizarUsuarioTienda(TipoUsuario, Codigo, Nombre, CodigoTiendaUT, Usuario, Contra, Correo, Estado);


            }
                response.sendRedirect("DatosActualizados.jsp");
        }
    }