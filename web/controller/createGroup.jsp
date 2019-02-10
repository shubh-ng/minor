<%@page import="model.Group"%>
<%@page import="model.Dbcon"%>
<%
    if(request.getParameter("create_group")!=null){
        try{    
            Dbcon.connect();
            Group group = new Group();
            String name=request.getParameter("group_name");
            group.setGroupName(name);
            group.setGroupDescription(request.getParameter("group_desc"));
            group.createGroup((String)session.getAttribute("username"));
            %>
            <script>
                alert("Group created successfully");
                document.location.href="../home.jsp";
            </script>
            <%
        }catch(Exception ex){
            System.out.println("controller/createGroup, 6:"+ex.getMessage());
            %>
            <script>
                alert("Problem in creating group, please try again!");
                document.location.href="../home.jsp";
            </script>
            <%
        }finally{
            Dbcon.close();
        }
    }
 
%>