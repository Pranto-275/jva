

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

@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public registration() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String capacity = request.getParameter("capacity");
		String ac_type = request.getParameter("ac_type");
		String members = request.getParameter("members");
		String room_size = request.getParameter("room_size");
		String password = request.getParameter("password");
		String c_password = request.getParameter("c_password");
		
		try {
			 RequestDispatcher dispatcher = null;

//			System.out.println("error not found");
//			System.out.println(name);
//			System.out.println(email);
//			System.out.println(phone);
//			System.out.println(capacity);
//			System.out.println(ac_type);
//			System.out.println(members);
//			System.out.println(room_size);
//			
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("error not found");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_efficiency_tracker","root","test12345@#");
			Statement stmnt = con.createStatement();
			int countrow = stmnt.executeUpdate("insert into users(name,email,phone,capacity,ac_type,mumbers,room_size,password) values('"+name+"','"+email+"','"+phone+"','"+capacity+"','"+ac_type+"','"+members+"','"+room_size+"','"+password+"')");	
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(countrow > 0) {
				request.setAttribute("status", "Success");
			}else {
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
				
		}catch(Exception e) {
			System.out.println("error found");
			
		}
	}

}
