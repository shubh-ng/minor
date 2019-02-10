
package dbschema;

import model.Dbcon;

public class Schema {
    public void up() throws Exception{
        String query=null;
//        Role
        query = "create table if not exists role(role_id int PRIMARY KEY auto_increment, role_name varchar(30), role_desc varchar(30))";
        Dbcon.create(query);
        
//        Login
        query = "create table if not exists login(user_id varchar(30) PRIMARY KEY,role_id int,password varchar(30),security_question varchar(50),security_answer varchar(50),FOREIGN KEY (role_id) REFERENCES role(role_id))";
        Dbcon.create(query);
        
//        Gender
        query = "create table if not exists gender(gender_id int PRIMARY KEY AUTO_INCREMENT, gender_name varchar(30))";
        Dbcon.create(query);
        
//        Identity type
        query = "create table if not exists identity_type (id_type int PRIMARY KEY AUTO_INCREMENT, id_name varchar(30))";
        Dbcon.create(query);

//        Student
        query = "create table if not exists student(stud_id varchar(30) PRIMARY KEY, fname varchar(30), lname varchar(30), institute_name varchar(50), gender_id int, dob date, FOREIGN KEY(gender_id) REFERENCES gender(gender_id))";
        Dbcon.create(query);        
        
        
//        Examiner
        query = "create table if not exists examiner(examiner_id varchar(30) PRIMARY KEY, fname varchar(30), lname varchar(30),  gender_id int, FOREIGN KEY(gender_id) REFERENCES gender(gender_id))";
        Dbcon.create(query);
        
        
//        Identification
        query = "create table if not exists identification(user_id varchar(30), id_type int, id_value varchar(50), FOREIGN KEY (id_type) REFERENCES identity_type(id_type),PRIMARY KEY(user_id,id_type))";
        Dbcon.create(query);
        
//        Email
        query = "create table if not exists email (user_id varchar(30) PRIMARY KEY, main_email varchar(50), opt_email varchar(50))";
        Dbcon.create(query);
                
//        Address
        query = "create table if not exists address(user_id varchar(30) PRIMARY KEY, add_line_1 varchar(100), district varchar(30), country varchar(30), city varchar(30), state varchar(30))";
        Dbcon.create(query);
        

//        Student login
        query = "create table if not exists student_login(id int PRIMARY KEY AUTO_INCREMENT, stud_id varchar(30),password varchar(30))";
        Dbcon.create(query);
        
//        E group
        query = "create table if not exists e_group(group_id int PRIMARY KEY AUTO_INCREMENT, examiner_id varchar(30), group_name varchar(30), group_profile_url varchar(100), group_desc varchar(100))";
        Dbcon.create(query);
        
//        Group member
        query = "create table if not exists group_member (group_id int, examiner_id varchar(30) NOT NULL, stud_id varchar(30),PRIMARY KEY(group_id,stud_id), FOREIGN KEY(group_id) REFERENCES e_group(group_id), FOREIGN KEY(examiner_id) REFERENCES examiner(examiner_id), FOREIGN KEY(stud_id) REFERENCES student(stud_id))";
        Dbcon.create(query);
        
//        Topic
        query = "create table if not exists topic(topic_id int PRIMARY KEY AUTO_INCREMENT, group_id int, topic_name varchar(30), topic_desc varchar(50), FOREIGN KEY(group_id) REFERENCES e_group(group_id))";
        Dbcon.create(query);
        
//        Test record
        query = "create table if not exists test_record(stud_id varchar(30),  group_id int, topic_id int, FOREIGN KEY(stud_id) REFERENCES student(stud_id), FOREIGN KEY(group_id) REFERENCES e_group(group_id), FOREIGN KEY(topic_id) REFERENCES topic(topic_id))";
        Dbcon.create(query);
        
//        Question
        query = "create table if not exists question(quest_id int PRIMARY KEY AUTO_INCREMENT, topic_id int, ques_desc varchar(200), option_a varchar(50), option_b varchar(50), option_c varchar(50), option_d varchar(50), correct_option varchar(50), FOREIGN KEY(topic_id) REFERENCES topic(topic_id))";
        Dbcon.create(query);
        
//        Q option
//        query = "create table if not exists q_option(quest_id int, option_a varchar(30), option_b varchar(30), option_c varchar(30), option_d varchar(30), correct_option varchar(10), FOREIGN KEY(quest_id) REFERENCES question(quest_id))";
//        Dbcon.create(query);
        
//        Correct
        query = "create table if not exists correct(stud_id varchar(30), quest_id int, FOREIGN KEY(stud_id) REFERENCES student(stud_id), FOREIGN KEY(quest_id) REFERENCES question(quest_id), PRIMARY KEY(stud_id,quest_id))";
        Dbcon.create(query);
        
//        Wrong
        query = "create table if not exists wrong(stud_id varchar(30), quest_id int, FOREIGN KEY(stud_id) REFERENCES student(stud_id), FOREIGN KEY(quest_id) REFERENCES question(quest_id), PRIMARY KEY(stud_id,quest_id))";
        Dbcon.create(query);
        
    }
    
