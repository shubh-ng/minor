<%@page import="model.Dbcon"%>
<%@page import="session.SessionCheck"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Group"%>
<%
if(SessionCheck.checkSession(request)){
%>
<%@include file="header_footer/header.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <a class="btn btn-info" href="group_detail.jsp" style="position: relative;top: 22%;">Back</a>
        </div>
    </div>    <br>
    <div class="row">
        <div class="col-lg-12">
            <h3 class="text-white">Add students to group : <%=(String)session.getAttribute("group_name")%></h3>
            <form action="controller/addStudent.jsp" onsubmit="return confirmIt()">
            <table class="table" id="studentTable">
                <tr>
                    <th class="text-white">#</th>
                    <th style="text-transform: uppercase" class="text-white">Student ID</th>
                    <th style="text-transform: uppercase" class="text-white">Student Name</th>
                    <th style="text-transform: uppercase" class="text-white">Student Password</th>
                    <th style="text-transform: uppercase" class="text-white">Action</th>
                </tr>
                <tr>
                    <td style="text-transform: uppercase" class="text-white">1</td>
                    <td>
                        <input type="text" name="student_id" placeholder="ID" required>
                    </td>
                    <td>
                        <input type="text" name="fname" placeholder="Name" required>
                    </td>
                    <td>
                        <input type="text" name="password" placeholder="Password" required>    
                    </td>
                    <td>
                        <button type="submit" name="add_student" class="btn btn-info">Add</button>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>



<script>
function confirmIt(){
    if(confirm("Do you really want to add?")){
        return true;
    }else{
        return false;
    }
}    
</script>


<!--<script>
    $("#addNext").click(addNextRow);
    
    var rowIndex=2;
    var SID=2;
    
    function validateRow(row) {
        let cell = row.cells[1].children[0].value;
        let cell1 = row.cells[2].children[0].value;
        let cell2 = row.cells[3].children[0].value;
        if(cell!=="" && cell1!=="" && cell2!=="")
            return true;
        else
            return false;
    }
    
    
    
    function addNextRow(){
        let table = document.getElementById("studentTable");
        
//        take value from row of table
//        table.rows[1].cells[1].children[0].value

        if(validateRow(table.rows[rowIndex-1])) {
      
            let row = table.insertRow(rowIndex);
            let cell=row.insertCell(0);
            let cell1=row.insertCell(1);
            let cell2=row.insertCell(2);
            let cell3=row.insertCell(3);

            cell.innerHTML = SID;
            cell1.innerHTML = '<input type="text" id="id" placeholder="ID">';
            cell2.innerHTML = '<input type="text" id="name" placeholder="Name">';
            cell3.innerHTML = '<input type="text" id="password" placeholder="Password">';
            SID++;
            rowIndex++;
        }
            
    }
</script>-->


<%
}else{
    %>
    <script>
    alert("Login session expired, Continue to login");
    location.href="login.jsp";
    </script>
    <%
}
%>
<%@include file="header_footer/footer.jsp" %>


