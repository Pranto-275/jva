

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public login() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
			try {
				 RequestDispatcher dispatcher = null;

				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_efficiency_tracker","root","test12345@#");
				Statement stmnt = con.createStatement();
				ResultSet countrow = stmnt.executeQuery("SELECT * FROM users where email = '"+ email+"' AND password = '"+password+"'");
				
				if(countrow.next()) {
					//System.out.println("hello");
			        HttpSession session = request.getSession();
			        session.setAttribute("email", email);
			        response.sendRedirect("home.jsp");
			       
				}else {
					dispatcher = request.getRequestDispatcher("login.jsp");
					request.setAttribute("status", "failed");
					dispatcher.forward(request, response);
				}
				
			}catch(Exception e) {
				System.out.println("error found");
				  response.sendRedirect("login.jsp");
			}
		
	}

}
