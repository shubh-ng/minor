//This model provides information about students

package model;

import java.sql.ResultSet;
import java.sql.SQLException;


public class Student{
    private String ROLE="2";
    
//    Security
    private String studId;
    private String password;
    
//    Student details
    private String fname;
    private String lname;
    private String instituteName;
    private String genderId;
    private String dob;
    
    public boolean isStudentExists(String studentId){
        String query = "select fname from student where stud_id = '"+studentId+"'";
        ResultSet result = null;
        try{
            result = Dbcon.retrive(query);
            if(result.next()){
                return true;
            }else{
                return false;
            }
        }catch(SQLException ex){
            System.out.println("");
        }
        return false;
    }
    
    public void createStudent(){
        String query="INSERT INTO student (stud_id, fname) VALUES ('"+studId+"', '"+fname+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Student, line:26:"+ex.getMessage());
        }
    }
    
    public void createStudentLogin(){
        String query="INSERT INTO student_login (stud_id, password) VALUES ('"+studId+"', '"+password+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Student, line:39: "+ex.getMessage());
        }
    }
    
    public void updateStudent(){
        String query="UPDATE student SET fname='"+fname+"',lname='"+lname+"', institute_name='"+instituteName+"',gender_id='"+genderId+"',dob='"+dob+"' WHERE stud_id='"+studId+"'";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Student, line:48:"+ex.getMessage());  
        }
    }

    /**
     * @return the studId
     */
    public String getStudId() {
        return studId;
    }

    /**
     * @param studId the studId to set
     */
    public void setStudId(String studId) {
        this.studId = studId;
    }

    /**
     * @return the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     * @param fname the fname to set
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     * @return the lname
     */
    public String getLname() {
        return lname;
    }

    /**
     * @param lname the lname to set
     */
    public void setLname(String lname) {
        this.lname = lname;
    }

    /**
     * @return the instituteName
     */
    public String getInstituteName() {
        return instituteName;
    }

    /**
     * @param instituteName the instituteName to set
     */
    public void setInstituteName(String instituteName) {
        this.instituteName = instituteName;
    }

    /**
     * @return the genderId
     */
    public String getGenderId() {
        return genderId;
    }

    /**
     * @param genderId the genderId to set
     */
    public void setGenderId(String genderId) {
        this.genderId = genderId;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }
    

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

//    testing
//    public static void main(String[] args) {
//        Student s = new Student();
//        s.setStudId("sdbct#2");
//        s.setFname("sanjay");
//        s.setPassword("sdbct1");
//        s.createStudent();
//        s.createStudentLogin();
//    }
    
}
