<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudentLogin</title>
<style>
	body {
  background-image: url("./img/bg1.png");
  
  
}


	</style>
</head>
<body>


<%@page import="java.sql.*,java.io.*" %>
<%

String userid=request.getParameter("suid");
String password=request.getParameter("spwd");

out.println("<center><h1>Welcome Regd No."+userid+"</hr><br><br><br></center>");


try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
	Statement st=conn.createStatement();

	String sql="select * from stdnt where userid='"+userid+"'";

	ResultSet rs=st.executeQuery(sql);

	while(rs.next())
	{
	String a=rs.getString(2);
	String b=rs.getString(4);

	if(a.equals(userid) && b.equals(password))
		
		{
			out.println("<center><h2>Login Successful</h2></center>");
			out.println("<center><h3><a href='Instruction.jsp'>Click for Exam Instructions</a></h3></center>");
		}
			
	else{
		out.println("<center><h2>Unsuccessfull</h2></center>");
	}
	}
	}

	catch(Exception e)
	{
		out.println("hello");
	System.out.print(e);
	e.printStackTrace();
	}

%>


</body>
</html>