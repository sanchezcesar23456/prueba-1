package clases;


import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author RLCR
 */
public class conexion {

    private static Connection cnx = null;

    public static Connection obtener() throws ClassNotFoundException, SQLException {
        if (cnx == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");//(Services-Nueva conexion-Mysql Driver)click derecho en la conexion de mysql-> propiedades -> Driver class
                cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca2", "root", "root"); //si sale error, agregar (Connection)

            } catch (SQLException ex) {
                throw new SQLException(ex);
            } catch (ClassNotFoundException ex) {
                throw new ClassCastException(ex.getMessage());
            }
        }

        return cnx;
    }

    public static void cerrar() throws SQLException {

        if (cnx != null) {
            cnx.close();
        }
    }
    
    public void nuevoTipoUsuario(String tipo_U, String descripcion) throws ClassNotFoundException, SQLException{
        String query="INSERT INTO Tipo_Usuario(Tipo_U , descripcion) values('"+tipo_U+"','"+descripcion+"')";
        Statement st= obtener().createStatement(); //agregar los throws y java.Statement //Abre conexion
        st.executeUpdate(query); //Ejecuta la query sin retorno
        cerrar(); //cierra conexion
        cnx=null;// limpia la conexion
    }
    
    public ArrayList<tipoUsuario> verTipoUsuario() throws ClassNotFoundException, SQLException{
        ArrayList<tipoUsuario> tipos = new ArrayList<>(); //se crea el arraylist
        
        String query="SELECT * FROM Tipo_Usuario";
        Statement st= obtener().createStatement();
        ResultSet rs= st.executeQuery(query); //ejecuta query con retorno
        while(rs.next()){ //pasa linea por linea que encuentra resultado
            tipoUsuario t = new tipoUsuario(); 
            t.setTipo(rs.getString("Tipo_U"));
            t.setDescripcion(rs.getString("descripcion"));
            t.setId(rs.getInt("idTipo_Usuario"));
            tipos.add(t); //se agrega a la lista
        }
        cerrar();
        cnx=null;
        return tipos;
    }
    
    public void editarTipoUsuario(String id, String tipo, String descripcion) throws ClassNotFoundException, SQLException{
        String query="UPDATE Tipo_Usuario SET Tipo_U='"+tipo+"', descripcion='"+descripcion+"' WHERE idTipo_Usuario="+id+"";
        Statement st= obtener().createStatement(); //agregar los throws y java.Statement //Abre conexion
        st.executeUpdate(query); //Ejecuta la query sin retorno
        cerrar(); //cierra conexion
        cnx=null;// limpia la conexion
    }
    
     public ArrayList<tipoUsuario> verTipoUsuarioById(String id) throws ClassNotFoundException, SQLException{
        ArrayList<tipoUsuario> tipos = new ArrayList<>(); //se crea el arraylist
        
        String query="SELECT * FROM Tipo_Usuario WHERE idTipo_Usuario="+id+"";
        Statement st= obtener().createStatement();
        ResultSet rs= st.executeQuery(query); //ejecuta query con retorno
        while(rs.next()){ //pasa linea por linea que encuentra resultado
            tipoUsuario t = new tipoUsuario(); 
            t.setTipo(rs.getString("Tipo_U"));
            t.setDescripcion(rs.getString("descripcion"));
            t.setId(rs.getInt("idTipo_Usuario"));
            tipos.add(t); //se agrega a la lista
        }
        cerrar();
        cnx=null;
        return tipos;
    }

}
