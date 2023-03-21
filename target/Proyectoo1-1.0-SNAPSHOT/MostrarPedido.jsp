<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="datos.Pedidos" %>
<%@ page import="Web.datosBD" %>
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
<% datosBD datos = new datosBD();
    datos.conectar();
    String supervisor = (String) session.getAttribute("supervisor");
String CODpedido=request.getParameter("pedidos");
    String bodega = (String) session.getAttribute("bodega");

%>

<%
    ArrayList<ListaPedido> listaPedidos = datos.DetallePedido(CODpedido); %>

<table>
    <thead>
    <tr>
        <th>ID Pedido</th>
        <th>Codigo Producto</th>
        <th>Nombre Del Producto</th>
        <th>Costo Unitario</th>
        <th>Cantidad</th>
        <th>Costo Total</th>

    </tr>
    </thead>
    <tbody>
    <% for (ListaPedido pedido : listaPedidos) { %>
    <tr>
        <td><%= pedido.getIdPedido() %></td>
        <td><%= pedido.getCodigoProducto() %></td>
        <td><%=pedido.getNombreProducto()%></td>
        <td><%= pedido.getCostoU() %></td>
        <td><%= pedido.getCantidad() %></td>
        <td><%=pedido.getCostoTotal() %></td>

    </tr>
    <% } %>
    </tbody>
</table>

<form method="post" action="AceptarPedido.jsp?">

    <input type="hidden" name="CodigoPedido" value="<%=CODpedido%>">
    <input type="submit" value="Aceptar Pedido">
</form>



<% if (supervisor.equals("Supervisor") || bodega.equals("bodega")) { %>



<form method="post" action="RechazarPedido.jsp">

    <input type="hidden" name="CodigoPedido" value="<%=CODpedido%>">
    <input type="submit" value="Rechazar Pedido">
</form>

<% } %>



</body>
</html>
