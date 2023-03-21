
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>UsuarioTienda</title>

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


<h1>Inicio de sesion</h1>




<form name="SesionT" action="LoginT_Servlet" method="POST">


  Usuario: <input type ="text" name="usuarioT"/>
  <br/>
  <br/>
  Password: <input type ="password" name="passwordT"/>
  <br/>
  <br/>
  <input type="submit" value="Acceder"/>



</form>


<c:if   test="${not empty error}">
  <p  style="color: red">${error}</p>
</c:if>




</body>
</html>
