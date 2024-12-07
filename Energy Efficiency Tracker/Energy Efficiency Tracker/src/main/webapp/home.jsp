<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<% 

if(session.getAttribute("email") == null){
	   response.sendRedirect("login.jsp");
	
}
Object email = session.getAttribute("email");
// Query database to get user details
String dbUrl = "jdbc:mysql://localhost:3306/energy_efficiency_tracker";
String dbUser = "root";
String dbPassword = "test12345@#";
String user_id = "",name = "", emails = "", capacity = "", ac_type = "", mumbers = "", room_size = "";
try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
    String sql = "SELECT * FROM users WHERE email = '"+email+"'";
    PreparedStatement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery();
 
    while (rs.next()) {
    	user_id = rs.getString("id");
         name = rs.getString("name");
         emails = rs.getString("email");
         capacity = rs.getString("capacity");
         ac_type = rs.getString("ac_type");
         mumbers = rs.getString("mumbers");
         room_size = rs.getString("room_size");

    }
    
} catch (SQLException e) {
    e.printStackTrace();
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <style>
      #home{
	   background: url('./image.jpg') no-repeat center top;
	   background-size: cover;
       min-height: 600px;
       background-attachment: fixed;
      
     }
 
 
 </style>
</head>
<body style="background-color:#dff9fb">

<input type="hidden" id="user_name" value="<%= name %>">
<input type="hidden"  id="user_email"  value="<%= emails %>">
<input type="hidden"  id="user_capacity"  value="<%= capacity %>">
<input type="hidden"  id="user_ac_type"  value="<%= ac_type %>">
<input type="hidden"  id="user_members"  value="<%= mumbers %>">
<input type="hidden"  id="user_room_size"  value="<%= room_size %>">


<div class="p-5">
				<nav class="navbar  navbar-expand-lg bg-body-tertiary">
				  <div class="container-fluid">
				    <a class="navbar-brand" href="#">EF-Tracker(AC)</a>
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
				
<div id="home">
		<div style="color:white;text-align:center;padding-top:100px">
				
				<h1>Energy Efficiency Tracker</h1>
				<h4> Measure your Air conditioner's Bill <br>
				And Minimize your costing </h4>
				<h5> <%= capacity %> Ton</h5>
				<h5> <%= ac_type %></h5>
				<h5> <%= mumbers %> Persons</h5>
				<h5> <%= room_size %> Sq.Feet</h5>
				</div>
		
		</div>

</div>
<div class="p-5">
	<div class="text-center"><h1>Provide your inputs</h1>
	</div>
 	<div class="row">
 		<div class="col-2">
 			<div>
				<label class="form-label">Date</label>
				<input type="date" class="form-control form-control-sm" id="dates">
			</div>
 		</div>
 		<div class="col-2">
			<div>
				<label class="form-label">Hours</label>
				<input class="form-control form-control-sm" value="0" id="hours_use">
			</div>
					
 		</div>
 		 		<div class="col-2">
			<div>
				<label class="form-label">Mode</label>
				<select class="form-control form-control-sm" id="mode">
						<option value="cool">Cool</option>
						<option value="fan">Fan</option>
						<option value="turbo">Turbo</option>
						<option value="eco">Eco</option>
	
				</select>
			</div>
					
 		</div>
 		 		<div class="col-1">
			<div>
				<label class="form-label">Temp</label>
				<input type="number" class="form-control form-control-sm" min="16" max="32" id="temperature">
			</div>
					
 		</div>
 		
 		<div class="col-1">
			<div>
				<label class="form-label">Out Temp</label>
				<input type="number" class="form-control form-control-sm" min="16" max="32" id="out_temp">
			</div>
					
 		</div>
 		
 		
 		<div class="col-2">
			<div>
				<label class="form-label">Season</label>
						<select class="form-control form-control-sm" id="season">
						<option value="10">Summer</option>
						<option value="5">Winter</option>
						<option value="7">Rainy</option>
				
	
				</select>
			</div>
					
 		</div>
 			<div class="col-2">
			<div>
				<label class="form-label">Submit Data</label> <br>
				<button class="btn btn-success btn-sm" style="width:100%" onclick="doCalculaton()">Submit</button>
			</div>
					
 		</div>
 	</div>
