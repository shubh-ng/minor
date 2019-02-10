<%@page import="model.Dbcon"%>
<%@page import="session.SessionCheck"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Group"%>
<style>
    .topicDesc{
        text-transform: capitalize;
        border: none;
        outline: none;
        cursor: pointer;
        font-size: 18px;
    }
</style>
<%
if(SessionCheck.checkSession(request)){
%>
<%@include file="header_footer/header.jsp" %>
<%!ResultSet topics;%>
<%
    
String groupId = (String)session.getAttribute("group_id");
String name = (String)session.getAttribute("group_name");
%>
<nav class="bg-primary text-white text-center" style="padding: 10px;">
        <a class="btn btn-info" href="home.jsp" style="float: left;position: relative;bottom: 8px;">Back</a>
        <h3>Welcome to group <strong style="text-transform: uppercase;color: #003333;" ><%=name%></strong> (<a class="btn btn-link" href="viewStudents.jsp">View Students</a>)</h3>	
</nav>
<div class="container">
    <nav class="col-lg-12 text-center" >
        <button type="button" class="btn btn-primary" id="createBtn" style="font-size: 20px;">Add topic</button>
    </nav>
    <div class="row" id="create">
        <div class="col-lg-12">
			<!-- Default form login -->
                <form action="controller/addTopic.jsp" class="text-center border border-light p-5">

                    <p class="h4 mb-4">Create Topic</p>

                    <!-- Topic name -->
                    <input name="topic_name" type="text" id="defaultLoginFormName" class="form-control mb-4" placeholder="Topic name" required>

                    <!-- Group description -->
                    <input name="topic_description" type="text" id="defaultLoginFormDesc" class="form-control mb-4" placeholder="Topic description" required>

                    <!-- group id -->
                    <input type="hidden" name="group_id" value="<%=groupId%>">
	    	
                    <!-- Create button -->
		    <button name="add_topic" class="btn btn-info btn-block my-4" type="submit">Create</button>
                </form>
        </div>
    </div>
<!-- end -->

<!-- listing topics -->
<div class="row">
<!--showing topics of particular group-->
<%
    try{
        Dbcon.connect();
        Group group=new Group();
        topics = group.getTopics(groupId);
        boolean topicAvailable=false;
        while(topics.next()){
            topicAvailable = true;
            String topicName = topics.getString("topic_name");
            String desc = topics.getString("topic_desc");
            Integer id = topics.getInt("topic_id");
%>
            <div class="col-lg-12">
		<div class="alert alert-primary" role="alert">
                            <!--<form></form>-->
                    <form action="controller/viewTopic.jsp" method="POST">
                            <input type="hidden" value="<%=id%>" name="topicId"/>
                            <input type="hidden" value="<%=topicName%>" name="topicName"/>
                            <button type="submit" name="topicDesc" class="topicDesc alert alert-primary text-primary"><%=topicName%></button>
                    </form>
                    <p style="text-transform: capitalize"><%=desc%></p>
                    <form action="" style="float: left">
                        <input type="hidden" value="<%=id%>" name="topicId"/>
                        <button name="update" type="submit" class="btn btn-primary">Update</button>
                    </form>
                    <form action="controller/deleteTopic.jsp" onsubmit="return confirmIt()">
                                <input type="hidden" value="<%=id%>" name="topic_id"/>                                
                                <button name="delete_topic" class="btn btn-danger">Delete</button>
                    </form>
		</div>			
            </div>            
<%        
        }
        if(!topicAvailable){
            %>
            <h3 style="color: white;">There are no topics, please create by clicking <b>ADD TOPIC</b> button above.</h3>            
            <%
        }
    }catch(Exception ex){
        System.out.println("view/group_detail, "+ex.getMessage());
    }finally{
        Dbcon.close();
    }
%>
            
</div>
<script>
    function confirmIt(){
        if(confirm("Do you really want to delete this topic?")){
            return true;
        }else{
            return false;
        }
    }
</script>
    
<!--showing topics of particular group END-->

<%
}else{
    %>
    <script>
    alert("Login session expired, Continue to login");
    location.href="login.jsp";
    </script>
    <%
}
%>
</div>
<%@include file="header_footer/footer.jsp" %>


