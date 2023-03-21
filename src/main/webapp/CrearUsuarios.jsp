<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.TiendasaCargo" %>
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

<script>
    function mostrarSelect() {
        var selectUsuario = document.getElementById("select-usuario");
        var selectTienda = document.getElementById("select-tienda");
        var selectBodega = document.getElementById("select-bodega");

        if (selectUsuario.value == "tienda") {
            selectTienda.style.display = "block";
            selectBodega.style.display = "none";
        } else if (selectUsuario.value == "bodega") {
            selectTienda.style.display = "none";
            selectBodega.style.display = "block";
        } else {
            selectTienda.style.display = "none";
            selectBodega.style.display = "none";
        }
    }
</script>

<form method="post" action="CrearUsuario">

  <%  datosBD datos = new datosBD();
      datos.conectar();
      ArrayList<TiendasaCargo> ListaTiendas = datos.ListarTiendasaCargo("todo");
  %>




    <label>Seleccione el tipo de usuario:</label>
    <select id="select-usuario" name="usuario" onchange="mostrarSelect()">
        <option value="tienda">Usuario Tienda</option>
        <option value="bodega">Usuario Bodega</option>
        <option value="supervisor">Usuario Supervisor</option>
    </select>

    <br/><br/>

    <div id="select-tienda" style="display:none;">
        <label>Seleccione la Tienda:</label>
        <select name="tienda">
            <%
                for (TiendasaCargo Tiendas : ListaTiendas) { %>
            <option value="<%= Tiendas.getCodigoTienda() %>">
                ID: <%= Tiendas.getCodigoTienda() %> Nombre: - <%= datos.getDato("tienda","codigo_tienda","nombre_tienda",String.valueOf(Tiendas.getCodigoTienda())) %>
            </option>
            <% } %>
        </select>
    </div>



    <div id="select-bodega" style="display:none;">
        <label>Seleccione las Bodegas:</label><br/>
        <select name="tiendas" multiple>
            <%

                for (TiendasaCargo Tiendas : ListaTiendas) { %>
            <option value="<%= Tiendas.getCodigoTienda() %>">
                ID: <%= Tiendas.getCodigoTienda() %> Nombre: - <%= datos.getDato("tienda","codigo_tienda","nombre_tienda",String.valueOf(Tiendas.getCodigoTienda())) %>
            </option>
            <% } %>

        </select>


    </div>

    <br/><br/><br/><br/>
    Codigo: <input type="text" name="CodigoUsuario" >
    Nombre: <input type="text" name="Nombre" > <br/><br/>
    Usuario: <input type="text" name="Usuario" >
    Correo: <input type="text" name="correo"><br/><br/>
    Contraseña: <input type="text" name="contra">
    Estado: <input type="text" name="estado" value="Activo" readonly>



    <br/><br/>
    <input type="submit" value="Crear Usuario">
</form>





</body>
</html>
