<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modulo Tienda</title>

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
    // Obtiene la sesión del usuario
    HttpSession sesion = request.getSession();
    // Obtiene el valor actual del atributo "nombre"
    String nombre = (String) session.getAttribute("nombre");


    /*
   Actualiza el valor del atributo "nombre"
    nombre = "Nuevo nombre";
   session.setAttribute("nombre", nombre);

   Mi nombre es: <c:out value="${sessionScope.nombre}" />
  */
%>

<div style="position: fixed; top: 10px; right: 10px; background-color: #FFF; border: 1px solid #CCC; padding: 5px;">
    Usuario: <span style="font-weight: bold;">${usuario}</span>
    Tipo de Tienda: <span style="font-weight: bold;">${TipoTienda}</span>
      <a href="Login-Tienda.jsp">cerrar sesion</a>

</div>
<h1>                Modulo Tienda</h1>
<c:choose>
    <c:when test="${TipoTienda == 'supervisada'}">
       <h1> <a href="CrearPedido.jsp">Crear Pedido</a></h1><br/><br/>
        <h1><a href="RecibirEnvio.jsp">Recibir Envio</a></h1><br/><br/>
        <h1> <a href="CrearIncidencia.jsp?accion=Incidencia">Crear Incidencia</a></h1><br/><br/>
        <h1><a href="CrearIncidencia.jsp?accion=Devolucion">Crear Devolucion</a></h1><br/><br/>
<h1><a href="ListarPedidos.jsp">Editar Pedido</a>

    </c:when>
    <c:when test="${TipoTienda == 'normal'}">
    <h1>    <a href="CrearPedido.jsp">Crear Pedido</a></h1><br/><br/>
        <h1> <a href="RecibirEnvio.jsp">Recibir Envio</a></h1><br/><br/>
            <h1><a href="CrearIncidencia.jsp?accion=Incidencia">Crear Incidencia</a></h1><br/><br/>
                <h1><a href="CrearIncidencia.jsp?accion=Devolucion">Crear Devolucion</a></h1><br/><br/>
    </c:when>
    <c:otherwise>
        <p>No se reconoce el tipo de tienda</p>

    </c:otherwise>
</c:choose>

</body>
</html>
