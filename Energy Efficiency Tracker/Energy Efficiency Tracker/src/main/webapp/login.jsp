<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		.login_form{
		width: 500px;
		background-color: #dff9fb;
		padding: 20px;
		
		}
	
	</style>

</head>
<body style="background-color:skyblue">
<div>
	<input type="hidden" id ="message" value="<%= request.getAttribute("status") %>">
	<div class="d-flex justify-content-center">
		<div class="">
			<h2  style="margin-left:">Energy Efficiency Tracker (AC)</h2>
			<h2 style="margin-left:">Login User</h2>
			<h4 style="margin-left:color:red" id="message_show"></h4>
			<div class="login_form">
			<form action="login" method="post">

				  <div >
				    <label for="" class="form-label">Email</label>
				    <input type="email" class="form-control" id=""  name="email">			
				  </div>
				     <div >
				    <label for="" class="form-label">Password</label>
				    <input type="password" class="form-control" id=""  name="password">			
				  </div>
				  <div style="padding-top:10px">
				  	<button type="submit" class="btn btn-success" style="width:100%">Submit</button>
				  </div>
				 <div style="text-align:center;padding-top:5px">
				  <span>Don't have account? <a href="registration.jsp">Register</a> </span>
				 </div>
			</form>
							
			
			</div>
			
			
		</div>
	
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script>
  	let status = $("#message").val();
  	console.log(status)
	 if(status == "failed"){
  		$("#message_show").text("Invalid User!!");
  	}
  
  </script>
</body>
</html>