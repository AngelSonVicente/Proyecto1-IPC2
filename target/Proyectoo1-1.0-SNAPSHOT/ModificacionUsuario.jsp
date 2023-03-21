<%@ page import="Web.datosBD" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar</title>

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
  String ID = request.getParameter("Usuario");
    String TipoUsuario=request.getParameter("TipoUsuario");
    datosBD datos = new datosBD();
    datos.conectar();


%>

<form method="post" action="ActualizarUsuario">

    <br/>
    <label>Seleccione el Usuario:</label><br/>


<br/>
<br/>

    <% if (TipoUsuario.equals("tienda")) { %>
    Codigo: <input type="text" name="CodigoUsuario" value="<%=ID%>" readonly>
    Nombre: <input type="text" name="Nombre" value="<%=datos.getDato("usuario_tienda","codigo_ut","nombre_ut",ID)%>">
    Usuario: <input type="text" name="Usuario" value="<%=datos.getDato("usuario_tienda","codigo_ut","usuario_ut",ID)%>">
    Codigo de Tienda Asignado: <input type="text" name="CodigoTienda" value="<%=datos.getDato("usuario_tienda","codigo_ut","codigo_tienda",ID)%>">
    Correo: <input type="text" name="correo" value="<%=datos.getDato("usuario_tienda","codigo_ut","correo_ut",ID)%>">
    Contraseña: <input type="text" name="contra" value="<%=datos.getDato("usuario_tienda","codigo_ut","contrasena_ut",ID)%>">
    Estado: <input type="text" name="estado" value="<%=datos.getDato("usuario_tienda","codigo_ut","estado",ID)%>">
    <% } %>

    <% if (TipoUsuario.equals("bodega")) { %>
    Codigo: <input type="text" name="CodigoUsuario" value="<%=ID%>" readonly>
    Nombre: <input type="text" name="Nombre" value="<%=datos.getDato("usuario_bodega","codigo_ub","nombre_ub",ID)%>">
    Usuario: <input type="text" name="Usuario" value="<%=datos.getDato("usuario_bodega","codigo_ub","usuario_ub",ID)%>">
    Contraseña: <input type="text" name="contra" value="<%=datos.getDato("usuario_bodega","codigo_ub","contrasena_ub",ID)%>">
  <br/><br/>
    Correo: <input type="text" name="correo" value="<%=datos.getDato("usuario_bodega","codigo_ub","correo_ub",ID)%>">
    Estado: <input type="text" name="estado" value="<%=datos.getDato("usuario_bodega","codigo_ub","estado",ID)%>">
    <% } %>

    <% if (TipoUsuario.equals("supervisor")) { %>
    Codigo: <input type="text" name="CodigoUsuario" value="<%=ID%>" readonly>

    Nombre: <input type="text" name="Nombre" value="<%=datos.getDato("usuario_supervisor","codigo_us","nombre_us",ID)%>">
    Usuario: <input type="text" name="Usuario" value="<%=datos.getDato("usuario_supervisor","codigo_us","usuario_us",ID)%>">
    Contraseña: <input type="text" name="contra" value="<%=datos.getDato("usuario_supervisor","codigo_us","contrasena_us",ID)%>">
  <br/><br/>
    Correo: <input type="text" name="correo" value="<%=datos.getDato("usuario_supervisor","codigo_us","correo_us",ID)%>">
    Estado: <input type="text" name="estado" value="<%=datos.getDato("usuario_supervisor","codigo_us","estado",ID)%>">
    <% } %>





<br/>
<br/>
<br/>
    <input type="hidden" name="TipoDeUsuario" value="<%=TipoUsuario%>">
        <input type="submit" value="Modificar Usuario">

</form>


</body>
</html>
