<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DeleteInstr</title>
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

String instruction = request.getParameter("instruction");


try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");



String sql="delete from instr where instruction=?";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setString(1,instruction);
int status=pst.executeUpdate();



if(status>0)
{
	out.println("<center><h1>Instruction deleted Successsfully</h1></center>");
}
else
{
out.println("serial no doesnt exist");
}



}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
out.println("hey");
}



%>
</center>
</body>
</html>