<%@ page import="datos.Producto" %>
<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ListaPedido" %>
<%@ page import="datos.ListadoEnvios" %>
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
String CodigoIn =request.getParameter("CodigoIncidencia");
String CODEnvio=request.getParameter("pedidos");

String CodigoPedido = datos.getDato("envios","id_envio","id_pedido",CODEnvio);

String FechaIn=request.getParameter("FechaIncidencia");
String accion=request.getParameter("accion");


    ;%>

<script>
    function agregarProducto() {
        var selectProductos = document.getElementById("select-productos");
        var selectCarrito = document.getElementById("select-carrito");
        var opcionesSeleccionadas = selectProductos.selectedOptions;
        for (var i = 0; i < opcionesSeleccionadas.length; i++) {
            var opcionSeleccionada = opcionesSeleccionadas[i];
            var codigo = opcionSeleccionada.value;
            var nombre = opcionSeleccionada.dataset.nombre;
            var CostU= opcionSeleccionada.dataset.costo;
            var existencias = opcionSeleccionada.dataset.cantidadpedido;
            var cantidad = prompt("Ingrese la cantidad a agregar de " + nombre + " (máximo " + existencias + "):");
            var motivo = prompt("Ingrese el motivo");


            if (cantidad != null && cantidad != "" && !isNaN(cantidad) && parseInt(cantidad) > 0 && parseInt(cantidad) <= parseInt(existencias)) {

                var nuevaOpcion = new Option(codigo + "," + nombre + "," + cantidad + "," + motivo+ "," + CostU );
                selectCarrito.add(nuevaOpcion);
            }
        }
    }

    function eliminarProducto() {
        var selectCarrito = document.getElementById("select-carrito");
        var opcionesSeleccionadas = selectCarrito.selectedOptions;
        for (var i = 0; i < opcionesSeleccionadas.length; i++) {
            var opcionSeleccionada = opcionesSeleccionadas[i];
            selectCarrito.remove(opcionSeleccionada.index);
        }
    }




</script>

<form method="post" action="SubirIncidencia.jsp?accion=<%=accion%>.jsp">

    <input type="hidden" name="CodigoPedido" id="<%=CODEnvio%>">

    <input type="hidden" name="CodigoInci" id="<%=CodigoIn%>">
    <input type="hidden" name="FechaInci" id="<%=FechaIn%>">





    <input type="hidden" name="costoTotal" id="costo-total-input">


    <br/>
    <label>Seleccione los productos:</label><br/>
    <select id="select-productos" name="productos[]" multiple>

        <%
            ArrayList<ListadoEnvios> listaEnvio = datos.ListarEnvios(CODEnvio); %>
        <% for (ListadoEnvios envio : listaEnvio) { %>
        <option value="<%= envio.getCodigoProducto() %>" data-nombre="<%= envio.getNombre() %>" data-cantidadpedido="<%=envio.getCantidad()%>"  data-costo="<%=envio.getCostoUnitario()%>" >
            - <%= envio.getIDEnvio() %> -Codigo Producto: <%= envio.getCodigoProducto() %> - Nombre:  <%= envio.getNombre() %> -Cantidad: <%=envio.getCantidad()%> - Costo <%=envio.getCostoUnitario()%>
        </option>

        <% } %>
    </select>
    <br>
    <button type="button" onclick="agregarProducto()">Agregar producto</button>
    <button type="button" onclick="eliminarProducto()">Eliminar producto</button>
    <br>
    <label>Productos seleccionados:</label> <br/>
    <select id="select-carrito" name="carrito" multiple></select>
    <br>

    <input type="hidden" name="CI" value="<%=CodigoIn%>">
    <input type="hidden" name="FI" value="<%=FechaIn%>">
    <input type="hidden" name="CP" value="<%=CodigoPedido%>">

    <input type="submit" value="Agregar pedido">

    <label>Costo total: </label><span id="costo-total"></span>
</form>



</body>
</html>
