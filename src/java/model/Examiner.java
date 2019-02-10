//This model provides information about Examiner

package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

interface User{
    boolean signup();
}

public class Examiner implements User{
    private final String ROLE="1";
//    Personal Detail
    private String fname;
    private String lname;
    private String genderId;
//    private String userName;
    
//    Address
    private String addLine1;
    private String district;
    private String country;
    private String city;
    private String state;
    
//    Email
    private String optEmail;
    private String mainEmail;
    
//    Identification
    private Integer idType;
    private String idValue;
    
//    Security
    private String password;
    private String securityQuestion;
    private String securityAnswer;
    
    
    public boolean signup(){
        try{    
            insertLoginDetail();
            insertPersonal();
            insertAddress();
            insertIdentification();
            insertEmail();
        }catch(Exception ex){
            System.out.println("model/examiner/signup():"+ex.getMessage());
            return false;
        }
        return true;
    }
    
    public void insertPersonal(){
        String query="INSERT INTO examiner (examiner_id, fname, lname, gender_id) VALUES ('"+mainEmail+"', '"+fname+"', '"+lname+"', '"+genderId+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Examiner, Line 53:"+ex.getMessage());
        }
    }
    
    public void insertAddress(){
        String query="INSERT INTO address (user_id, add_line_1, district, country, city, state) VALUES ('"+mainEmail+"', '"+addLine1+"', '"+district+"', '"+country+"', '"+city+"', '"+state+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Examiner, Line 59:"+ex.getMessage());
        }
    }
    
    public void insertIdentification(){
        String query="INSERT INTO identification (user_id, id_type, id_value) VALUES ('"+mainEmail+"', '"+idType+"', '"+idValue+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Examiner, Line 69:"+ex.getMessage());        
        }
    }
    
    
    public void insertEmail(){
        String query="INSERT INTO email (user_id, main_email, opt_email) VALUES ('"+mainEmail+"', '"+mainEmail+"', '"+optEmail+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Examiner, Line 79:"+ex.getMessage());                
        }
    }
    
    public void insertLoginDetail() {
        String query="INSERT INTO login (user_id, role_id, password, security_question, security_answer) VALUES ('"+mainEmail+"', '"+ROLE+"', '"+password+"', '"+securityQuestion+"', '"+securityAnswer+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Examiner, Line 93:"+ex.getMessage());                
        }
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
     * @return the addLine1
     */
    public String getAddLine1() {
        return addLine1;
    }

    /**
     * @param addLine1 the addLine1 to set
     */
    public void setAddLine1(String addLine1) {
        this.addLine1 = addLine1;
    }

    /**
     * @return the district
     */
    public String getDistrict() {
        return district;
    }

    /**
     * @param district the district to set
     */
    public void setDistrict(String district) {
        this.district = district;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the optEmail
     */
    public String getOptEmail() {
        return optEmail;
    }

    /**
     * @param optEmail the optEmail to set
     */
    public void setOptEmail(String optEmail) {
        this.optEmail = optEmail;
    }

    /**
     * @return the mainEmail
     */
    public String getMainEmail() {
        return mainEmail;
    }

    /**
     * @param mainEmail the mainEmail to set
     */
    public void setMainEmail(String mainEmail) {
        this.mainEmail = mainEmail;
    }

    /**
     * @return the idType
     */
    public Integer getIdType() {
        return idType;
    }

    /**
     * @param idType the idType to set
     */
    public void setIdType(Integer idType) {
        this.idType = idType;
    }

    /**
     * @return the idValue
     */
    public String getIdValue() {
        return idValue;
    }

    /**
     * @param idValue the idValue to set
     */
    public void setIdValue(String idValue) {
        this.idValue = idValue;
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

    /**
     * @return the securityQuestion
     */
    public String getSecurityQuestion() {
        return securityQuestion;
    }

    /**
     * @param securityQuestion the securityQuestion to set
     */
    public void setSecurityQuestion(String securityQuestion) {
        this.securityQuestion = securityQuestion;
    }

    /**
     * @return the securityAnswer
     */
    public String getSecurityAnswer() {
        return securityAnswer;
    }

    /**
     * @param securityAnswer the securityAnswer to set
     */
    public void setSecurityAnswer(String securityAnswer) {
        this.securityAnswer = securityAnswer;
    }
    
    
        //testiting
//    public static void main(String[] args) {
//        Examiner e = new Examiner();
//        e.setFname("shubham");
//        e.setLname("singh");
//        e.setGenderId("1");
//        e.setUsername("suresh@mahesh.com");
//        
//        e.setAddLine1("one two colony");
//        e.setDistrict("indore");
//        e.setCountry("india");
//        e.setCity("pithampur");
//        e.setState("madhya pradesh");
//        
//        e.setOptEmail("opt@gmail.com");
//        e.setMainEmail("main@gmail.com");
//        
//        e.setIdType(1);
//        e.setIdValue("409649346310");
//        
//        e.setPassword("abcd");
//        e.setSecurityQuestion("pet name");
//        e.setSecurityAnswer("dog");
//        
//        e.insertLoginDetail();
//        e.insertPersonal();
//        e.insertAddress();
//        e.insertIdentification();
//        e.insertEmail();
        
//    }
    
}


