<%@page import="java.io.IOException"%>
<%
        String topicId = request.getParameter("topicId");
        String topicName = request.getParameter("topicName");
        session.setAttribute("topic_id", topicId);
        session.setAttribute("topic_name", topicName);
        try {
            response.sendRedirect("../topic_detail.jsp");
        } catch (IOException ex) {
            System.out.println("File ViewTopic.java, line: 21:"+ex.getMessage());
        }
%>