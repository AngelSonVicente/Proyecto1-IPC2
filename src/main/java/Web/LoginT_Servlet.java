package Web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
@WebServlet("/LoginT_Servlet")
public class LoginT_Servlet extends HttpServlet {


    private datosBD datos;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        datos = new datosBD();
        datos.conectar();

        String usuarioT=request.getParameter("usuarioT");
        String passwordT=request.getParameter("passwordT");
        String Nombre="";
       String TipoTienda="";
       String CodigoTienda="";
       String  IDsuarioTienda="";

        var out = response.getWriter();
        HttpSession session = request.getSession();
        Connection connection = (Connection) session.getAttribute("conexion");

        if(datos.isLoginUT("usuario_tienda","usuario_ut",usuarioT,passwordT)){
            Nombre= datos.getDato("usuario_tienda","usuario_ut","nombre_ut",usuarioT);
           CodigoTienda= datos.getDato("usuario_tienda","usuario_ut","codigo_tienda",usuarioT);
           TipoTienda= datos.getDato("tienda","codigo_tienda","tipo_tienda",CodigoTienda);
            IDsuarioTienda= datos.getDato("usuario_tienda","usuario_ut","codigo_ut",usuarioT);

            session.setAttribute("usuario", Nombre);
            session.setAttribute("TipoTienda", TipoTienda );
            //parametros que van a la base
            session.setAttribute("idUsuario", IDsuarioTienda );
            session.setAttribute("idTienda", CodigoTienda);
            session.setAttribute("bodega","no");
            session.setAttribute("supervisor","No");

            response.sendRedirect("ModuloTienda.jsp");


        }
        else{

            if(datos.isLoginUT("usuario_supervisor","usuario_us",usuarioT,passwordT)){

                Nombre=datos.getDato("usuario_supervisor","usuario_us","nombre_us",usuarioT);
                String idUS= datos.getDato("usuario_supervisor","usuario_us","codigo_us",usuarioT);
                session.setAttribute("usuario",Nombre);
                session.setAttribute("IdUsuarioSupervisor",idUS);
                session.setAttribute("supervisor","Supervisor");
                session.setAttribute("bodega","no");
                session.setAttribute("TipoTienda", "TipoTienda ");


                response.sendRedirect("RecibirEnvio.jsp");






            }else{

                if(datos.isLoginUT("usuario_bodega","usuario_ub",usuarioT,passwordT)){
                    session.setAttribute("TipoTienda", "TipoTienda" );

                    Nombre=datos.getDato("usuario_bodega","usuario_ub","nombre_ub",usuarioT);
                    String UDub=datos.getDato("usuario_bodega","usuario_ub","codigo_ub",usuarioT);
                    session.setAttribute("usuario",Nombre);
                    session.setAttribute("IDub",UDub);
                    session.setAttribute("bodega","bodega");
                    session.setAttribute("supervisor","No");
                    response.sendRedirect("ModuloBodega.jsp");



                }else{
                    if(datos.isLoginUT("usuario_administrador","usuario_ua",usuarioT,passwordT)){
                        Nombre=datos.getDato("usuario_administrador","usuario_ua","nombre_ua",usuarioT);
                        String IDua=datos.getDato("usuario_administrador","usuario_ua","codigo_ua",usuarioT);
                        session.setAttribute("TipoTienda", "TipoTienda" );

                        session.setAttribute("usuario",Nombre);
                        session.setAttribute("IDua",IDua);
                        response.sendRedirect("ModuloAdministracion.jsp");


                    }else{


            request.setAttribute("error", "Usuario o contraseña Incorrecta");
            request.getRequestDispatcher("Login-Tienda.jsp").forward(request,response);

                    }






                }





            }




        }



    }
}
