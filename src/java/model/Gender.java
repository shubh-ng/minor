//This model provides information about Gender

package model;

import java.sql.ResultSet;
import java.sql.SQLException;


public class Gender {
    // stores gender id and name
    static ResultSet genders;
    final static String QUERY="select * from gender;";
    
    public static ResultSet getGenders(){
        try{
            Dbcon.connect();
            genders = Dbcon.retrive(QUERY);
        }catch(SQLException ex){
            System.out.println("Problem in creating statement in getGenders():"+ex.getMessage());
        }
        return genders;
    }
    
}
