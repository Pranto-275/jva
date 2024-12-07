<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Parameter</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
	
	#form_box{
		width:"500px";
		background-color: #dfe6e9;
	}
	
	</style>
</head>
<body  style="background-color:#dff9fb">

<div class="p-5">
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				  <div class="container-fluid">
				    <a class="navbar-brand" href="#">AC</a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
				    <div class="collapse navbar-collapse" id="navbarText">
				      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
				        <li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link" href="report.jsp">Report</a>
				        </li>
				
				      </ul>
				      <span class="navbar-text">
				      <%=session.getAttribute("email") %>
				        <a href="logout" class="btn btn-danger btn-sm text-light">Logout</a>
				      </span>
				    </div>
				  </div>
				</nav>
		
		<div class="d-flex justify-content-center">
			<div>	
					<div id="form_box"  class="p-5">
						<h3  class="text-center">User Report</h3>
					<form action="viewReport" method="post">
							<div class="row">
							  <div class="col">
							  	<label class="form-label">User ID</label>
							    <input type="number" class="form-control" placeholder="First name" aria-label="User ID" name="user_id">
							  </div>
							  <div class="col">
							    	<label class="form-label">User Name</label>
							  
							    <input type="text" class="form-control" placeholder="Last name" aria-label="User Name" name="user_name">
							  </div>
							</div>
							<div  class="row">
							  <div class="col">
							    	<label class="form-label">From Date</label>
							  
							    <input type="date" class="form-control" placeholder="First name" aria-label="From Date" name="from_date">
							  </div>
							  <div class="col">
							    	<label class="form-label">To Date</label>
							  
							    <input type="date" class="form-control" placeholder="Last name" aria-label="To Date" name="to_date">
							  </div>
							</div>
							<div class="text-end pt-2">
								<button class="btn btn-success btn-sm" type="submit">Search</button>
							</div>
							
					</form>
				</div>
			</div>
				
		</div>
				
</div>
	
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
 
</body>
</html>