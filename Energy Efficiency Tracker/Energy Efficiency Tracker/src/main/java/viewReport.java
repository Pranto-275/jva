

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/viewReport")
public class viewReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public viewReport() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String from_date = request.getParameter("from_date");
		String to_date = request.getParameter("to_date");
		  List<String[]> users = new ArrayList<>();
		  
		String conditions = "";
		
			if(user_id != "") {
				conditions += "AND user_id = '"+user_id+"'";
			}else {
				conditions += "AND date(date) BETWEEN '"+from_date+"' AND '"+to_date+"'";
			}
		
			
	
		
			try {
			 RequestDispatcher dispatcher = null;

				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_efficiency_tracker","root","test12345@#");
				Statement stmnt = con.createStatement();
			      String query = 
			                "SELECT datas.date, datas.id, datas.user_id, " +
			                "       (SELECT name FROM energy_efficiency_tracker.users u WHERE u.id = datas.user_id) AS user_name, " +
			                "       datas.hours, datas.mode, datas.temp, datas.out_temp, datas.today_use, datas.today_cost, datas.monthly_cost " +
			                "FROM energy_efficiency_tracker.ac_datas datas " +
			                "WHERE datas.id IN ( " +
			                "           SELECT MAX(id) " +
			                "           FROM energy_efficiency_tracker.ac_datas " +
			                "           WHERE DATE(date) = (SELECT MAX(DATE(date)) FROM energy_efficiency_tracker.ac_datas) " +
			                "           GROUP BY user_id " +
			                "       ) " +
			                "   OR DATE(datas.date) != (SELECT MAX(DATE(date)) FROM energy_efficiency_tracker.ac_datas) " + conditions
			                + "ORDER BY datas.date DESC";
	            ResultSet rs = stmnt.executeQuery(query);

	            // Process ResultSet
	            while (rs.next()) {
	            	System.out.println("asdf");
	                String[] user = new String[6]; // Adjust size if more columns are needed
	                user[0] = rs.getString("user_name"); // Replace column1 with actual column name
	                user[1] = rs.getString("date"); // Replace column2 with actual column name
	                user[2] = rs.getString("hours"); // Replace column3 with actual column name
	                user[3] = rs.getString("temp"); // Replace column3 with actual column name
	                user[4] = rs.getString("today_use"); // Replace column3 with actual column name
	                user[5] = rs.getString("today_cost"); // Replace column3 with actual column name
	                users.add(user);
	            }

				
	            // Close resources
	            rs.close();
	            stmnt.close();
	            con.close();

	            // Attach data to request and forward to JSP
	            request.setAttribute("users", users);
	            dispatcher = request.getRequestDispatcher("data.jsp");
	            dispatcher.forward(request, response);
				
			}catch(Exception e) {
				System.out.println("error found");
//				  response.sendRedirect("login.jsp");
			}
	}

}
