
$(document).ready(function(){   
    $("#address").hide();
    $("#security").hide();
    
    $("#header").html("Personal Details");
    $("#next1").click(validatePersonalDetail);
    $("#previous1").click(function(){
        $("#address").hide();
        $("#personal").show();
        $("#header").html("Personal Details");
    });
    $("#next2").click(validateAddressDetail);
    $("#previous2").click(function(){
        $("#security").hide();
        $("#address").show();
        $("#header").html("Residential Details");        
    });
});

function validatePersonalDetail(){
   var isFilled=false;
   
    if($("#fname").val()==""||$('input[name="gender"]:checked').length == 0||$("#lname").val()===""||$("#mainEmail").val()===""){
        isFilled = false;
        $("#error").text("Please fill all personal details!");
    }else
        isFilled = true;
    
    if(isFilled==true){
        $("#header").html("Residential Details");
        $("#personal").hide();
        $("#address").show();
        $("#error").text("");
    }
}

function validateAddressDetail(){
    
     var isFilled=false;
//     alert($("#country").find(":selected").text())
    if($("#add_line_1").val()===""||$("#district").val()===""||$("#country").find(":selected").text()==="Country"||$("#identification").find(":selected").text()==="Identification type"||$("#idNumber").val()===""){
        isFilled = false;
        $("#error1").text("Please fill all Address details!");
    }else{
        isFilled = true;
    }
    if(isFilled==true){
        $("#header").html("Security Details");
        $("#address").hide();
        $("#security").show();
        $("#error1").text("");
    }
    
}
