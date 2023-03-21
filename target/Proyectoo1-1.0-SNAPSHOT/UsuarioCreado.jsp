<%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 21/03/2023
  Time: 04:40 p. m.
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
<h1> Usuario Creado</h1>
<form method="post" action="ModuloAdministracion.jsp">

  <input type="submit" value="Volver al Modulo">


</form>
</body>
</html>
