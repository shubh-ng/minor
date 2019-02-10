<%@page import="model.Dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Group"%>
<%@page import="session.SessionCheck"%>
<%
if(SessionCheck.checkSession(request)){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./header_footer/header.jsp" %>
<div class="container">
        <div class="row">
            <div class="col-lg-12">
            <button class="btn btn-primary" id="createBtn">Make Group</button>
            </div>
        </div>
        <!-- making group form -->
	<div class="row" id="create">
		<div class="col-lg-12">
			<!-- Default form login -->
                        <form action="controller/createGroup.jsp" class="text-center border border-light p-5">
                	    	<p class="h4 mb-4">Create Group</p>
                        	<!-- Group name -->
                                <input type="text" name="group_name" id="defaultLoginFormName" class="form-control mb-4" placeholder="Group name" required>

                                <!-- Group description -->
                                <input type="text" name="group_desc" id="defaultLoginFormDesc" class="form-control mb-4" placeholder="Group description" required>
	    	
                                <!-- Create button -->
                                <button class="btn btn-info btn-block my-4" name="create_group" type="submit">Create</button>
            		</form>
                </div>
	</div>
	<!--making group form  END-->
    
    <!--showing available groups-->    
    <div class="row">
        <%!String[][] groups;%>
        <%
        try{    
            Dbcon.connect();
            Group group = new Group();
            groups = group.getGroups(request);
            int size=groups.length;
            %>
            <%
            if(size>0){    
                for(int row=0; row<size; row++){
                    String group_id = groups[row][0];
        //            String examiner_id = groups.getString("examiner_id");
                    String group_name = groups[row][1];
                    String group_profile_url = groups[row][2];
                    String group_desc = groups[row][3];
            %>
                    <div class="col-lg-4">
                            <div style="padding: 20px;">
                                    <div class="card" style="width:350px;">
                                        <img class="card-img-top" src="<%=group_profile_url%>" alt="Card image" width="300" height="300">
                                            <div class="card-body">
                                    <h4 class="card-title" style="text-transform: uppercase"><%=group_name%></h4>
                                    <p class="card-text" style="text-transform: capitalize"><%=group_desc%></p>
                                    <form action="controller/viewGroup.jsp" method="POST">
                                        <input type="hidden" name="groupId" value="<%=group_id%>"/>
                                        <input type="hidden" name="groupName" value="<%=group_name%>"/>
                                        <button type="submit" name="view_group" class="btn btn-info" style="width: 100%">Enter to Group</button>
                                    </form>
                                    <form action="controller/deleteGroup.jsp" onsubmit="return really()" method="POST">
                                        <input type="hidden" name="groupId" value="<%=group_id%>"/>
                                        <input type="hidden" name="groupName" value="<%=group_name%>"/>
                                        <button type="submit" name="delete_group"  class="btn btn-danger" style="width: 100%">Delete Group</button>
                                    </form>
                                            </div>
                                    </div>
                            </div>
                    </div>
            <%
                }
            }else{
                %>
                <h3 style="color: white;">There are no groups, please create by clicking make group button above.</h3>
                <%
            }
        }catch(Exception ex){
            System.out.println("Problem in home, showing groups.:"+ex.getMessage());
        }finally{
            Dbcon.close();
        }
        
        %>
	</div>
        <!--showing available groups END-->
</div>
<%@include file="./header_footer/footer.jsp" %>
<script>
      function really(){
            if(confirm("This group will be permanently deleted!")){
                return true;
            }else{
                return false;
            }
      }     
</script>
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