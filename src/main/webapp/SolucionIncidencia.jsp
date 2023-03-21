<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ListaPedido" %>
<%@ page import="datos.DetalleIncidencia" %>

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
    String CodigoIncidencia=request.getParameter("incidencia");
    String bodega = (String) session.getAttribute("bodega");

%>

<%
    ArrayList<DetalleIncidencia> Detalles = datos.DetalleIncidencias(CodigoIncidencia); %>

<table>
    <thead>
    <tr>
        <th>Codigo Producto</th>
        <th>Nombre Del Producto</th>
        <th>Cantidad</th>
        <th>Motivo</th>
        <th>Costo Total</th>

    </tr>
    </thead>
    <tbody>
    <% for (DetalleIncidencia incidencia : Detalles) { %>
    <tr>
        <td><%= incidencia.getCodigoProducto() %></td>
        <td><%= incidencia.getNombreProducto() %></td>
        <td><%=incidencia.getCantidad()%></td>
        <td><%= incidencia.getMotivo() %></td>
        <td><%=incidencia.getCostoTotal() %></td>

    </tr>
    <% } %>
    </tbody>
</table>
<form method="post" action="SubirSolucionIncidencia.jsp">

<br/>
<br/>
Solucion De La Incidencia: <input type ="text" name="Solucion"/>
<br/>
    <input type="hidden" name="CodigoIncidencia" value="<%=CodigoIncidencia%>">
    <input type="submit" value="SolucionarPedido">
</form>

</body>
</html>
