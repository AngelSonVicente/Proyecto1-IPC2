<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="datos.Pedidos" %>
<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>


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

<div style="position: fixed; top: 10px; right: 10px; background-color: #FFF; border: 1px solid #CCC; padding: 5px;">
    Usuario: <span style="font-weight: bold;">${usuario}</span>
    Tipo de Tienda: <span style="font-weight: bold;">${TipoTienda}</span>
    CodigoTienda: <span style="font-weight: bold;">${idTienda}</span>

</div>

<% datosBD datos = new datosBD();
    datos.conectar();

    String bodega = (String) session.getAttribute("bodega");

    String supervisor = (String) session.getAttribute("supervisor");
            String id_tienda = (String) session.getAttribute("idTienda");
            String tienda=request.getParameter("tienda");


String Estado="Enviado";

if(supervisor.equals("Supervisor")){
Estado="Pendiente";
id_tienda="todo";

}
if(bodega.equals("bodega")){
    Estado="Solicitado";
    id_tienda=tienda;


}

    %>


<form method="post" action="MostrarPedido.jsp">

    <br/>
    <label>Seleccione el pedido:</label><br/>
    <select id="select-pedidos" name="pedidos" multiple>
        <%
            ArrayList<Pedidos> listaPedidos = datos.ListarPedidosPendientes(id_tienda,Estado); %>
        <% for (Pedidos pedido : listaPedidos) { %>
        <option value="<%= pedido.getID() %>">
            ID: <%= pedido.getID() %> Tienda- <%= pedido.getCodigoTienda() %> - Usuario:  <%= pedido.getCodigoUT() %> - Total:  <%= pedido.getTotalPedido()%>- Estado:  <%= pedido.getEstado()%>

        </option>
        <% } %>
            <br/>
    <input type="submit" value="Mostrar Detalles">

</form>
<h1><%=supervisor%></h1>
</body>
</html>

