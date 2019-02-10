//This model provides information about Topic

package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Topic {
    private ResultSet questions;
    private String topicName;
    private String topicDescription;
    
    public void createTopic(String groupId){
        String query="insert into topic (group_id, topic_name, topic_desc) values ('"+groupId+"','"+topicName+"','"+topicDescription+"')";
        try{ 
            Dbcon.update(query);
        }catch(SQLException ex){
            System.out.println("model/topic.java, 16:"+ex.getMessage());
        }
    }
    
    public boolean deleteTopic(String topicId){
        String query="delete from topic where topic_id = '"+topicId+"'";
        try{ 
            Dbcon.update(query);
        }catch(SQLException ex){
            System.out.println("model/topic.java, 25:"+ex.getMessage());
            return false;
        }
        return true;
    }
    
    public ResultSet getQuestions(Integer questionId){
        String query = "select * from question where topic_id="+questionId;
        try{
            Dbcon.connect();
            setQuestions(Dbcon.retrive(query));
        }catch(SQLException ex){
            System.out.println("Problem in creating statement in getGenders():"+ex.getMessage());
        }
        return questions;
    }
    
    public String getTopicName(String topicId){
        System.out.println("Topic: "+topicId);
        String query = "select topic_name from topic where topic_id="+topicId;
        try{
            Dbcon.connect();
            ResultSet result = Dbcon.retrive(query);
            if(result.next()){
                setTopicName(result.getString("topic_name"));
            }
        }catch(SQLException ex){
            System.out.println("Problem in creating statement in getGenders():"+ex.getMessage());
        }
        return topicName; 
    }

    /**
     * @param questions the questions to set
     */
    public void setQuestions(ResultSet questions) {
        this.questions = questions;
    }

    /**
     * @param topicName the topicName to set
     */
    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    /**
     * @param topicDescription the topicDescription to set
     */
    public void setTopicDescription(String topicDescription) {
        this.topicDescription = topicDescription;
    }
    
    
}
