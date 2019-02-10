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
<%
    
String groupId = (String)session.getAttribute("group_id");
String name = (String)session.getAttribute("group_name");
%>
<nav class="bg-primary text-white text-center" style="padding: 10px;">
        <a class="btn btn-info" href="group_detail.jsp" style="float: left;position: relative;bottom: 8px;">Back</a>
        <h3>Welcome to group <strong style="text-transform: uppercase;color: #003333;" ><%=name%></strong></h3>	
</nav>

<div class="container">
            <a class="btn btn-primary" href="addStudent.jsp" style="position: relative;top: 22%;">Add students</a>
    <div class="row">
        <%
            try{
                Dbcon.connect();
                Group group = new Group();
                ResultSet students = group.getStudents((String)session.getAttribute("group_id"),(String) session.getAttribute("username"));
                boolean availableStudent=false;
                while(students.next()){
                    availableStudent = true;
        %>
            <div class="col-lg-12">
		<div class="alert alert-primary" role="alert">
                            <!--<form></form>-->
                    <button type="submit" name="topicDesc" class="topicDesc alert alert-primary text-primary">ABC</button>
                    <p><%=students.getString("stud_id")%></p>   
                    <form action="" style="float: left">
                        <button name="update" type="submit" class="btn btn-primary">Update</button>
                    </form>
                    <form action="controller/deleteStudent.jsp" onsubmit="return confirmIt()">
                                <button name="delete_topic" class="btn btn-danger">Delete</button>
                    </form>
		</div>			
            </div> 
        <%
            }
            if(!availableStudent){
                %>
                <h3>There are no students, please create by clicking <b>ADD STUDENT</b> button above.</h3>            
                <%
            }
            }catch(Exception ex){
                System.out.println("View/ViewStudent.jsp: "+ex.getMessage());
            }finally{
                Dbcon.close();
            }
        %>
    </div>
</div>
        
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


