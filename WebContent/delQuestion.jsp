<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delQ</title>
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
<center>
<%@page import="java.sql.*,java.io.*" %>
<%


int serialno=Integer.parseInt(request.getParameter("serialno"));


try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");



String sql="delete from que where serialno=?";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setInt(1,serialno);
int status=pst.executeUpdate();



if(status>0)
{
	out.println("<center><h1>Question deleted Successsfully</h1></center>");
}
else
{
out.println("hhii");
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