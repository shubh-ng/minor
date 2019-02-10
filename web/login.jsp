<%@page import="model.Dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Role"%>
<%@include file="./header_footer/head.jsp" %>
<div class="modal-dialog" style="box-shadow: 15px 15px 10px rgba(0,0,0,0.2)">
		<div class="modal-content" style="padding: 10px;" >
				<h2 class="text-center btn btn-primary blue-gradient">Login</h2>
                                <strong class="alert alert-danger text-center" id="userError" style="display: none"></strong>
			<hr />
                        <div class="modal-body ">
                            <form id="login-form" action="controller/login.jsp" method="POST">
					<div class="form-group">
                                            
                                                <!--username-->
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-user"></span>
							</span>
							<input type="text" class="form-control" name="username" placeholder="User Name" id="username" required/>
                                                </div>
                                                <!--username END-->
                                                
                                                <br>
                                                <!--password-->
                                                <div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-lock"></span>
							</span>
							<input type="password" class="form-control" name="password" placeholder="Password" id="password" required/>
						</div>
                                                <!--password END-->
                                        </div>

                                    <!--Obtaining Roles from database-->
                                    <%!Integer roleId;String roleName;%>
                                    <%
                                        try{
                                            Dbcon.connect();
                                            ResultSet roles= Role.getRoles();
                                            while(roles.next()){
                                                roleId = roles.getInt("role_id");
                                                roleName = roles.getString("role_name");
                                    %>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" value="<%=roleId%>" id="role" name="role" required>
                                            <label class="custom-control-label" style="text-transform: capitalize" for="role" ><%=roleName%></label>
                                        </div>
                                    <%
                                            }
                                        }catch(Exception ex){
                                            System.out.println("login view, 30:"+ex.getMessage());
                                        }finally{
                                            Dbcon.close();
                                        }
                                    %>
                                    <!--Obtaining Roles from database END-->
                                        
                                    <!--forgot password link-->
					<div class="form-group text-center">
						<button type="submit" name="login" class="btn blue-gradient btn-lg">Login</button>
						<a href="#" class="btn btn-link">forget Password</a>
					</div>
                                    <!--forgot password link END-->
                                </form>
                                    <!--Sign up link-->
					<div class="form-group text-center">
                                            <strong>Don't have account?</strong> <a href="signup.jsp" class="btn btn-info">Sign up</a>
					</div>
                                    <!--sign up link END-->
                                
			</div>
		</div>
</div>
                                    
<!--login validation script-->
<script>
    $(document).ready(function(){
        var userFlag = true;
        var passFlag = true;
        $("#username").keyup(function(){
            if($("#username").val().match(/[#$%^&*()_+~`']/)){
                userFlag = false;
                $("#userError").css({display:"inline"})
                $("#userError").text("Special character is not allowed in username.")
            }else{
                userFlag = true;
                $("#userError").css({display:"none"})
                $("#userError").text("")
            }
        })
    })
</script>
<!--login validation script END-->

<%@include file="./header_footer/footer.jsp" %>