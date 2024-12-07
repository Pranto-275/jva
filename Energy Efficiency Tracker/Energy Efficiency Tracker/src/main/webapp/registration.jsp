<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		.registration_form{
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
			<h2 style="margin-left:">Registration User</h2>
			<h4 style="margin-left:color:red" id="message_show"></h4>
			<div class="registration_form">
			<form action="registration" method="post">
				  <div >
				    <label for="" class="form-label">Name</label>
				     <input type="text" class="form-control" id="name" name="name">			
				  </div>
				  <div >
				    <label for="" class="form-label">Email</label>
				    <input type="email" class="form-control" id=""  name="email">			
				  </div>
				   <div >
				    <label for="" class="form-label">Phone</label>
				    <input type="number" class="form-control" id=""  name="phone">			
				  </div>
				  <div >
				    <label for="" class="form-label">Capacity</label>
				    	<select class="form-select"  name="capacity">
				    	<option value="">Select Capacity</option>
							<option value="1">1 Ton</option>
							<option value="1.5">1.5 Ton</option>
							<option value="2">2 Ton</option>
							<option value="2.5">2.5 Ton</option>
				    	</select>		
				  </div>
				  <div >
				    <label for="" class="form-label">AC Type</label>
				    	<select class="form-select"  name="ac_type">
				    	<option value="">Select Type</option>
							<option value="inverter">Inverter</option>
							<option value="Non-inverter">Non-Inverter</option>
				    	</select>		
				  </div>
				  
				   <div >
				    <label for="" class="form-label">Members</label>
				    <input type="number" class="form-control" id=""  name="members">			
				  </div>		
				     <div >
				    <label for="" class="form-label">Room Size (SQ feet)</label>
				    <input type="number" class="form-control" id=""  name="room_size">			
				  </div>
				  
				  <div >
				    <label for="" class="form-label">Password</label>
				    <input type="password" class="form-control" id=""  name="password">			
				  </div>
				  
				  
				  <div >
				    <label for="" class="form-label">Confirm password</label>
				    <input type="password" class="form-control" id=""  name="c_password">			
				  </div>
				  
				  
				  <div style="padding-top:10px">
				  	<button type="submit" class="btn btn-success" style="width:100%">Submit</button>
				  </div>
				 <div style="text-align:center;padding-top:5px">
				  <span>already have account? <a href="login.jsp">Login</a> </span>
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
  	if(status == "Success"){
  		$("#message_show").text("Successfully Register User");
  	}else if(status == "failed"){
  		$("#message_show").text("Error In Register!!");
  	}
  
  </script>
</body>
</html>