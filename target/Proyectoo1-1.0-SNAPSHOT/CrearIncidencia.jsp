<%@ page import="datos.Pedidos" %>
<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ListaEnvios" %>

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
String accion=request.getParameter("accion");

%>


<form method="post" action="HacerIncidencia.jsp?accion=<%=accion%>">
    fecha de <%=accion%>: <input type ="date" name="FechaIncidencia"/>
    Codigo de <%=accion%>: <input type ="text" name="CodigoIncidencia"/>



    <br/>
    <label>Seleccione el Envio:</label><br/>
    <select id="select-pedidos" name="pedidos" multiple>
            <%

            String id_tienda = (String) session.getAttribute("idTienda");
            ArrayList<ListaEnvios> listaEnvios = datos.ListarEnvios(id_tienda,"Despachado");



%>
            <% for (ListaEnvios envio : listaEnvios) { %>
        <option value="<%= envio.getID() %>">
            ID Envio: <%= envio.getID() %> ID Pedido- <%= envio.getIDPedido() %>  ID Tieda- <%= envio.getCodigoTienda() %> - Usuario:  <%= envio.getCodigoUsuario() %> - Total:  <%= envio.getTotal()%>- Estado:  <%= envio.getEstado()%>

        </option>
            <% } %>
        <br/>

    <input type="submit" value="Crear <%=accion%>">

</form>


</body>
</html>
