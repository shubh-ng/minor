
<%@page import="model.Dbcon"%>
<%@page import="model.Question"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Topic"%>
<%@page import="session.SessionCheck"%>
<%
if(SessionCheck.checkSession(request)){
%>
<%@include file="header_footer/header.jsp" %>
<%
    String topicId = (String)session.getAttribute("topic_id");
//    System.out.println("Topicid:"+topicId);
    String topicName = (String)session.getAttribute("topic_name");
%>
<nav class="blue-gradient text-white text-center" style="padding: 10px;">
    <a class="btn btn-info" href="group_detail.jsp" style="float: left;position: relative;bottom: 8px;">Back</a>
<h3 style="text-transform: capitalize;"><strong>Topic Name : <%=topicName%></strong>	</h3>	
</nav>

	<div class="col-lg-12 text-center" style="width: 100%">
		<button type="button" class="btn peach-gradient btn-primary" id="createBtn" style="font-size: 20px;"><i class="fa fa-plus pr-2" aria-hidden="true"  style="font-size: 20px"></i> Insert Question</button>
        </div>

	<!-- add question form -->
	<div class="row" id="create">
		<div class="col-lg-12">

                        <!-- Question form end -->
                        <form action="controller/addQuestion.jsp" method="POST" onsubmit="return validateQuestionForm()" class="text-center border border-light p-5">
                            <input type="hidden" name="topicId" value="<%=topicId%>">
                        <p class="h4 mb-4">Insert Question</p>

                        <!-- Question Description -->

                                <div class="input-group">
                                <div class="input-group-prepend">
                                        <span class="input-group-text text-white unique-color">Question</span>
                                </div>
                                    <textarea name="questionDescription" title="Enter question" class="form-control" aria-label="With textarea" required></textarea>
                                </div>

                                <!-- option A -->
                        <div class="input-group mb-3">
                          <div class="input-group-prepend">
                            <span class="input-group-text bg-primary text-white" id="basic-addon1">A.</span>
                          </div>
                            <input name="optionA" title="Enter first option for the question" type="text" class="form-control" placeholder="Option A" aria-label="Option A" aria-describedby="basic-addon1" required>
                        </div>

                                <!-- option B -->
                        <div class="input-group mb-3">
                          <div class="input-group-prepend">
                            <span class="input-group-text bg-primary text-white" id="basic-addon1">B.</span>
                          </div>
                          <input name="optionB" title="Enter second option for the question" type="text" class="form-control" placeholder="Option B" aria-label="Option B" aria-describedby="basic-addon1" required>
                        </div>

                                <!-- option C -->
                        <div class="input-group mb-3">
                          <div class="input-group-prepend">
                            <span class="input-group-text bg-primary text-white" id="basic-addon1">C.</span>
                          </div>
                          <input name="optionC" title="Enter third option for the question" type="text" class="form-control" placeholder="Option C" aria-label="Option C" aria-describedby="basic-addon1" required>
                        </div>

                        <!-- option D -->
                        <div class="input-group mb-3">
                          <div class="input-group-prepend">
                            <span class="input-group-text bg-primary text-white" id="basic-addon1">D.</span>
                          </div>
                          <input name="optionD" title="Enter fourth option for the question" type="text" class="form-control" placeholder="Option D" aria-label="Option D" aria-describedby="basic-addon1" required>
                        </div>

                        <div class="input-group mb-3">
                          <div class="input-group-prepend">
                            <label class="input-group-text text-white bg-success" for="inputGroupSelect01">Choose Correct Option</label>
                          </div>
                            <select class="custom-select" id="correctOption" name="correctOption">
                            <option value="null">Correct Option</option>
                            <option value="a">A</option>
                            <option value="b">B</option>
                            <option value="c">C</option>
                            <option value="d">D</option>
                          </select>
                        </div>


	    	<!-- Create button -->
                <button name="addQuestion" id="createQuestion" class="btn btn-primary btn-block my-4" type="submit">Create</button>
	    	</div>
		</form>
		<!-- Question form end -->
		<script>
			
		function validateQuestionForm(){
			if($("#correctOption").children("option:selected").val()=="null"){
				alert("Choose correct option can't be empty")
				return false;
			}
		}
		</script>
	</div>
<!-- end -->





<!-- show questions -->

<div class="container">
	<div class="row">
<%Integer count=1;%>
<%
    try{
        Dbcon.connect();
        Question question = new Question();
        ResultSet questions = question.getQuestions(topicId);
        boolean questionAvailable=false;
        
        while(questions.next()){
            questionAvailable=true;
            String a="",b="",c="",d="";
            String correctOption = questions.getString("correct_option");
            if(correctOption.equals("a"))
                a = "bg-success";
            else if(correctOption.equals("b"))
                b = "bg-success";
            else if(correctOption.equals("c"))
                c = "bg-success";
            else if(correctOption.equals("d"))
                d = "bg-success";
%>
		<div class="col-lg-12 alert question text-white primary-color">
			<!-- delete question form -->
                        <form action="controller/deleteQuestion.jsp" method="POST" onsubmit="return deleteConfirm()">
				<input type="hidden" name="quest_id" value="<%=questions.getString("quest_id")%>" required>
                                <button name="delete_question" class="btn btn-danger" style="float: right;">Delete</button>
			</form>
			<!-- delete question form -->
                        <br><br>
			<!-- update question form -->
			<form>
                            <input type="hidden" name="questionId" value="<%=questions.getString("quest_id")%>" required>
					<span class="peach-gradient">&nbsp;Q.<%=count%>&nbsp;</span>&nbsp;&nbsp;
					<span>
                                            <%=questions.getString("ques_desc")%>
					</span>
				<div class="alert stylish-color">

				<button type="submit" class="btn unique-color">Edit</button>
					<div class="input-group">
					  <div class="input-group-prepend ">
					    <div class="input-group-text <%=a%>">
					      <span>A</span>
					    </div>
					  </div>	
					  <input readonly type="text" value="<%=questions.getString("option_a")%>" class="form-control">
					</div><br>


					<div class="input-group">
					  <div class="input-group-prepend">
					    <div class="input-group-text <%=b%>">
					      <span>B</span>
					    </div>
					  </div>	
                                            <input readonly type="text" value="<%=questions.getString("option_b")%>" class="form-control" >
					</div><br>

					<div class="input-group">
					  <div class="input-group-prepend">
					    <div class="input-group-text <%=c%>">
					      <span>C</span>
					    </div>
					  </div>	
					  <input readonly type="text" value="<%=questions.getString("option_c")%>" class="form-control" >
					</div><br>


					<div class="input-group">
					  <div class="input-group-prepend">
					    <div class="input-group-text <%=d%>">
					      <span>D</span>
					    </div>
					  </div>	
					  <input readonly type="text" value="<%=questions.getString("option_d")%>" class="form-control" >
					</div>
				</div>
                        </form>
		</div>
			<!-- update question form END-->
<%
        count++;
        }
        if(!questionAvailable){
            %>
            <h3 style="color: white;">There are no questions, please create by clicking <b>INSERT QUESTION</b> button above.</h3>            
            <%
        }    
    }catch(Exception ex){
        System.out.println("view/topic_detail, "+ex.getMessage());
    }finally{
        Dbcon.close();
    }
%>
	</div>



</div>

        <script>
            function deleteConfirm(){
                if(confirm("Do you really want to delete?")){
                    return true;
                }else{
                    return false;
                }
            }
        </script>

<!-- show question end -->
<%@include file="header_footer/footer.jsp" %>


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