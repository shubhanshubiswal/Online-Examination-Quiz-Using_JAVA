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

 try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
		Statement st=con.createStatement();
		

int count=0;
int serial=0;
String sql1="select count(a) from que";
		ResultSet rc=st.executeQuery(sql1);
		rc.next();
		int b=	rc.getInt(1);
		out.print(b);
		
 }
catch(Exception e){
out.print(e);
}
%>

</body>
</html>