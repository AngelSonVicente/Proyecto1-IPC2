
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Producto" %>
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

<%

    // Obtener los atributos de sesión y asignarlos a variables de Java
    String id_tienda = (String) session.getAttribute("idTienda");
    String id_usuario = (String) session.getAttribute("idUsuario");
    String TipoTienda = (String) session.getAttribute("TipoTienda");

    String username = (String) session.getAttribute("username");
String estado="";

if(TipoTienda.equals("supervisada")){
estado="Pendiente";
}
if(TipoTienda.equals("normal")){
    estado="Solicitado";
}


    datosBD datos = new datosBD();
    datos.conectar();
    ArrayList<Producto> listaProductos = datos.ListarProductos();
    String codigoPedido = request.getParameter("CodigoPedido");
    String fechaPedido = request.getParameter("FechaPedido");
    float costoTotal = 0;

    datos.CrearPedido(codigoPedido,id_tienda,id_usuario,fechaPedido,String.valueOf(costoTotal),estado);
String costo="";

    String costototal = "1";
String idProducto="";



//String costo= datos.getDato("catalogo_general","codigo_producto","costo",idProducto);
//String nombre= datos.getDato("catalogo_general","codigo_producto","nombre_producto",idProducto);

    String[] productosAgregados = request.getParameterValues("carrito");

        for (int i = 0; i < productosAgregados.length; i++) {
            String producto = productosAgregados[i];
            String[] valoresProducto = producto.split(",");
            idProducto = valoresProducto[0];
            String cantidad = valoresProducto[1];

        float CostoTotal=0;
            float costoU=Float.parseFloat(datos.getDato("catalogo_general","codigo_producto","costo",idProducto));
            CostoTotal=costoU * Float.parseFloat(cantidad);

            String nombreProducto= datos.getDato("catalogo_general","codigo_producto","nombre_producto",idProducto);

            datos.SubirDetallePedido(codigoPedido,idProducto,nombreProducto,String.valueOf(costoU),cantidad,String.valueOf(CostoTotal));



        }

%>

<form method="post" action="ModuloTienda.jsp">

    <input type="submit" value="Volver al Modulo">


</form>

<p><h1>Pedido Agregado :)</h1></p>
</body>
</html>
