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
        <%!String[][] groups;%>
        <%
            Dbcon.connect();
        Group group = new Group();
        groups = group.getGroups(request);
        int size=groups.length;
        %>
        <%
        for(int row=0; row<size; row++){
            String group_id = groups[row][0];
//            String examiner_id = groups.getString("examiner_id");
            String group_name = groups[row][1];
            String group_profile_url = groups[row][2];
            String group_desc = groups[row][3];
        %>
	<div class="row">
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
                                    </div>
				</div>
			</div>
		</div>
        <%
        }
        Dbcon.close();
        %>
	</div>
        </div>

<%@include file="./header_footer/footer.jsp" %>
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