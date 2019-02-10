<%@page import="model.Group"%>
<%@page import="model.Student"%>
<%@page import="model.Dbcon"%>
<%
    if(request.getParameter("add_student")!=null){
        try{
            Dbcon.connect();
            Student student = new Student();
            if(!student.isStudentExists(request.getParameter("student_id"))){
                student.setStudId(request.getParameter("student_id"));
                student.setFname(request.getParameter("fname"));
                student.setPassword(request.getParameter("password"));
                student.createStudent();
                student.createStudentLogin();
                Group group = new Group();
                group.addStudent((String)session.getAttribute("group_id"), (String)session.getAttribute("username"), student.getStudId());
                %>
                <script>
                    alert("Student added!");
                    document.location.href="../addStudent.jsp";
                </script>
                <%
            }else{
                %>
                <script>
                    alert("Sorry, this student id already exists in our database, please try with another student id!");
                    document.location.href="../addStudent.jsp";
                </script>
                <%
            }
        }catch(Exception ex){
            System.out.println("controller/addStudent.jsp, 5:"+ex.getMessage());
            %>
            <script>
                alert("There was problem in adding student, please try again later.!");
                document.location.href="../addStudent.jsp";
            </script>
            <%
        }finally{
            Dbcon.close();
        }
    }
%>