<%@page import="model.Topic"%>
<%@page import="model.Dbcon"%>
<%
    if(request.getParameter("add_topic")!=null){
        try{
            Dbcon.connect();
            Topic topic = new Topic();
            topic.setTopicName(request.getParameter("topic_name"));
            topic.setTopicDescription(request.getParameter("topic_description"));
            topic.createTopic(request.getParameter("group_id"));
            %>
            <script>
                alert("Topic Added Successfully!");
                document.location.href="../group_detail.jsp";
            </script>
            <%
        }catch(Exception ex){
            System.out.println("controller/addTopic.jsp, 4:"+ex.getMessage());
            %>
            <script>
                alert("There was some problem while adding topic! Please try again later.!");
                document.location.href="../group_detail.jsp";
            </script>
            <%
        }finally{
            Dbcon.close();
        }
    }
%>