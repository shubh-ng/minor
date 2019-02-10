<%@page import="model.Group"%>
<%@page import="model.Dbcon"%>
<%
    if(request.getParameter("delete_group")!=null){
        try{
            Dbcon.connect();
            Group group = new Group();
            if(!group.deleteGroup((String)request.getParameter("groupId")))
            {
                %>
                <script>
                    alert("Problem in deleting group! There maybe topics inside the group, please delete them first!");
                    document.location.href="../home.jsp";
                </script>
                <%
            }else{
            %>
            <script>
                alert("Group deleted successfully!");
                document.location.href="../home.jsp";
            </script>
            <%
            }
        }catch(Exception ex){
            System.out.println("controller/deleteGroup, 4:"+ex.getMessage());
        }finally{
            Dbcon.close();
        }
    }
%>