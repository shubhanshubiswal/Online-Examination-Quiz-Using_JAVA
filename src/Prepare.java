

import java.io.*;
import java.sql.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Prepare
 */
@WebServlet("/Prepare")
public class Prepare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Prepare() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		   response.setContentType("text/html");


String ans=request.getParameter("Q1");

 try {
	 out.println("hello");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		 out.println("hello");
		Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
		Statement st=con.createStatement();
		String sql="select * from que where serialno=1";
		 out.println("hello");
		ResultSet rs=st.executeQuery(sql);
		 out.println("hello");
		while(rs.next())
		{
	String crctans=rs.getString("crctans");
	if(ans.equals(crctans))
	{
		out.println("Correct answer");
	}
	else
	{
		out.println("Wrong answer");
	}
		}


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
out.println("hey");
}
	}

}
