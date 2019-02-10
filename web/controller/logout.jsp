<%@page import="java.io.IOException"%>
<%@page import="session.ExpireSession"%>
<%
        ExpireSession.expireSession(request);
        try {
            response.sendRedirect("../login.jsp");
        } catch (IOException ex) {
            System.out.println("Logout servlet, line 18:"+ex.getMessage());
        }
%>