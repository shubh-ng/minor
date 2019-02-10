package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Question {
    private String questionDescription;
    private String topicId;
    
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    
    private String correctOption;
    
    public boolean addQuestion(){
        String query = "insert into question (topic_id, ques_desc, option_a,option_b,option_c, option_d, correct_option) VALUES ('"+topicId+"','"+questionDescription+"','"+optionA+"','"+optionB+"','"+optionC+"','"+optionD+"','"+correctOption+"')";
        try{
            Dbcon.update(query);
        }catch(SQLException ex){
            System.out.println("mode/question.java, addQuestion:"+ex.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean deleteQuestion(String questId){
        String query = "delete from question where quest_id = '"+questId+"'";
        try{
            Dbcon.update(query);
        }catch(SQLException ex){
            System.out.println("model/Question.java/deleteQuestion, "+ex.getMessage());
            return false;
        }
        return true;
    }
 
    public ResultSet getQuestions(String topicId){
        String query = "select * from question where topic_id='"+topicId+"'";
        ResultSet result = null;
        try{
            result = Dbcon.retrive(query);
        }catch(SQLException ex){
            System.out.println("mode/question.java, getQuestions:"+ex.getMessage());
        }
        return result;
    }
//    public ResultSet getQuestionIds(String topicId){
//        String query = "select * from question where topic_id = '"+topicId+"'";
//        ResultSet result = null;
//        try{
//            result = Dbcon.retrive(query);
//        }catch(SQLException ex){
//            System.out.println("model/question/getQuestionIds, "+ex.getMessage());
//        }
//        return result;
//    }
    
//    public String[][] getQuestions(String topicId){
//        String[][] questions = {};
//        int count=0;
//        try{
//            while(tempRs.next())
//                count++;
//            questions = new String[count][7];
//            int index=0;
//            while(result.next()){
//                String qId = Integer.toString(result.getInt("quest_id"));
//                questions[index][0] = qId;
//                questions[index][1] = result.getString("ques_desc");
//                ResultSet rs = Dbcon.retrive("select * from q_option where quest_id = '"+qId+"'");
//                while(rs.next()){ 
//                    questions[index][2] = rs.getString("option_a");
//                    questions[index][3] = rs.getString("option_b");
//                    questions[index][4] = rs.getString("option_c");
//                    questions[index][5] = rs.getString("option_d");
//                    questions[index][6] = rs.getString("correct_option");                    
//                }
//                index++;
//            }
//        }catch(SQLException ex){
//            System.out.println("model/question/getQuestions, "+ex.getMessage());
//        }
//        return questions;
//    }  
//    
//    public void addQuestion(){
//        String query = "insert into question (topic_id, ques_desc) values('"+getTopicId()+"','"+questionDescription+"')";
//        try{
//            Dbcon.update(query);
//        }catch(SQLException ex){
//            System.out.println("model/question, addQuestion:"+ex.getMessage());
//        }
//    }
//    
//    public String getQuestionId(){
//        String query = "select quest_id from question where topic_id = '"+topicId+"'";
//        ResultSet result = null;
//        String questId = "";
//        try{
//            result = Dbcon.retrive(query);
//            if(result.next()){
//                questId = Integer.toString(result.getInt("quest_id"));
//            }
//        }catch(SQLException ex){
//            System.out.println("model/question, getQuestionId:"+ex.getMessage());
//        }
//        return questId;
//    }
    


    /**
     * @return the questionDescription
     */
    public String getQuestionDescription() {
        return questionDescription;
    }

    /**
     * @param questionDescription the questionDescription to set
     */
    public void setQuestionDescription(String questionDescription) {
        this.questionDescription = questionDescription;
    }

    /**
     * @return the topicId
     */
    public String getTopicId() {
        return topicId;
    }

    /**
     * @param topicId the topicId to set
     */
    public void setTopicId(String topicId) {
        this.topicId = topicId;
    }

    /**
     * @return the optionA
     */
    public String getOptionA() {
        return optionA;
    }

    /**
     * @param optionA the optionA to set
     */
    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }

    /**
     * @return the optionB
     */
    public String getOptionB() {
        return optionB;
    }

    /**
     * @param optionB the optionB to set
     */
    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }

    /**
     * @return the optionC
     */
    public String getOptionC() {
        return optionC;
    }

    /**
     * @param optionC the optionC to set
     */
    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }

    /**
     * @return the optionD
     */
    public String getOptionD() {
        return optionD;
    }

    /**
     * @param optionD the optionD to set
     */
    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }

    /**
     * @return the correctOption
     */
    public String getCorrectOption() {
        return correctOption;
    }

    /**
     * @param correctOption the correctOption to set
     */
    public void setCorrectOption(String correctOption) {
        this.correctOption = correctOption;
    }


    
}
