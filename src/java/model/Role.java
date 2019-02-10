//This model provides information about Roles

package model;

import java.sql.ResultSet;
import java.sql.SQLException;


public class Role {
    // stores gender id and name
    static ResultSet roles;
    final static String QUERY="select * from role;";
    
    public static ResultSet getRoles(){
        try{
            roles = Dbcon.retrive(QUERY);
        }catch(SQLException ex){
            System.out.println("Model Role, line 20:"+ex.getMessage());
        }
        return roles;
    }
    
}
