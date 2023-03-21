<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ListaPedido" %>
<%@ page import="datos.Producto" %>
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
<h1>Pedido Aceptado</h1>

<%
    String id_tienda = (String) session.getAttribute("idTienda");
    String supervisor = (String) session.getAttribute("supervisor");
    String Estado="Completado";

    datosBD datos = new datosBD();
    datos.conectar();

    String codigoPedido = request.getParameter("CodigoPedido");


    if(supervisor.equals("Supervisor")){
Estado="Solicitado";

    datos.Actualizardato("pedidos","estado",Estado,"id_pedido",codigoPedido);

    }else {

        datos.Actualizardato("pedidos", "estado", Estado, "id_pedido", codigoPedido);


        //actualizr catalogo general

        ArrayList<ListaPedido> listaPedidos = datos.DetallePedido(codigoPedido);


        for (ListaPedido pedido : listaPedidos) {
            int codigoP = pedido.getCodigoProducto();

            int ExistenciaCatalogo = Integer.parseInt(datos.getDato("catalogo_general", "codigo_producto", "existencias", String.valueOf(codigoP)));
            int cant = pedido.getCantidad();
            int ExistenciaActualizada = ExistenciaCatalogo - cant;
// subir al catalogo de la tienda
            datos.Actualizardato("catalogo_general", "existencias", String.valueOf(ExistenciaActualizada), "codigo_producto", String.valueOf(codigoP));
            datos.SubirProductoaTienda(id_tienda, String.valueOf(codigoP), cant);

        }
    }

%>

<form method="post" action="ModuloTienda.jsp">

    <input type="submit" value="Volver al Modulo">


</form>



</body>
</html>
