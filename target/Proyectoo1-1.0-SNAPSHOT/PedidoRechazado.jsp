<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ListaPedido" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PedidoRechazado</title>

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
    String id_tienda = (String) session.getAttribute("idTienda");
    String supervisor = (String) session.getAttribute("supervisor");
    String Estado="Completado";
    String CODpedido=request.getParameter("CodigoPedido");
String Mottivo=request.getParameter("Motivo");

    datosBD datos = new datosBD();
    datos.conectar();
    String codigoPedido = request.getParameter("CodigoPedido");

        Estado="Rechazado";

  datos.Actualizardato("pedidos","estado",Estado,"id_pedido",codigoPedido);




       datos.Actualizardato("pedidos","motivo_rechazo",Mottivo,"id_pedido",codigoPedido);
%>
<h1>Pedido Rechazado :(</h1>
</body>
</html>
