<%@ page import="Web.datosBD" %>
<%@ page import="datos.TiendasaCargo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ListaPedido" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>


        <style>
                body {
                        background-image: url("fondo.jpg");
                        background-size: cover;
                        background-position: center;
                        background-repeat: no-repeat;
                        height: 100vh;
                        overflow: hidden;
                }    body::before {
                             content: "";
                             position: absolute;
                             top: 0%;
                             left: 0%;
                             width: 500%;
                             height: 500%;
                             background: rgba(255, 255, 255, 0.25); /* Agrega un fondo semitransparente */
                             z-index: -1;
                             filter: blur(5px); /* Agrega un efecto de desenfoque al fondo */
                     }
        </style>
</head>
<body>

<%
        String IDusuariobodega = (String) session.getAttribute("IDub");
        String supervisor = (String) session.getAttribute("supervisor");
        String Estado="Completado";
        String inicidencia=request.getParameter("ac");
        String Accion ="RecibirEnvio";

        if(inicidencia.equals("CrearEnvio")){

                Accion="ListarPedidos";

        }


        if(inicidencia.equals("Incidencia")){
                Accion="ListarIncidencia";
        }
        if(inicidencia.equals("Devoluciones")){
                Accion="ListarDevoluciones";

        }


        datosBD datos = new datosBD();
        datos.conectar();

        ArrayList<TiendasaCargo> ListaTiendas = datos.ListarTiendasaCargo(IDusuariobodega);

%>

<form method="post" action="<%=Accion%>.jsp">

        <%

                if (inicidencia.equals("CrearEnvio")) { // Si la variable mostrarAreaTexto es verdadera
        %>

        Codigo del Envio: <input type ="text" name="CodigoEnvio"/>  <%
                } // Fin del if
        %>


        <br/>
        <label>Seleccione la Tienda:</label><br/>
        <select id="select-pedidos" name="tienda">

                        <% for (TiendasaCargo Tiendas : ListaTiendas) { %>
                <option value="<%= Tiendas.getCodigoTienda() %>">
                        ID: <%= Tiendas.getCodigoTienda() %> Nombre: - <%= datos.getDato("tienda","codigo_tienda","nombre_tienda",String.valueOf(Tiendas.getCodigoTienda())) %>

                </option>
                        <% } %>
                <br/>
        </select>

                <input type="submit" value="Mostrar Detalles">

</form>


</body>
</html>
