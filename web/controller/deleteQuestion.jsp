<%@page import="model.Question"%>
<%@page import="model.Dbcon"%>
<%
    if(request.getParameter("delete_question")!=null){
        try{
            Dbcon.connect();
            Question question = new Question();
            if(!question.deleteQuestion(request.getParameter("quest_id")))
            {
                %>
                <script>
                    alert("There was problem in deleting the question!");
                    document.location.href="../topic_detail.jsp";
                </script>
                <%
            }else{
            %>
            <script>
                alert("Question deleted successfully!");
                document.location.href="../topic_detail.jsp";
            </script>
            <%
             }  
        }catch(Exception ex){
            System.out.println("controller/deleteQuestion.jsp, "+ex.getMessage());
            %>
            <script>
                alert("There was problem in deleting the question!");
                document.location.href="../topic_detail.jsp";
            </script>
            <%
        }finally{
            Dbcon.close();
        }
    }
%>