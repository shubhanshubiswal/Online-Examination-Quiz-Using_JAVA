<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OnlineExam</title>
</head>
<body>

<%

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
Statement st=conn.createStatement();

String sql="select * from instr";


ResultSet rs=st.executeQuery(sql);
out.println("<center><h1>Welcome to Online Exam Portal</center></h1><br><br>");
out.println("<center><h2>Read the following instructions carefully!</center></h2><br>");
while(rs.next())
{
out.println("<center>"+rs.getString(1)+"</center><br/>");

}
String sql1="update counter set correct=0,attempt=0 where serialno=1";
st.executeUpdate(sql1);
out.println("<br><br><br><center><a href='Qall.jsp'>Start</a></center>");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>




</body>
</html>