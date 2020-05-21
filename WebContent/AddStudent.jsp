<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%@page import="java.sql.*,java.io.*" %>
<%


String serialno=request.getParameter("serialno");
String userid=request.getParameter("userid");
String name=request.getParameter("name");
String password=request.getParameter("password");




try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into stdnt values('"+serialno+"','"+userid+"','"+name+"','"+password+"')");
out.println("<h1>Data is successfully inserted!</h1></br>");

out.println("<center><h1><a href='home.html'>Exit</a></h1></center>");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
out.println("Operation Failed.Try again");
}
		
		
		
		
	

%>


</body>
</html>