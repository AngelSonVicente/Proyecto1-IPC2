<%@ page import="Web.datosBD" %>
<%@ page import="datos.TiendasaCargo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ListaDevoluciones" %>
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
    String IdTienda=request.getParameter("tienda");

    datosBD datos = new datosBD();
    datos.conectar();

    ArrayList<ListaDevoluciones> listain = datos.ListarDevoluciones(IdTienda,"Activo");

%>


<form method="post" action="SolucionDevolucion.jsp">

    <br/>
    <label>Seleccione la Tienda:</label><br/>
    <select id="select-pedidos" name="incidencia">

        <% for (ListaDevoluciones devolucion : listain) { %>
        <option value="<%= devolucion.getID() %>">
            ID: <%= devolucion.getID() %> ID Envio: - <%=devolucion.getIdEnvio() %>   ID Tienda: - <%=devolucion.getCodigoTienda() %>   Usuario: - <%=devolucion.getCodigoUT() %> Fecha de Incidencia: - <%=devolucion.getFechaDevolucion() %>  Costo: - <%=devolucion.getTotalDevolucion() %> Estado: - <%=devolucion.getEstado() %>

        </option>
        <% } %>
        <br/>
    </select>

    <input type="submit" value="Mostrar Detalles">

</form>
</body>
</html>
