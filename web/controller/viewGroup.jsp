<%@page import="java.io.IOException"%>
<%
    if(request.getParameter("view_group")!=null){
        String group_id = request.getParameter("groupId");
        String group_name = request.getParameter("groupName");
        session.setAttribute("group_id", group_id);
        session.setAttribute("group_name", group_name);
        try {
            response.sendRedirect("../group_detail.jsp");
        } catch (IOException ex) {
            System.out.println("ViewGroup jsp, 8 line:"+ex.getMessage());
        }
    }
%>