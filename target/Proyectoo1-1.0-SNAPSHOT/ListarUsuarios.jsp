<%@ page import="Web.datosBD" %>
<%@ page import="datos.TiendasaCargo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.Usuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuarios</title>



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
String tipo=request.getParameter("tipo");
  String TipoUsuario = tipo.substring(0, tipo.length() - 4);
  datosBD datos = new datosBD();
  datos.conectar();

  ArrayList<Usuarios> ListaUsuarios = datos.ListarUsuarios(tipo);


%>

<form method="post" action="ModificacionUsuario.jsp">
    Tipo de Usuario: <input type="text" name="TipoUsuario" value="<%=tipo%>" readonly>

    <br/>
    <label>Seleccione el Usuario:</label><br/>

    <select id="select-pedidos" name="Usuario" multiple>

            <% for (Usuarios usuario : ListaUsuarios) { %>
        <option value="<%= usuario.getCodigo() %>">
            ID: <%= usuario.getCodigo() %> Nombre:  <%= usuario.getNombre() %> - Usuario:  <%= usuario.getUsuario() %>

        </option>
            <% } %>
        <br/>

        <input type="submit" value="Modificar Usuario">

</form>
</body>
</html>
