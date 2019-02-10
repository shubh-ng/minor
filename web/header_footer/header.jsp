<%@include file="head.jsp" %>
<body>
    
 <nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <!-- Brand -->    
  <a class="navbar-brand" href="#">OnlineTest</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
          <a class="nav-link" href="#" style="position: relative;top: 22%;">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" style="position: relative;top: 22%;"">View Student Report</a>
      </li>
      <li class="nav-item">
          <form method="POST" action="controller/logout.jsp" onsubmit="return logoutConfirmation()">
              <button class="btn btn-danger" type="submit" style="position: relative;top: 22%;">Logout</button>
          </form>  
      </li>      
    </ul>
  </div> 
</nav>

    
    <script>
    function logoutConfirmation(){
        if(confirm("You will be logged out!")){
            return true;
        }else{
            return false;
        }
    }    
    </script>
