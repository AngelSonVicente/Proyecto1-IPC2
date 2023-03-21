<%@ page import="Web.datosBD" %>
<%@ page import="datos.Producto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.swing.*" %>
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
    String id_tienda = (String) session.getAttribute("idTienda");
    String id_usuario = (String) session.getAttribute("idUsuario");
 String CodigoIncidencia = request.getParameter("CI");
    String FechaIncidencia = request.getParameter("FI");
    String accion=request.getParameter("accion");
String CODPEDIDO=request.getParameter("CP");


    datosBD datos = new datosBD();
    datos.conectar();
    //ArrayList<Producto> listaProductos = datos.ListarProductos();


    if(accion.equals("Devolucion.jsp")){
    datos.CrearDevolucion(CodigoIncidencia,CODPEDIDO,id_tienda,id_usuario,FechaIncidencia,"0","Activo");

    }else{

 datos.CrearIncidencia(CodigoIncidencia,CODPEDIDO,id_tienda,id_usuario,FechaIncidencia,"Activo");
    }







    String[] productosAgregados = request.getParameterValues("carrito");

    for (int i = 0; i < productosAgregados.length; i++) {
        String producto = productosAgregados[i];
        String[] valoresProducto = producto.split(",");
       String idProducto = valoresProducto[0];
    String    Nombre = valoresProducto[1];
        String cantidad = valoresProducto[2];
      String  mottivo= valoresProducto[3];

      int Cantidad = Integer.parseInt(cantidad);
  float CostoU = Float.parseFloat(valoresProducto[4]);
        float CostoTotal=Cantidad*CostoU;

        if(accion.equals("Devolucion.jsp")){

    datos.SubirDetalleDvoluciones(CodigoIncidencia,idProducto,String.valueOf(CostoU),String.valueOf(cantidad),String.valueOf(CostoTotal),mottivo);

        }else{
   datos.SubirDetalleIncidencia(CodigoIncidencia,idProducto,Nombre,cantidad,mottivo,String.valueOf(CostoTotal));

        }


    }

%>
<h1>Se ha Realizdo solicitud :) </h1>
<form method="post" action="ModuloTienda.jsp">

    <input type="submit" value="Volver al Modulo">


</form>

</body>
</html>
