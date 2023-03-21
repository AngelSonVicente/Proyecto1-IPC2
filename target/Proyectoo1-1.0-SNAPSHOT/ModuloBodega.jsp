<%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 17/03/2023
  Time: 03:48 p. m.
  To change this template use File | Settings | File Templates.
--%>
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


<div style="position: fixed; top: 10px; right: 10px; background-color: #FFF; border: 1px solid #CCC; padding: 5px;">
    Usuario: <span style="font-weight: bold;">${usuario}</span>
    Tipo de Tienda: <span style="font-weight: bold;">${TipoTienda}</span>
    <a href="Login-Tienda.jsp">cerrar sesion</a>

</div>


<h1>Modulo Bodega Central</h1>


 <h1><a href="ListarTiendas.jsp?ac=CrearEnvio">Crear Envio</a></h1> <br/><br/>
<h1><a href="ListarTiendas.jsp?ac=Incidencia">Solucionar Incidencia</a></h1><br/><br/>
<h1><a href="ListarTiendas.jsp?ac=Devoluciones">Aceptar o Rechazar Devolucion</a></h1>







</body>
</html>
