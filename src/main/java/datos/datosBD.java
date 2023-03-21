package datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class datosBD {
     Connection conexion =null;

    String url = "jdbc:mysql://localhost:3306/prueba";

    String user="root";

    String password="ASV30885";
    public void conectar(){


        try{

            conexion = DriverManager.getConnection(url,user,password);

            System.out.println("Conectado a la base de datos");
        }catch(SQLException ex){
            System.out.println("error al conectar a la base de datos");
        }

    }

    public void desconectar(){

        if(conexion != null ){

            try {
                conexion.close();
                System.out.println("Conexion cerrada");
            }catch(SQLException e){
                System.out.println("Error al cerrar la Conexion");
            }



        }
    }

        public boolean isLoginUT( String ContraIngresada, String UsuarioIngresado){
        boolean IsLogin=false;
      String usuario="";
      String contra="";
        String pedidos ="SELECT * FROM tienda WHERE usuario_ut = " + UsuarioIngresado;


        try(var statement = conexion.createStatement();
            var resultset = statement.executeQuery(pedidos)){

          //  int id=resultset.getInt("codigo_ut");
           // int codigotienda=resultset.getInt("codigo_tienda");
            //String nombre=resultset.getString("nombre_ut");
             usuario=resultset.getString("usuario:ut");
             contra=resultset.getString("contrasena_ut");


          //  String correo=resultset.getString("correo:ut");

          //  String[] datosU = {String.valueOf(id),nombre ,String.valueOf(codigotienda),usuario,contra,correo};




            //Si esta dentro del try se cierra automaticamente
            // statement.close();
            // resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta");
        }
        if(UsuarioIngresado.equals(usuario) && ContraIngresada.equals(contra) ){
            IsLogin=true;

        }
        return IsLogin;


    }





}


