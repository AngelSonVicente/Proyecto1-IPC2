package Web;

import datos.*;

import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class datosBD {
    private static Connection conexion =null;

    private String url = "jdbc:mysql://localhost:3306/tienda";

    private String user="root";

    private String password="ASV30885";
    
    
        




    public Connection conectar(){


        try{
    Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url,user,password);

            System.out.println("Conectado a la base de datos");
        }catch(SQLException | ClassNotFoundException e){
            System.out.println("error al conectar a la base de datos");
        }


        return null;
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

     public boolean isLoginUT(String tabla,String Columna, String UsuarioIngresado, String ContraIngresada){

        boolean IsLogin=false;
        String usuario="";
        String contra="";
        String sql ="SELECT * FROM "+tabla+" WHERE "+Columna+" = '" +UsuarioIngresado+"'";



        try{
   var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            
            if(resultset.next()){

                if(tabla.equals("usuario_tienda")){

                    usuario = resultset.getString("usuario_ut");
                    contra = resultset.getString("contrasena_ut");

                }
                if(tabla.equals("usuario_supervisor")){

                    usuario = resultset.getString("usuario_us");
                    contra = resultset.getString("contrasena_us");

                }
                if(tabla.equals("usuario_bodega")){
                    usuario = resultset.getString("usuario_ub");
                    contra = resultset.getString("contrasena_ub");



                }
                if(tabla.equals("usuario_administrador")){
                    usuario = resultset.getString("usuario_ua");
                    contra = resultset.getString("contrasena_ud");


                }





            }

         statement.close();
         resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        if(UsuarioIngresado.equals(usuario) && ContraIngresada.equals(contra) ){
            IsLogin=true;
            System.out.println("Ingresado");

        }

       // System.out.println("usuario" + usuario+"     contra "+ contra);

        return IsLogin;
    }


    public String getDato(String tabla,String columna, String DatoaBucar,String BuscarCon){

        String Nombre="";

        String sql ="SELECT * FROM "+tabla+" WHERE "+columna+" = '" +BuscarCon+"'";

        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            if(resultset.next()){
                Nombre = resultset.getString(DatoaBucar);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Nombre;
    }


    public void Actualizardato(String tabla,String ColumnaaActualizar, String DAtoActualizado, String ColumnaaBuscar,String DatoaBucar){



        String sql ="UPDATE "+tabla +" SET "+ColumnaaActualizar+" = '" +DAtoActualizado+"' WHERE "+ColumnaaBuscar+" = '"+DatoaBucar+"'";

        try {
            var statement = conexion.createStatement();
            var resultset = statement.executeUpdate(sql);




            statement.close();



        }catch(SQLException e){
            System.out.println("Error al realizar la actualizacion"+ e.getMessage());
        }

       // System.out.println(sql);


    }







    public void EliminarProductos(String CodigoPedido){



String sql="DELETE FROM listado_pedido WHERE id_pedido = '"+CodigoPedido+"'";
        try {

            var statement = conexion.createStatement();

            var resultset = statement.executeUpdate(sql);


            statement.close();



        }catch(SQLException e){
            System.out.println("Error al realizar la actualizacion"+ e.getMessage());
        }

        // System.out.println(sql);


    }


    public static ArrayList<Producto> ListarProductos(){


        ArrayList<Producto> listaProductos = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        String sql = "SELECT * FROM catalogo_general";
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String codigo = resultset.getString("codigo_producto");
                String nombre = resultset.getString("nombre_producto");
                double costo = resultset.getDouble("costo");
                double precio = resultset.getDouble("precio");
                int existencias = resultset.getInt("existencias");

                Producto producto = new Producto(codigo, nombre, costo, precio, existencias);
                listaProductos.add(producto);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaProductos;
    }



    public static ArrayList<Usuarios> ListarUsuarios(String TipoDeUsuario){


        ArrayList<Usuarios> listausuario = new ArrayList<>();
String sql="";
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

        if(TipoDeUsuario.equals("tienda")){

         sql = "SELECT * FROM usuario_tienda";

        }
        if(TipoDeUsuario.equals("bodega")){

         sql = "SELECT * FROM usuario_bodega";

        }
        if(TipoDeUsuario.equals("supervisor")){
            sql = "SELECT * FROM usuario_supervisor";

        }



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

                String tipo="";
                int codigo=0;
                String nombre="";
                int codigoTienda=0;
                String usuarioo="";
                String contra="";
                String correo="";
                String estado="";

                if(TipoDeUsuario.equals("tienda")){
                tipo="tienda";
                codigo = resultset.getInt("codigo_ut");
                 nombre = resultset.getString("nombre_ut");
                 codigoTienda = resultset.getInt("codigo_tienda");
                 usuarioo = resultset.getString("usuario_ut");
                 contra = resultset.getString("contrasena_ut");
                 correo = resultset.getString("correo_ut");
                 estado = resultset.getString("estado");

                }
                if(TipoDeUsuario.equals("bodega")){
                    tipo="bodega";
                    codigo = resultset.getInt("codigo_ub");
                    nombre = resultset.getString("nombre_ub");
                    //codigoTienda = resultset.getInt("codigo_tienda");
                    usuarioo = resultset.getString("usuario_ub");
                    contra = resultset.getString("contrasena_ub");
                    correo = resultset.getString("correo_ub");
                    estado = resultset.getString("estado");

                }
                if(TipoDeUsuario.equals("supervisor")){
                    tipo="supervisor";
                    codigo = resultset.getInt("codigo_us");
                    nombre = resultset.getString("nombre_us");
                    //codigoTienda = resultset.getInt("codigo_tienda");
                    usuarioo = resultset.getString("usuario_us");
                    contra = resultset.getString("contrasena_us");
                    correo = resultset.getString("correo_us");
                    estado = resultset.getString("estado");


                }

                    Usuarios usuario = new Usuarios(tipo,codigo,nombre,codigoTienda,usuarioo,contra,correo,estado);
                    listausuario.add(usuario);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listausuario;
    }






    public static ArrayList<TiendasaCargo> ListarTiendasaCargo(String UsuarioBodega){

String sql="";
        ArrayList<TiendasaCargo> listatienda = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        if(UsuarioBodega.equals("todo")){

         sql = "SELECT * FROM tienda";

        }else{
         sql = "SELECT * FROM tienda_a_cargo WHERE codigo_ub = '"+UsuarioBodega+"'";

        }



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

                if(UsuarioBodega.equals("todo")){

                    int CodigoTienda = resultset.getInt("codigo_tienda");
                    int CodigoUB=0;

                    TiendasaCargo Tienda = new TiendasaCargo(CodigoTienda,CodigoUB);
                    listatienda.add(Tienda);
                }else{
               int CodigoTienda = resultset.getInt("codigo_tienda");
               int CodigoUB=resultset.getInt("codigo_ub");

                TiendasaCargo Tienda = new TiendasaCargo(CodigoTienda,CodigoUB);
                listatienda.add(Tienda);

                }
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listatienda;
    }








    public static ArrayList<Pedidos> ListarPedidosPendientes(String CodTienda, String EstadoaBuscar){
        ArrayList<Pedidos> listaPedidos= new ArrayList<>();
String sql="";
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

        if(CodTienda.equals("todo")&&EstadoaBuscar.equals("Pendiente")){
            sql = "SELECT * FROM pedidos WHERE estado = 'Pendiente'";

        }else{

         sql = "SELECT * FROM pedidos WHERE codigo_tienda = '"+CodTienda+"' AND estado = '"+EstadoaBuscar+"'";

        }


        //System.out.println(sql);



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String ID = resultset.getString("id_pedido");
                int CodigoTienda = resultset.getInt("codigo_tienda");
                int  CodigoUT= resultset.getInt("codigo_ut");
                String fechaPedido = resultset.getString("fecha_pedido");
                float CostoTotal = resultset.getFloat("total_pedido");
                String estado = resultset.getString("estado");

                Pedidos pedido = new Pedidos(ID,CodigoTienda,CodigoUT,fechaPedido,CostoTotal,estado);
                listaPedidos.add(pedido);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaPedidos;
    }

    public static ArrayList<ListaEnvios> ListarEnvios(String CodTienda, String EstadoaBuscar){
        ArrayList<ListaEnvios> listaEnvios= new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos



      String   sql = "SELECT * FROM envios WHERE codigo_tienda = '"+CodTienda+"' AND estado = '"+EstadoaBuscar+"'";




        //System.out.println(sql);



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

               int ID =resultset.getInt("id_envio");
               int IDPedido=resultset.getInt("id_pedido");
               int IDTienda=resultset.getInt("codigo_tienda");
               int IDusuario=resultset.getInt("codigo_usuario");
               String FechaSalida=resultset.getString("fecha_salida");
               String FechaRecibido=resultset.getString("fecha_recibido");
               float Total =resultset.getFloat("total_envio");
               String Estado=resultset.getString("estado");




                ListaEnvios envios = new ListaEnvios(ID,IDPedido,IDTienda,IDusuario,FechaSalida,FechaRecibido,Total,Estado);
                listaEnvios.add(envios);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaEnvios;
    }




    public static ArrayList<ListaIncidencia> ListarIncidencia(String CodTienda, String EstadoaBuscar){
        ArrayList<ListaIncidencia> listaincidencias= new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos



        String   sql = "SELECT * FROM incidencias WHERE codigo_tienda = '"+CodTienda+"' AND estado = '"+EstadoaBuscar+"'";




        //System.out.println(sql);



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

                int ID =resultset.getInt("id_incidencia");
                int IDenvio=resultset.getInt("id_envio");
                int IDTienda=resultset.getInt("codigo_tienda");
                int IDUT=resultset.getInt("codigo_ut");
                String FechaIncidencia=resultset.getString("fecha_incidencia");
                String Estado=resultset.getString("estado");
                String Solucion =resultset.getString("Solucion");





                ListaIncidencia incidencia = new ListaIncidencia(ID,IDenvio,IDTienda,IDUT,FechaIncidencia,Estado,Solucion);
                listaincidencias.add(incidencia);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaincidencias;
    }
    public static ArrayList<DetalleIncidencia> DetalleIncidencias(String IDIncidencia){
        ArrayList<DetalleIncidencia> listaincidencias= new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos



        String   sql = "SELECT * FROM lista_incidencias WHERE id_incidencia = '"+ IDIncidencia +"'";




        //System.out.println(sql);



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

                int ID =resultset.getInt("id_incidencia");
                int IDProducto=resultset.getInt("codigo_producto");
                String NombreProducto=resultset.getString("nombre_producto");
                int cantidad=resultset.getInt("cantidad");
                String motivo=resultset.getString("motivo");
                float CostoTotal=resultset.getFloat("costo_total");





                DetalleIncidencia incidencia = new DetalleIncidencia(ID,IDProducto,NombreProducto,cantidad,motivo,CostoTotal);
                listaincidencias.add(incidencia);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaincidencias;
    }














    public static ArrayList<ListaDevoluciones> ListarDevoluciones(String CodTienda, String EstadoaBuscar){
        ArrayList<ListaDevoluciones> listaincidencias= new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos



        String   sql = "SELECT * FROM devoluciones WHERE codigo_tienda = '"+CodTienda+"' AND estado = '"+EstadoaBuscar+"'";




        //System.out.println(sql);



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

                int ID =resultset.getInt("id_devolucion");
                int IDenvio=resultset.getInt("id_envio");
                int IDTienda=resultset.getInt("codigo_tienda");
                int IDUT=resultset.getInt("codigo_ut");
                String FechaIncidencia=resultset.getString("fecha_devolucion");
                float Total =resultset.getFloat("total_devolucion");
                String Estado=resultset.getString("estado");





                ListaDevoluciones incidencia = new ListaDevoluciones(ID,IDenvio,IDTienda,IDUT,FechaIncidencia,Total,Estado);
                listaincidencias.add(incidencia);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaincidencias;
    }






    public static ArrayList<DetalleDevolucion> DetalleDevoluciones(String IdDevolucion){
        ArrayList<DetalleDevolucion> listaincidencias= new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos



        String   sql = "SELECT * FROM listado_devolciones WHERE id_devolucion = '"+ IdDevolucion +"'";




        //System.out.println(sql);



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

                int ID =resultset.getInt("id_devolucion");
                int IDProducto=resultset.getInt("codigo_producto");
                float CostosUnitario=resultset.getFloat("costo_unitario");
                int cantidad=resultset.getInt("cantidad");
                float CostoTotal=resultset.getFloat("costo_total");
                String motivo=resultset.getString("motivo");





                DetalleDevolucion incidencia = new DetalleDevolucion(ID,IDProducto,CostosUnitario,cantidad,CostoTotal,motivo);
                listaincidencias.add(incidencia);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaincidencias;
    }







    public static ArrayList<ListadoEnvios> ListarEnvios( String IdEnvio){
        ArrayList<ListadoEnvios> listaEnvios= new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

         String sql = "SELECT * FROM listado_envios WHERE id_envio = '"+IdEnvio+"'";

        //System.out.println(sql);



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

               int ID =resultset.getInt("id_envio");
        int CodigoProducto=resultset.getInt("codigo_producto");
        String NombreProducto=resultset.getString("nombre_producto");
        float CostoUnitario=resultset.getFloat("costo_unitario");
        int Cantidad=resultset.getInt("cantidad");
        float CostoTOtal=resultset.getFloat("costo_total");




                ListadoEnvios envios = new ListadoEnvios(ID,CodigoProducto,NombreProducto,CostoUnitario,Cantidad,CostoTOtal);
                listaEnvios.add(envios);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaEnvios;
    }




        public static ArrayList<ListaPedido> DetallePedido(String IDpedido){
        ArrayList<ListaPedido> listaPedidos = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        String sql = "SELECT * FROM listado_pedido WHERE id_pedido = '"+IDpedido+"'";
        //System.out.println(sql);

        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int ID = resultset.getInt("id_pedido");
                int CodigoProducto = resultset.getInt("codigo_producto");
                String  NombreProducto= resultset.getString("nombre_producto");
                float CostoUnitario = resultset.getFloat("costo_unitario");
                int Cantidad = resultset.getInt("cantidad");
                float CostoTotal = resultset.getFloat("costo_total");

                ListaPedido lista = new ListaPedido(ID,CodigoProducto,NombreProducto,CostoUnitario,Cantidad,CostoTotal);

                listaPedidos.add(lista);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaPedidos;
    }









    public void  CrearPedido(String codigo,String codigoTienda, String CodigoUT, String fecha,String TotalPedido,String estado ){


        String query = "INSERT INTO pedidos (id_pedido,codigo_tienda,codigo_ut,fecha_pedido,total_pedido,estado)" +
                " VALUES ("+codigo+",'"+codigoTienda+"','"+CodigoUT+"','"+fecha+"','"+TotalPedido+"','"+estado+"')";

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }


    }



    public void  CrearEnvio(String codigo,String IDPedido,String CodigoTienda,String CodigoUB,String FechaSalida, String  FechaRecibido,String Total,String Estado ){


        String query = "INSERT INTO envios (id_envio,id_pedido,codigo_tienda,codigo_usuario,fecha_salida,fecha_recibido,total_envio,estado)" +
                " VALUES ("+codigo+",'"+IDPedido+"','"+CodigoTienda+"','"+CodigoUB+"','"+FechaSalida+"','"+FechaRecibido+"','"+Total+"','"+Estado+"')";

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }


    }



    public void  SubirDetalleEnvio(String codigo,String codigoProducto, String NombreProducto, String ConstoUnitario,String Cantidad,String Costototal) {


        String query = "INSERT INTO listado_envios (id_envio,codigo_producto,nombre_producto,costo_unitario,cantidad,costo_total)" +
                " VALUES (" + codigo + ",'" + codigoProducto + "','" + NombreProducto + "','" + ConstoUnitario + "','" + Cantidad + "','" + Costototal + "')";

        try (var statement = conexion.createStatement()) {
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    public void  CrearIncidencia(String codigo,String id_pedido,String codigoTienda, String CodigoUT, String fecha,String estado ){


        String query = "INSERT INTO incidencias (id_incidencia,id_envio,codigo_tienda,codigo_ut,fecha_incidencia,estado)" +
                " VALUES ("+codigo+",'"+id_pedido+"','"+codigoTienda+"','"+CodigoUT+"','"+fecha+"','"+estado+"')";

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

System.out.println(query);
    }



    public void  CrearDevolucion(String codigo, String ID_envio ,String codigoTienda, String CodigoUT, String fecha,String total,String estado ){


        String query = "INSERT INTO devoluciones (id_devolucion,id_envio,codigo_tienda,codigo_ut,fecha_devolucion,total_devolucion,estado)" +
                " VALUES ("+codigo+",'"+ID_envio+"','"+codigoTienda+"','"+CodigoUT+"','"+fecha+"','"+total+"','"+estado+"')";

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        System.out.println(query);
    }



    public void  SubirProductoaTienda(String codigoTienda,String CodigoProducto, int Existencias ){


        String query = "INSERT INTO catalogo_tienda (codigo_tienda,codigo_producto,existencias)" +
                " VALUES ("+codigoTienda+",'"+CodigoProducto+"','"+Existencias+"')";

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }


    }




    public void  SubirDetallePedido(String codigo,String codigoProducto, String NombreProducto, String ConstoUnitario,String Cantidad,String Costototal){


        String query = "INSERT INTO listado_pedido (id_pedido,codigo_producto,nombre_producto,costo_unitario,cantidad,costo_total)" +
                " VALUES ("+codigo+",'"+codigoProducto+"','"+NombreProducto+"','"+ConstoUnitario+"','"+Cantidad+"','"+Costototal+"')";

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }


    }
    public void  SubirDetalleIncidencia(String codigo,String codigoProducto, String NombreProducto, String Cantidad, String Motivo,String Costototal){


        String query = "INSERT INTO lista_incidencias (id_incidencia,codigo_producto,nombre_producto,cantidad,motivo,costo_total)" +
                " VALUES ("+codigo+",'"+codigoProducto+"','"+NombreProducto+"','"+Cantidad+"','"+Motivo+"','"+Costototal+"')";

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }


    }

    public void  SubirDetalleDvoluciones(String codigo,String codigoProducto, String CostoUnitario, String Cantidad, String Costototal,String Motivo){


        String query = "INSERT INTO listado_devolciones (id_devolucion,codigo_producto,costo_unitario,cantidad,costo_total,motivo)" +
                " VALUES ("+codigo+",'"+codigoProducto+"','"+CostoUnitario+"','"+Cantidad+"','"+Costototal+"','"+Motivo+"')";

        try (var statement =conexion.createStatement()){
            statement.execute(query);

System.out.println(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }


    }


    public void  CrearUsuario(String TipoUsuario, String Codigo,  String Nombre, String CodigoTienda, String Usuario, String Contrasena,String Correo,String Estado ){
String query="";
if(TipoUsuario.equals("tienda")){
         query = "INSERT INTO usuario_tienda (codigo_ut,nombre_ut,codigo_tienda,usuario_ut,contrasena_ut,correo_ut,estado)" +
                " VALUES ("+Codigo+",'"+Nombre+"','"+CodigoTienda+"','"+Usuario+"','"+Contrasena+"','"+Correo+"','"+Estado+"')";
}
if(TipoUsuario.equals("bodega")){

         query = "INSERT INTO usuario_bodega (codigo_ub,nombre_ub,usuario_ub,contrasena_ub,correo_ub,estado)" +
                " VALUES ("+Codigo+",'"+Nombre+"','"+Usuario+"','"+Contrasena+"','"+Correo+"','"+Estado+"')";
        }

if(TipoUsuario.equals("supervisor")){

         query = "INSERT INTO usuario_supervisor (codigo_us,nombre_us,usuario_us,contrasena_us,correo_us,estado)" +
                " VALUES ("+Codigo+",'"+Nombre+"','"+Usuario+"','"+Contrasena+"','"+Correo+"','"+Estado+"')";

}

System.out.println(query);

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }




    }

    public void  SubirTiendasaCargo(String CodigoTienda, String CodigoUsuarioBodega){

       String query = "INSERT INTO tienda_a_cargo (codigo_tienda,codigo_ub)" +
                " VALUES ("+CodigoTienda+",'"+CodigoUsuarioBodega+"')";



        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }


    }





    public void ActualizarUsuarioTienda(String tipo, String Codigo,String nombre, String CodigoTienda, String Usuario,String Contra,String correo,String estado){
String sql="";
     if(tipo.equals("tienda")){

      sql ="UPDATE usuario_tienda SET nombre_ut ='" + nombre + "', codigo_tienda = '" +CodigoTienda+"', usuario_ut = '"+Usuario+"', contrasena_ut ='"+Contra+"', correo_ut = '"+correo+"', estado = '"+estado+"' WHERE codigo_ut = '"+Codigo+"'";

     }
        if(tipo.equals("supervisor")){
            sql ="UPDATE usuario_supervisor SET nombre_us ='" + nombre + "', usuario_us = '"+Usuario+"', contrasena_us ='"+Contra+"', correo_us = '"+correo+"', estado = '"+estado+"' WHERE codigo_us = '"+Codigo+"'";


     }  if(tipo.equals("bodega")){
            sql ="UPDATE usuario_bodega SET nombre_ub ='" + nombre + "', usuario_ub = '"+Usuario+"', contrasena_ub ='"+Contra+"', correo_ub = '"+correo+"', estado = '"+estado+"' WHERE codigo_ub = '"+Codigo+"'";


     }

        try {
            var statement = conexion.createStatement();
            var resultset = statement.executeUpdate(sql);

            statement.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la actualizacion"+ e.getMessage());
        }
         System.out.println(sql);

    }







}
