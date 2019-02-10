<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Dbcon"%>
<%
    if(request.getParameter("login")!=null){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        System.out.println(username);
        System.out.println(password);
        String query;
        if(role.equals("1"))
            query = "select * from login where user_id='"+username+"' and password='"+password+"' and role_id='"+role+"'";
        else
            query = "select * from student_login where stud_id='"+username+"' and password='"+password+"'";
//        System.out.println(username+":"+password+":"+role);
        try {
            Dbcon.connect();
            ResultSet rs = Dbcon.retrive(query);
            if(rs.next()){
                //login success
                session.setAttribute("username", username);
                session.setAttribute("password", password);
                session.setAttribute("role", role);
                System.out.println(username);
                if(role.equals("1"))
                    response.sendRedirect("../home.jsp");
                else
                    response.sendRedirect("../studentHome.jsp");
            }else{
                //login failure
                %>
                <script>
                    alert("Incorrect username/password!");
                    location.href="../login.jsp";
                </script>
                <%
            }
        } catch (SQLException ex) {
            System.out.println("Login servlet, line 35:"+ex.getMessage());
        } catch (IOException ex) {
            System.out.println("Login servlet, line 38:"+ex.getMessage());
        }finally{
            Dbcon.close();
        }
    }
%>