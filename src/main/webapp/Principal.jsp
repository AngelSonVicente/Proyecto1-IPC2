<!DOCTYPE html>
<html>
<head>
    <title>Tienda</title>
    <style>
        body {
            background-image: url("fondo.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            overflow: hidden;
        }

        body::before {
            content: "";
            position: absolute;
            top: 10%;
            left: 22%;
            width: 60%;
            height: 60%;
            background: rgba(255, 255, 255, 0.25); /* Agrega un fondo semitransparente */
            z-index: -1;
            filter: blur(5px); /* Agrega un efecto de desenfoque al fondo */
        }



        .image-container {
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            justify-content: center;
            align-items: center;
        }


        .image-container a:hover img {
            margin: 20px;



            transform: scale(1.3);
        }
        .image-container a:nth-child(2) {
            margin-top: 500px;

        }

        .image-container a img {
            transition: all 0.3s ease-in-out;
            max-width: 200px;

        }
        .image-container a:nth-child(1) {

            text-align: center; /* Centra el texto */
            font-size: 1.5rem; /* Ajusta el tamaño de fuente */
            color: #000; /* Establece el color del texto a negro */
            text-decoration: none; /* Elimina el subrayado del texto */
        }

        .image-container a:nth-child(2) {
            margin-top: 300px;
            text-align: center; /* Centra el texto */
            font-size: 1.5rem; /* Ajusta el tamaño de fuente */
            color: #000; /* Establece el color del texto a negro */
            text-decoration: none; /* Elimina el subrayado del texto */
        }.image-container a:nth-child(3) {

             text-align: center; /* Centra el texto */
             font-size: 1.5rem; /* Ajusta el tamaño de fuente */
             color: #000; /* Establece el color del texto a negro */
             text-decoration: none; /* Elimina el subrayado del texto */
         }

    </style>
</head>
<body>
<div class="image-container">
    <a href="Login-Tienda.jsp"><img src="tienda.png"><p>Tienda</p></a>
    <a href="Login-Tienda.jsp"><img src="admin.png"><p>Administrador</p></a>
    <a href="Login-Tienda.jsp"><img src="bodega1.png"><p>Bodega</p></a>



</div>
</body>
</html>