    public void down() throws Exception{
        String query=null;
//        Wrong
        query = "drop table if exists wrong";
        Dbcon.create(query);
       
//        test_record
        query = "drop table if exists test_record";
        Dbcon.create(query);    
        
//        student_login
        query = "drop table if exists student_login";
        Dbcon.create(query);        

//        q_option
//        query = "drop table if exists q_option";
//        Dbcon.create(query);        
        
//        login
        query = "drop table if exists login";
        Dbcon.create(query);        
                
        
//        address
        query = "drop table if exists address";
        Dbcon.create(query);        
          
        
//        correct
        query = "drop table if exists correct";
        Dbcon.create(query);        
          
        
//        email
        query = "drop table if exists email";
        Dbcon.create(query);        
          
        
//        group_member
        query = "drop table if exists group_member";
        Dbcon.create(query);        
          
        
//        examiner
        query = "drop table if exists examiner";
        Dbcon.create(query);
        
        
//        identification
        query = "drop table if exists identification";
        Dbcon.create(query);        
        
        
//        identity_type
        query = "drop table if exists identity_type";
        Dbcon.create(query);        
        
        
//        question
        query = "drop table if exists question";
        Dbcon.create(query);        
        
        
//        topic
        query = "drop table if exists topic";
        Dbcon.create(query);        
        
        
//        e_group
        query = "drop table if exists e_group";
        Dbcon.create(query);        
        
        
//        student
        query = "drop table if exists student";
        Dbcon.create(query);        
        
        
//        gender
        query = "drop table if exists gender";
        Dbcon.create(query);        
        
        
//        role
        query = "drop table if exists role";
        Dbcon.create(query);        
        
    }    
    
    public void insertRole() throws Exception{
        String query = "insert into role values ('1','examiner','takes exam'),('2','student','gives exam');";
        Dbcon.update(query);
    }
    
    public void insertGender() throws Exception{
        String query = "insert into gender values ('1','male'),('2','female');";
        Dbcon.update(query);
    }
    
    public void insertIdentificationType() throws Exception{
        String query = "insert into identity_type values ('1','aadhar'),('2','license'),('3','voter id'),('4','pan number');";
        Dbcon.update(query);
    }
    
//    Database Schema modifications
//    public static void main(String[] args) {
//        try{
//            Dbcon.connect();
//            Schema sc = new Schema();
//            sc.down();            
//            sc.up();
//            sc.insertRole();
//            sc.insertGender();
//            sc.insertIdentificationType();
//        }catch(Exception ex){
//            System.out.println("dbschema/Schema, 154:"+ex.getMessage());
//            ex.printStackTrace();
//        }finally{
//            Dbcon.close();
//        }
//    }
}
