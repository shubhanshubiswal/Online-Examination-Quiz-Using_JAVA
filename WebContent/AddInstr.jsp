<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddInstr</title>
<style>
	body {
  background-image: url("./img/bg2.png");
  background-size: 1230px 600px;
		}
</style>
</head>
<body>

<br>
<br>
<br>
<center>
<%@page import="java.sql.*,java.io.*" %>
<%



String instruction=request.getParameter("instruction");




try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into instr values('"+instruction+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
out.println("hi");
}
		
		
		
		

%>



</center>
</body>
</html>