</div>
<div class="p-5" id="calculaton_div">
			<div class="card mb-3" style="width: 100%;">
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src="image.jpg" class="img-fluid rounded-start" alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
		
			     <table class="table px-5 table-bordered border-dark">
					  <thead class="table-light">
					    <tr>			     
					      <td scope="col" style="text-align:center">Parameter</td>
					       <td scope="col" style="text-align:center">Date</td>
					    </tr>
					  </thead>
					  <tbody>
					      <tr>
							  <td scope="col" style="text-align:center">AC type</td>
							  <td scope="col" style="text-align:center"><%= ac_type %></td>
					    </tr>
					        <tr>
							  <td scope="col" style="text-align:center">Capacity</td>
							  <td scope="col" style="text-align:center"><%= capacity %> Ton</td>
					    </tr>
					        <tr>
							  <td scope="col" style="text-align:center">Persons</td>
							  <td scope="col" style="text-align:center"><%= mumbers %> Persons</td>
					    </tr>
					    	        <tr>
							  <td scope="col" style="text-align:center">Room Size</td>
							  <td scope="col" style="text-align:center"><%= room_size %> Sq Feet</td>
					    </tr>
					    <tr>
							  <td scope="col" style="text-align:center">Date</td>
							  <td scope="col" style="text-align:center"><span id="date_show"></span></td>
					    </tr>
					     <tr>
							     <td scope="col" style="text-align:center">Hours</td>
							     <td scope="col" style="text-align:center"><span id="hours_show"></span> Hours</td>
					    </tr> <tr>
							      <td scope="col" style="text-align:center">Mode</td>
							      <td scope="col" style="text-align:center"><span id="mode_show"></span> Mode</td>
					    </tr> <tr>
							    <td scope="col" style="text-align:center">Temperature</td>
							    <td scope="col" style="text-align:center"><span id="temparature_show"></span> °C</td>
					    </tr> <tr>
							  <td scope="col" style="text-align:center">Outside Temperature</td>
							  <td scope="col" style="text-align:center"><span id="out_temp_show"></span> °C</td>
					    </tr> <tr>
							 <td scope="col" style="text-align:center">Today's Used (KW)</td>
							 <td scope="col" style="text-align:center"><span id="today_used_show"></span> KW</td>
					    </tr>
					    <tr>
						 <td scope="col" style="text-align:center">Today Cost</td>
						 <td scope="col" style="text-align:center"><span id="today_cost_show"></span> TK</td>
					    </tr>
					    <tr>
							<td scope="col" style="text-align:center">Monthly Cost</td>
							<td scope="col" style="text-align:center"><span id="monthlyt_cost_show"></span> TK</td>
					    </tr>
					  </tbody>
					</table>
					
					<form action="storeData" method="post">
						<input type="hidden" name="user_id" value="<%= user_id %>">
						<input type="hidden" name="date_u" id="date_u" >
						<input type="hidden" name="hours_u" id="hours_u" >
						<input type="hidden" name="mode_u" id="mode_u" >
						<input type="hidden" name="temp_u" id="temp_u" >
						<input type="hidden" name="out_u" id="out_u" >
						<input type="hidden" name="today_usages_u" id="today_usages_u" >
						<input type="hidden" name="today_cost_u" id="today_cost_u" >
						<input type="hidden" name="monthly_cost_u" id="monthly_cost_u" >
					
						<button class="btn btn-success" type="submit" style="width:100%">Save</button>
					</form>
			      </div>
			    </div>
			  </div>
			</div>

</div>




<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
 <script>
 $("#calculaton_div").hide()
 function doCalculaton(){
	 $("#calculaton_div").show()
	// Variables
	 let date = $("#dates").val(); // e.g., 1.5
	 let ac_size = $("#user_capacity").val(); // e.g., 1.5
	 let ac_type = $("#user_ac_type").val(); // 'Inverter' or 'Non-inverter'
	 let ac_mode = $("#mode").val();
	 let hours = $("#hours_use").val(); // e.g., 5
	 let temperatures = $("#temperature").val(); // e.g., 25
	 let room_size = $("#user_room_size").val(); // e.g., 300 sq ft
	 let outside_temp = $("#out_temp").val(); // e.g., 35°C
	 let electricity_cost = 8; // Cost per kWh in BDT
	 let person = parseInt($("#user_members").val()); // Number of occupants (e.g., 4)
	
	 // Constants
	 const cooling_factor = 0.6; // kW per square foot
	 let reference_temp = parseInt($("#season").val());  // Reference factor for cooling load adjustment
	 const person_heat_watts = 120; // Heat produced by one person in watts
	 const watts_to_btu = 3.412; // Conversion factor: 1 W = 3.412 BTU/hr

	 // Person heat in BTU/hr
	 let person_heat_btu = person * person_heat_watts * watts_to_btu;

	 // Calculate cooling load
	 let cooling_load = (room_size * cooling_factor * (outside_temp - temperatures)) + person_heat_btu;

	 // AC EER (Efficiency Ratio)
	 let ac_eer;
	 if (ac_type === "inverter") {
	     ac_eer = 4.2; // Example EER for inverter
	 } else if (ac_type === "non-inverter") {
	     ac_eer = 3.2; // Example EER for non-inverter
	 }


	 // Calculate power required (kW)
	 let power = cooling_load / (ac_eer * 1000);

	 // Adjust power consumption based on mode
	 let mode_factor;
	 if (ac_mode === "cool") mode_factor = 1.0;
	 else if (ac_mode === "eco") mode_factor = 0.8;
	 else if (ac_mode === "turbo") mode_factor = 1.1;
	 else if (ac_mode === "fan") mode_factor = 0.3;

	 // Daily energy consumption (kWh)
	 let daily_consumption = power * mode_factor * hours;

	 // Daily and Monthly Cost
	 let daily_cost = daily_consumption * electricity_cost;
	 let monthly_cost = daily_cost * 30;

	 // Output results
	 // console.log("Daily Consumption (kWh):", daily_consumption.toFixed(2));
	 //console.log("Daily Cost (BDT):", daily_cost.toFixed(2));
	 // console.log("Monthly Cost (BDT):", monthly_cost.toFixed(2));

	 $("#date_show").text(date);
	 $("#hours_show").text(hours);
	 $("#mode_show").text(ac_mode);
	 $("#temparature_show").text(temperatures);
	 $("#out_temp_show").text(outside_temp);
	 $("#today_used_show").text(daily_consumption.toFixed(2));
	 $("#today_cost_show").text(daily_cost.toFixed(2));
	 $("#monthlyt_cost_show").text(monthly_cost.toFixed(2));
	 
	 
	 $("#date_u").val(date);
	 $("#hours_u").val(hours);
	 $("#mode_u").val(ac_mode);
	 $("#temp_u").val(temperatures);
	 $("#out_u").val(outside_temp);
	 $("#today_usages_u").val(daily_consumption.toFixed(2));
	 $("#today_cost_u").val(daily_cost.toFixed(2));
	 $("#monthly_cost_u").val(monthly_cost.toFixed(2));
 }
 
 </script>
</body>
</html>