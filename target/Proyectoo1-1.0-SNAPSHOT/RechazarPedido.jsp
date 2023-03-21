<%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 17/03/2023
  Time: 12:20 a. m.
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

<%
    String CODpedido=request.getParameter("CodigoPedido");
%>

<form method="post" action="PedidoRechazado.jsp">

    Ingrese el Motivo Del Rechazo del pedido <input type ="text" name="Motivo">
    <input type="hidden" name="CodigoPedido" value="<%=CODpedido%>">
    <input type="submit" value="Rechazar Pedido">
</form>


</body>
</html>
