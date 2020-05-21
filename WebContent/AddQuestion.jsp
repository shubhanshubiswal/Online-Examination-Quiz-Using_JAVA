<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddQ</title>
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
<%@page import="java.sql.*,java.io.*" %>
<%

String serialno = request.getParameter("serialno");
String question=request.getParameter("question");
String a=request.getParameter("a");
String b=request.getParameter("b");
String c=request.getParameter("c");
String d=request.getParameter("d");
String crctans=request.getParameter("crctans");




try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
Statement st=conn.createStatement();

int count=1;
String sql="select * from que";
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{

			count++;
		}


int i=st.executeUpdate("insert into que values('"+Integer.parseInt(serialno)+"','"+question+"','"+a+"','"+b+"','"+c+"','"+d+"','"+crctans+"')");

out.println("<h1>Question added succesfully</h1>");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
out.println("hi");
}
		
	
		
		


%>


</body>
</html>