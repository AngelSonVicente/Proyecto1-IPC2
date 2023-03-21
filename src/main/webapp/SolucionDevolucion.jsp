<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.DetalleDevolucion" %>
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

%>

<%
  ArrayList<DetalleDevolucion> Detalles = datos.DetalleDevoluciones(CodigoIncidencia); %>

<table>
  <thead>
  <tr>
    <th>Codigo Producto</th>
    <th>Costo Unitario</th>
    <th>Cantidad</th>
    <th>Costo Total</th>
    <th>Motivo</th>

  </tr>
  </thead>
  <tbody>
  <% for (DetalleDevolucion devolucion : Detalles) { %>
  <tr>
    <td><%= devolucion.getCodigoProducto() %></td>
    <td><%= devolucion.getCostoUnitario() %></td>
    <td><%=devolucion.getCantidad()%></td>
    <td><%=devolucion.getCostoTotal() %></td>
    <td><%= devolucion.getMotivo() %></td>

  </tr>
  <% } %>
  </tbody>
</table>

<form method="post" action="AceptarORechazarDevolucion.jsp">
  <br/>
  <br/>

  <input type="hidden" name="CodigoDevolucion" value="<%=CodigoIncidencia%>">
  <input type="hidden" name="accion" value="Aceptar">
  <input type="submit" value="Aceptar Devolucion">

</form>

<form method="post" action="AceptarORechazarDevolucion.jsp">


  <input type="hidden" name="CodigoDevolucion" value="<%=CodigoIncidencia%>">
  <input type="hidden" name="accion" value="Rechazar">
  <input type="submit" value="RechazarDevolucion">
</form>




</body>
</html>
