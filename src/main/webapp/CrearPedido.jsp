<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="datos.Producto" %>
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

</div>

<% datosBD datos = new datosBD();
    datos.conectar();%>


<script>
    function agregarProducto() {
        var selectProductos = document.getElementById("select-productos");
        var selectCarrito = document.getElementById("select-carrito");
        var opcionesSeleccionadas = selectProductos.selectedOptions;
        for (var i = 0; i < opcionesSeleccionadas.length; i++) {
            var opcionSeleccionada = opcionesSeleccionadas[i];
            var codigo = opcionSeleccionada.value;
            var nombre = opcionSeleccionada.dataset.nombre;
            var costoUnitario = opcionSeleccionada.dataset.costo;
            var existencias = opcionSeleccionada.dataset.existencias;
            var cantidad = prompt("Ingrese la cantidad a agregar de " + nombre + " (máximo " + existencias + "):");
            if (cantidad != null && cantidad != "" && !isNaN(cantidad) && parseInt(cantidad) > 0 && parseInt(cantidad) <= parseInt(existencias)) {
                var costoTotal = costoUnitario * cantidad;
                var nuevaOpcion = new Option(codigo + "," + nombre + "," + costoUnitario + "," + cantidad + "," + costoTotal, codigo + "," + cantidad);
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

    function obtenerCostoTotal() {
        var selectCarrito = document.getElementById("select-carrito");
        var costoTotal = 0;
        for (var i = 0; i < selectCarrito.options.length; i++) {
            var opcion = selectCarrito.options[i];
            var codigoCantidad = opcion.value.split(":");
            var cantidad = parseInt(codigoCantidad[1]);
            var costoUnitario = parseFloat(opcion.dataset.costo);
            costoTotal += (costoUnitario * cantidad);
        }
        return costoTotal;
    }
    function actualizarCostoTotal() {
        var costoTotal = obtenerCostoTotal();
        document.getElementById("costo-total").innerText = costoTotal;
        document.getElementById("input-costo-total").value = costoTotal;
    }

    setInterval(actualizarCostoTotal, 1000);


</script>

<form method="post" action="agregar_pedido.jsp">

    <input type="hidden" name="costoTotal" id="costo-total-input">
    Codigo del pedido: <input type ="text" name="CodigoPedido"/>
  fecha del pedido: <input type ="date" name="FechaPedido"/>


    <br/>
    <label>Seleccione los productos:</label><br/>
    <select id="select-productos" name="productos[]" multiple>


        <% ArrayList<Producto> listaProductos = datos.ListarProductos(); %>
        <% for (Producto producto : listaProductos) { %>
        <% float costoTotal = (float) (producto.getCosto() * producto.getExistencias()); %>
        <option value="<%= producto.getCodigo() %>" data-nombre="<%= producto.getNombre() %>" data-costo="<%= producto.getCosto() %>" data-existencias="<%= producto.getExistencias() %>">
            <%= producto.getCodigo() %> - <%= producto.getNombre() %> - costo:  <%= producto.getCosto() %> - Existencias  <%= producto.getExistencias()%>
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
    <input type="submit" value="Agregar pedido">

    <label>Costo total: </label><span id="costo-total"></span>
</form>

</body>
</html>

