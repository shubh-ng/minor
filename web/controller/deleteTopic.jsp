<%@page import="model.Topic"%>
<%@page import="model.Dbcon"%>
<%
    if(request.getParameter("delete_topic")!=null){
        try{
            Dbcon.connect();
            Topic topic = new Topic();
            if(!topic.deleteTopic(request.getParameter("topic_id")))
            {
                %>
                <script>
                    alert("There was some problem while deleting topic, There maybe questions inside this topic, please delete them first!");
                    document.location.href="../group_detail.jsp";
                </script>
                <%
            }else{
            %>
            <script>
                alert("Topic Deleted Successfully!");
                document.location.href="../group_detail.jsp";
            </script>
            <%
            }
        }catch(Exception ex){
            System.out.println("controller/deleteTopic.jsp, 5:"+ex.getMessage());
            %>
            <script>
                alert("There was some problem while deleting topic, please try again later.");
                document.location.href="../group_detail.jsp";
            </script>
            <%

        }finally{
            Dbcon.close();
        }
    }
%>