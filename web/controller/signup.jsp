<%@page import="model.Dbcon"%>
<%@page import="model.Examiner"%>
<%   
    try{
            Dbcon.connect();
            Examiner examiner = new Examiner();

    //        setting personal details
            examiner.setFname(request.getParameter("fname"));
            examiner.setLname(request.getParameter("lname"));
            examiner.setGenderId(request.getParameter("gender"));

    //        setting address details
            examiner.setAddLine1(request.getParameter("address_line_1"));
            examiner.setDistrict(request.getParameter("district"));
            examiner.setCountry(request.getParameter("country"));
            examiner.setCity(request.getParameter("city"));
            examiner.setState(request.getParameter("state"));

    //        setting identification details
            examiner.setIdType(Integer.parseInt(request.getParameter("identification")));
            examiner.setIdValue(request.getParameter("identification_value"));
            examiner.setMainEmail(request.getParameter("mainEmail"));
            examiner.setOptEmail(request.getParameter("optionalEmail"));

    //        setting auth details
            examiner.setPassword(request.getParameter("password"));
            examiner.setSecurityQuestion(request.getParameter("securityQuestion"));
            examiner.setSecurityAnswer(request.getParameter("securityAnswer"));
            
            if(examiner.signup()){
                %>
                <script>
                    alert("Account created successfully, please login!");
                    document.location.href='../login.jsp';
                </script>
                <%
            }else{
                %>
                <script>
                    alert("There was problem in creating account, please try again later!");
                    document.location.href='../signup.jsp';
                </script>
                <%
            }
                
    }catch(Exception ex){
        System.out.println("view/signup.jsp: "+ex.getMessage());
        %>
        <script>
            alert("There was problem in creating account, please try again later!");
            document.location.href='../signup.jsp';
        </script>
        <%
    }finally{
        Dbcon.close();
    }
%>