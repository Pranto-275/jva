<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Report</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css">


</head>
<body   style="background-color:#dff9fb">
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

			<div style="background-color:white;padding:15px">
			    <table id="example" class="display" style="width:100%">
       <thead>
        <tr>
        	<th style="text-align:center">Serial</th>
            <th style="text-align:center">User Name</th>
            <th style="text-align:center">Date</th>
            <th style="text-align:center">Hours</th>
            <th style="text-align:center">Temperature</th>
            <th style="text-align:center">Daily Use</th>
            <th style="text-align:center">Daily Cost</th>
        </tr>
        </thead>
        <tbody>
                <% 
             
            // Retrieve the users list from the request attribute
            List<String[]> users = (List<String[]>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
            	int counter = 1;
                for (String[] user : users) {
        %>
        <tr>
        	<td style="text-align:center"><%= counter++ %></td>
            <td style="text-align:center"><%= user[0] %></td>
            <td style="text-align:center"><%= user[1] %></td>
            <td style="text-align:center"><%= user[2] %></td>
            <td style="text-align:center"><%= user[3] %></td>
            <td style="text-align:center" class="daily_use"><%= user[4] %></td>
            <td style="text-align:center" class="daily_cost"><%= user[5] %></td>
        </tr>
        <% 
       
                }
            }  
        %>
       </tbody>
                            <tfoot>
                                <tr style="border:1px solid #d3d3d3;">
                                    <td colspan="5" style="font-family: Arial Narrow; font-size:14px; border:1px solid #d3d3d3; font-weight:bold;">
                                        <div align="right">Grant Total:</div>
                                    </td>
                                    <td >
                                        <div align="center" id="daily_use_t"></div>
                                    </td>
                                    <td>
                                        <div align="center" id="daily_cost_t"></div>
                                    </td>

                                </tr>

                            </tfoot>
    </table>
			</div>
   </div> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
 
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
       <script>
     
       $(document).ready(function() {
           $('#example').DataTable({
			 "fnDrawCallback": function() {


                   var sum = 0;
                   $('.daily_use').each(function(i, obj) {
                       sum += parseFloat($(this).text());
                   })
                   document.getElementById("daily_use_t").innerHTML = sum.toFixed(2);


                   var sum = 0;
                   $('.daily_cost').each(function(i, obj) {
                       sum += parseFloat($(this).text());
                   })
                   document.getElementById("daily_cost_t").innerHTML = sum.toFixed(2);

    

               },
               
           });

       });
 
    </script>
    
</body>
</html>
