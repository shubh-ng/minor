//This model provides information about Group

package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



public class Group {
    protected final int MAX_GROUP=50;
    private String groupProfile="./images/group_avtar.png";
    protected String groupId;
    private String groupName;
    private String groupDescription;
    
//  stores gender id and name
    private ResultSet topics;
   
    public ResultSet getStudents(String groupId, String examinerId){
        String query = "select stud_id from group_member where group_id='"+groupId+"' and examiner_id='"+examinerId+"'";
        ResultSet result=null;
        try{
            result = Dbcon.retrive(query);
        }catch(SQLException ex){
            System.out.println("model/group.java: getStudents: "+ex.getMessage());
        }
        return result;
    }
    
    public void addStudent(String groupId, String examinerId, String studentId){
        String query="insert into group_member (group_id, examiner_id, stud_id) values ('"+groupId+"','"+examinerId+"','"+studentId+"')";
        try{
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Group, addStudent: "+ex.getMessage());
        }
    }
    
    
    public void createGroup(String examinerId){
        String query="INSERT INTO e_group (examiner_id, group_name, group_profile_url, group_desc) VALUES ('"+examinerId+"', '"+groupName+"', '"+groupProfile+"', '"+groupDescription+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Model/Group, createGroup: "+ex.getMessage());
        }
    }
    
    public boolean deleteGroup(String groupId){
        String query="delete from group_member where group_id='"+groupId+"'";
        String query2="delete from e_group where group_id='"+groupId+"'";
        String query3="delete from topic where group_id='"+groupId+"'";

        try {
            Dbcon.update(query);
            Dbcon.update(query2);
            Dbcon.update(query3);
        } catch (SQLException ex) {
            System.out.println("Model/Group, deleteGroup "+ex.getMessage());
            return false;
        }
        return true;
    }
    
    
    public int getCount(ResultSet rs) throws SQLException{
        int count=0;
        while(rs.next()){
            count++;
        }
        return count;
    }
   

    public String[][] getGroupDetails(ResultSet result,String[][] groups) throws SQLException{
        int rowIndex=0;
        while(result.next()){
            groups[rowIndex][0] = result.getString("group_id");
            groups[rowIndex][1] = result.getString("group_name");
            groups[rowIndex][2] = result.getString("group_profile_url");
            groups[rowIndex][3] = result.getString("group_desc");
            rowIndex++;
        }
        return groups;
    }
    
    public String[][] getGroups(HttpServletRequest req){
        String groups[][]={};
        HttpSession session = req.getSession();
        String id = (String)session.getAttribute("username");
        String role = (String)session.getAttribute("role");
        if(role.equals("1")){
            String query="select * from e_group where examiner_id='"+id+"'";
            try {
                ResultSet result=Dbcon.retrive(query);
                ResultSet tempResult = Dbcon.retrive(query);
                int count = getCount(tempResult);
                groups = new String[count][4];
                groups = getGroupDetails(result, groups);
            } catch (SQLException ex) {
                System.out.println("Model/Group.java, 58:"+ex.getMessage());
            }
            
        }else{
            String query="select * from group_member where stud_id='"+id+"'";
            try{
                ResultSet result=Dbcon.retrive(query);
                ResultSet tempResult=Dbcon.retrive(query);
                int count = getCount(tempResult);
                groups = new String[count][4];
                int rowIndex=0;
                while(result.next()){
                    String groupId=result.getString("group_id");
                    String sql="select * from e_group where group_id='"+groupId+"'";
                    ResultSet rs = Dbcon.retrive(sql);
                    if(rs.next()){
                        groups[rowIndex][0] = rs.getString("group_id");
                        groups[rowIndex][1] = rs.getString("group_name");
                        groups[rowIndex][2] = rs.getString("group_profile_url");
                        groups[rowIndex][3] = rs.getString("group_desc");
                    }
                    rowIndex++;
                }
            } catch (SQLException ex) {
                System.out.println("Model/Group.java, 80:"+ex.getMessage());
            }
        }
        return groups;
    }
    
    public ResultSet getTopics(String groupId){
        String QUERY = "select * from topic where group_id="+Integer.parseInt(groupId)+"";
        try{
            topics = Dbcon.retrive(QUERY);
        }catch(SQLException ex){
            System.out.println("File Group.java, line 22"+ex.getMessage());
        }
        return topics;
    }
    
    public String getGroupName(String groupId){
        this.groupId = groupId;
        String query = "select group_name from e_group where group_id="+groupId;
        try{
            ResultSet result = Dbcon.retrive(query);
            if(result.next())
                groupName = result.getString("group_name");
        }catch(SQLException ex){
            System.out.println("Group.java, line 49:"+ex.getMessage());
        }
        return groupName;
    }
//    

    /**
     * @return the groupid
     */
    public String getGroupid() {
        return groupId;
    }

    /**
     * @param groupid the groupid to set
     */
    public void setGroupid(String groupId) {
        this.groupId = groupId;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
    /**
     * @return the groupDescription
     */
    public String getGroupDescription() {
        return groupDescription;
    }

    /**
     * @param groupDescription the groupDescription to set
     */
    public void setGroupDescription(String groupDescription) {
        this.groupDescription = groupDescription;
    }
}


class GroupMember extends Group{
    private String examinerId;
    private String studentId;
    
    public void createGroupMembers(){
        String query="INSERT INTO group_member (group_id, examiner_id, stud_id) VALUES ('"+super.groupId+"', '"+examinerId+"', '"+studentId+"');";
        try {
            Dbcon.update(query);
        } catch (SQLException ex) {
            System.out.println("Group.java, line 87:"+ex.getMessage());
        }
    }

    /**
     * @return the examinerId
     */
    public String getExaminerId() {
        return examinerId;
    }

    /**
     * @param examinerId the examinerId to set
     */
    public void setExaminerId(String examinerId) {
        this.examinerId = examinerId;
    }

    /**
     * @return the studentId
     */
    public String getStudentId() {
        return studentId;
    }

    /**
     * @param studentId the studentId to set
     */
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setGroupId(String groupId){
        this.groupId = groupId;
    }
    
//    testing
//    public static void main(String[] args) {
//        GroupMember gm = new GroupMember();
//        gm.setGroupid("1");
//        gm.setStudentId("sdbct#2");
//        gm.setExaminerId("john@mohn.com");
//        gm.createGroupMembers();
//    }
}
