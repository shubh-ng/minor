<%@page import="model.Question"%>
<%@page import="model.Dbcon"%>
<%
    if(request.getParameter("addQuestion")!=null){
        try{
            Dbcon.connect();
            Question question = new Question();
            question.setQuestionDescription(request.getParameter("questionDescription"));
            question.setTopicId((String)session.getAttribute("topic_id"));
            question.setOptionA(request.getParameter("optionA"));
            question.setOptionB(request.getParameter("optionB"));
            question.setOptionC(request.getParameter("optionC"));
            question.setOptionD(request.getParameter("optionD"));

            question.setCorrectOption(request.getParameter("correctOption"));

            if(!question.addQuestion())
            {
                %>
                <script>
                    alert("There was some problem in inserting question to the topic, please try after some time!");
                    document.location.href="../topic_detail.jsp";
                </script>
                <%
            }else{
                %>
                <script>
                    alert("Question inserted to the topic!");
                    document.location.href="../topic_detail.jsp";
                </script>
                <%
            }
        }catch(Exception ex){
            System.out.println("controller/add question, "+ex.getMessage());
            %>
            <script>
                alert("There was some problem in inserting question to the topic, please try after some time!");
                document.location.href="../topic_detail.jsp";
            </script>
            <%
        }finally{
            Dbcon.close();
        }
    }
%>