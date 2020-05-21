<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminLogin</title>
<style>
	body {
  background-image: url("./img/bg2.png");
  background-size: 1230px 600px;
  
  
}


	</style>
</head>
<body>




<%@page import="java.sql.*,java.io.*" %>
<%

String userid=request.getParameter("auid");
String password=request.getParameter("apwd");

out.println("<br><br><br><br><center><h1>Welcome Admin No."+userid+"</hr><br><br><br></center>");

try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
Statement st=conn.createStatement();

String sql="select * from admin where userid='"+userid+"'";

ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
String a=rs.getString(1);
String b=rs.getString(2);
String uname = rs.getString(3);

if(a.equals(userid)  && b.equals(password))
{
	session.setAttribute("user",uname);

	out.println("<center><h2>Login Successful</h2></center>");
	out.println("<center><h3><a href='AdminLogin2.html'>Manage</a></h3></center>");
}
else
	out.println("<center><h2>Unsuccessfull</h2></center>");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>

</body>
</html>