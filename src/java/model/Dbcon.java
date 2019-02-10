/*
This class establishesh the connection to the database
*/
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dbcon {
    // Database name
    static String dbName="onlinetest";
    
    // Database username
    static String userName="root";
    
    // Database password
    static String userPass="";
    
    // Connection object
    static Connection con;
    
    // statement
    static Statement st;
    
    // Creating connection
    public static void connect() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,userName,userPass);
        }catch(ClassNotFoundException ex){
            System.out.println("Problem in creating connection: "+ex.getMessage());
        }catch(SQLException ex){
            System.out.println("Problem in DriverManager: "+ex.getMessage());
        }
    }
    
    public static void create(String query) throws SQLException
    {
        st = con.createStatement();
        st.execute(query);
    }
    
    public static void update(String query) throws SQLException
    {
        st = con.createStatement();
        st.executeUpdate(query);
    }
    
    public static ResultSet retrive(String query) throws SQLException
    {
        st = con.createStatement();
        return st.executeQuery(query);
    }
    
    // Setter
    public static void close() {
        try{
            con.close();
            st.close();
        }catch(SQLException ex){
            System.out.println("Problem in closing connection: "+ex.getMessage());
        }
    }
    public static void main(String[] args) {
        Dbcon.close();
    }
}
