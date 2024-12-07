

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/storeData")
public class storeData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public storeData() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String date = request.getParameter("date_u");
		String hours = request.getParameter("hours_u");
		String mode = request.getParameter("mode_u");
		String temp = request.getParameter("temp_u");
		String out = request.getParameter("out_u");
		String today_usages = request.getParameter("today_usages_u");
		String today_cost = request.getParameter("today_cost_u");
		String monthly_cost = request.getParameter("monthly_cost_u");
		
		try {
			 RequestDispatcher dispatcher = null;
	
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("error not found");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_efficiency_tracker","root","test12345@#");
			Statement stmnt = con.createStatement();
			int countrow = stmnt.executeUpdate("insert into ac_datas(user_id, date, hours, mode, temp, out_temp, today_use, today_cost, monthly_cost) values('"+user_id+"','"+date+"','"+hours+"','"+mode+"','"+temp+"','"+out+"','"+today_usages+"','"+today_cost+"','"+monthly_cost+"')");	
			dispatcher = request.getRequestDispatcher("home.jsp");
			response.sendRedirect("home.jsp");
				
		}catch(Exception e) {
			System.out.println("error found");
			
		}
	}

}
