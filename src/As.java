

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.lang.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class As
 */
@WebServlet("/As")
public class As extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public As() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   PrintWriter out=response.getWriter();
	   response.setContentType("text/html");
		
	
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		
		/*
		 * String driver=; String url=; String id=""; String password="lit";
		 */
		 try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		out.println("hello2");
		Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
		out.println("hello2");
		Statement st=con.createStatement();
		out.println("hello2");

		int count=1;;
		
		String sql="select * from que where serialno='"+count+"'";

		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
		
	out.println(rs.getInt(1)+"\t"+rs.getString(2)+"</br>");
	out.println("<form method='post'>");
	
	out.println("<input type='radio' name='q' value='a'/>"+rs.getString(3)+"</br>");
	out.println("<input type='radio' name='q' value='b'/>"+rs.getString(4)+"</br>");
	out.println("<input type='radio' name='q' value='c'/>"+rs.getString(5)+"</br>");
	out.println("<input type='radio' name='q' value='d'/>"+rs.getString(6)+"</br>");
	
	out.println("<input type='submit' formaction='A1.jsp' value='Answer'>");
	out.println("<input type='submit' formaction='Q1.jsp' value='Previous'>");
	out.println("<input type='submit' formaction='Q2.jsp' value='Next'>");
	
		}
		
		
		
		}
		catch (Exception e) {
			// TODO: handle exception
			out.print("hello");
		}

	}

}
