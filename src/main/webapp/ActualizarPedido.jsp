<%@ page import="Web.datosBD" %>
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

  // Obtener los atributos de sesión y asignarlos a variables de Java
  String bodega = (String) session.getAttribute("bodega");
  String id_tienda = (String) session.getAttribute("idTienda");
  String id_usuario = (String) session.getAttribute("idUsuario");
  String TipoTienda = (String) session.getAttribute("TipoTienda");
  String IDUB = (String) session.getAttribute("IDub");




  String username = (String) session.getAttribute("username");
  String estado="";
if(bodega.equals("bodega")){
  estado="Despachado";

}
  if(TipoTienda.equals("supervisada")){
    estado="Pendiente";
  }
  if(TipoTienda.equals("normal")){
    estado="Solicitado";
  }


  datosBD datos = new datosBD();
  datos.conectar();

  String codigoPedido = request.getParameter("CodigoPedido");
  String fechaPedido = request.getParameter("FechaPedido");
  String CodigoEnvio=request.getParameter("CE");
  float costoTotal = 0;


  String CT=datos.getDato("pedidos","id_pedido","codigo_tienda",codigoPedido);

  if(bodega.equals("bodega")){

    datos.EliminarProductos(codigoPedido);
   datos.CrearEnvio(CodigoEnvio,codigoPedido,CT,IDUB,fechaPedido,fechaPedido,"0","Despachado");

  }else{

    datos.EliminarProductos(codigoPedido);
  }


 // datos.CrearPedido(codigoPedido,id_tienda,id_usuario,fechaPedido,String.valueOf(costoTotal),estado);


  String costo="";

  String costototal = "1";
  String idProducto="";



//String costo= datos.getDato("catalogo_general","codigo_producto","costo",idProducto);
//String nombre= datos.getDato("catalogo_general","codigo_producto","nombre_producto",idProducto);
String cantidad="";
  String[] productosAgregados = request.getParameterValues("carrito");

  for (int i = 0; i < productosAgregados.length; i++) {
    String producto = productosAgregados[i];
    String[] valoresProducto = producto.split(",");
    idProducto = valoresProducto[0];
    cantidad = valoresProducto[1];

    float CostoTotal=0;
    float costoU=Float.parseFloat(datos.getDato("catalogo_general","codigo_producto","costo",idProducto));
    CostoTotal=costoU * Float.parseFloat(cantidad);

    String nombreProducto= datos.getDato("catalogo_general","codigo_producto","nombre_producto",idProducto);
if(bodega.equals("bodega")){
    datos.SubirDetallePedido(codigoPedido,idProducto,nombreProducto,String.valueOf(costoU),cantidad,String.valueOf(CostoTotal));
  datos.SubirDetalleEnvio(CodigoEnvio,idProducto,nombreProducto,String.valueOf(costoU),cantidad,String.valueOf(CostoTotal));
}else{
    datos.SubirDetallePedido(codigoPedido,idProducto,nombreProducto,String.valueOf(costoU),cantidad,String.valueOf(CostoTotal));

}



  }

%>

<h1>Pedido Editado</h1>

<form method="post" action="ModuloTienda.jsp">

  <input type="submit" value="Volver al Modulo">


</form>
</body>
</html>
