
<br><br>
<!-- A grey horizontal navbar that becomes vertical on small screens -->
    <nav class="navbar bg-primary footer" style="position:fixed;bottom: 0;width: 100%">

        <!-- Links -->
        <ul class="navbar-nav text-center">
            <h4 style="color:white">Copyright 2019</h4>
        </ul>
    </nav>
<script>
$(document).ready(function(){
	// toggling create group form
	flag = false;
	$('#create').hide()
	$('#createBtn').click(function(){
		if(!flag){
			$('#create').show()
			flag = true;
		}else{
			$('#create').hide()
			flag = false;
		}
	})

	// toggling create group form END

})

</script>

    </body>
</html>
