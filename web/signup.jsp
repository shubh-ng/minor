<%@include file="./header_footer/head.jsp" %>
  
<script src="./js/signup.js"></script>

<!--signup code start-->
<div class="modal-dialog">
    <div class="modal-content" style="padding: 10px;" >
                           
        <h2 class="text-center btn btn-primary blue-gradient" id="header"></h2>
            <hr />

            <div class="modal-body ">
                <form action="controller/signup.jsp" method="POST">
                        <!--personal details-->
                        <div class="form-group" id="personal">
                            <span id="error" class="text-danger"></span>
                            <!--first name-->
                            <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                    <input type="text" class="form-control" name="fname" placeholder="First name" id="fname" required/>
                                </div>
                            <!--first name END-->
                                <br>
                            <!--last name-->
                            <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                    </span>
                                    <input type="text" class="form-control" name="lname" placeholder="Last name" id="lname" required/>
                            </div>
                            <!--last name END-->
                            <br>    

                            <!--gender-->
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input gender" value="1" id="male" name="gender">
                                <label class="custom-control-label" style="text-transform: capitalize" for="1" >Male</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input gender" value="2" id="female" name="gender">
                                <label class="custom-control-label" style="text-transform: capitalize" for="2" >Female</label>
                            </div>
                            <!--gender END-->
                            <br>
                            
                            <!--main email-->
                            <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                    <input type="email" class="form-control" name="mainEmail" placeholder="Main email id" id="mainEmail" required/>
                                </div>
                            <!--main email END-->
                            <br>
                            
                            <!--optional email-->
                            <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                    <input type="email" class="form-control" name="optionalEmail" placeholder="Optional email id" id="optEmail"/>
                                </div>
                            <!--optional email END-->
                            <br>
                            
                            <div class="form-group text-center">
                                <button type="button" name="next" id="next1" class="btn blue-gradient btn-lg">Next</button>
                                    <!--<a href="#" class="btn btn-link">forget Password</a>-->
                            </div>
                        </div>
                        <!--personal details END-->

                        <!--address details-->
                        <div class="form-group" id="address">
                            <span id="error1" class="text-danger"></span>
                            <!--Address line 1-->
                            <div class="input-group">
                                <div class="input-group-prepend">
                                  <span class="input-group-text">Address line 1</span>
                                </div>
                                <textarea id="add_line_1" name="address_line_1" class="form-control" aria-label="With textarea"></textarea>
                            </div>
                            <!--Address line 1 END-->
                                <br>
                            <!--District-->
                            <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                    </span>
                                    <input type="text" class="form-control" name="district" placeholder="District" id="district" required/>
                            </div>
                            <!--District END-->
                            <br>    

                            <!--Country-->
                            <div class="custom-control custom-radio">
                                <select id="country" name="country">
                                    <option value="">Country</option>
                                    <option value="india">India</option>
                                    <option value="australia">Australia</option>
                                    <option value="newzeland">Newzeland</option>
                                    <option value="pakistan">Pakistan</option>                                    
                                </select>
                            </div>
                            <!--Country END-->
                            <br>
                            
                            <!--City-->
                            <div class="custom-control custom-radio">
                                <select id="city" name="city">
                                    <option value="">City</option>
                                    <option value="india">India</option>
                                    <option value="australia">Australia</option>
                                    <option value="newzeland">Newzeland</option>
                                    <option value="pakistan">Pakistan</option>                                    
                                </select>
                            </div>
                            <!--City END-->
                            <br>
                            
                            
                            <!--State-->
                            <div class="custom-control custom-radio">
                                <select id="state" name="state">
                                    <option value="">State</option>
                                    <option value="india">India</option>
                                    <option value="australia">Australia</option>
                                    <option value="newzeland">Newzeland</option>
                                    <option value="pakistan">Pakistan</option>                                    
                                </select>
                            </div>
                            <!--State END-->
                            <br>
                            
                            <!--Identification type-->
                            <div class="custom-control custom-radio">
                                <select id="identification" name="identification">
                                    <option value="">Identification type</option>
                                    <option value="1">Aadhar card</option>
                                    <option value="4">Pan card</option>
                                    <option value="3">Voter id</option>
                                    <option value="2">License</option>                                    
                                </select>
                            </div>
                            <!--Identification type END-->
                            <br>
                            
                            <!--Identification value-->
                                <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                    <input type="text" class="form-control" name="identification_value" placeholder="Enter identification number" id="idNumber" required/>
                                </div>
                            <!--Identification value END-->
                            <br>
                            
                            <div class="form-group text-center">
                                <button type="button" name="next" id="previous1" class="btn blue-gradient btn-lg">Previous</button>                                
                                <button type="button" name="next" id="next2" class="btn blue-gradient btn-lg">Next</button>
                                    <!--<a href="#" class="btn btn-link">forget Password</a>-->
                            </div>
                        </div>
                        <!--address details END-->
                        
                        <!--security details-->
                        <div class="form-group" id="security">
                            <span id="error1" class="text-danger"></span>
                                <br>
                            <!--Security question-->
                            <div class="custom-control custom-radio">
                                <select id="securityQuestion" name="securityQuestion" required>
                                    <option value="">Security question</option>
                                    <option >Pet name</option>
                                    <option>Nick name</option>
                                    <option>Year of birth</option>
                                    <option>Place of birth</option>                                    
                                </select>
                            </div>
                            <!--Country END-->
                            
                            <br>
                            
                            <!--Security Answer-->
                            <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                    </span>
                                    <input type="text" class="form-control" name="securityAnswer" placeholder="Security Answer" id="security_answer" required/>
                            </div>
                            <!--Security Answer END-->

                            <br>
                            
                            <!--Password-->
                            <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                    </span>
                                    <input type="password" class="form-control" name="password" placeholder="Enter password" id="password" required/>
                            </div>
                            <!--Password END-->
                            
                            <br>
                            
                            <!--Confirm Password-->
                            <div class="input-group">
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                    </span>
                                    <input type="password" class="form-control" name="confirm_password" placeholder="Confirm password" id="confirm_password" required/>
                            </div>
                            <!--Confirm Password END-->
                            
                            <br>
                            
                            <div class="form-group text-center">
                                <button type="button" name="next" id="previous2" class="btn blue-gradient btn-lg">Previous</button>                                
                                <button type="submit" name="signup" class="btn blue-gradient btn-lg">Sign up</button>
                                    <!--<a href="#" class="btn btn-link">forget Password</a>-->
                            </div>
                        </div>
                        <!--security details END-->                        
                    </form>
            </div>
        <!--login link-->
        <div class="form-group text-center">
            <strong>Already a user?</strong> <a href="login.jsp" class="btn btn-info">Login</a>
        </div>
        <!--login link END-->        
    </div>
    
</div>
<!--signup code END-->


<%@include file="./header_footer/footer.jsp" %>