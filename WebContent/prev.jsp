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
String ans=request.getParameter("q");
int serial=0;


 try {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
		Statement st=con.createStatement();
		

String sql1="select count(a) from que";
ResultSet rc=st.executeQuery(sql1);
rc.next();
int count=	rc.getInt(1);
		

		String sql4="select * from qc";
		ResultSet rb=st.executeQuery(sql4);
		while(rb.next())
		{
		serial=rb.getInt("count");
		}
		if(serial>1)
		{
		--serial;
		}
		String sql5="update qc set count='"+serial+"'";
		st.execute(sql5);
		
		
		
		
		response.sendRedirect("Qall.jsp");
 }
 catch(Exception e)
 {
	 
 }
		
		%>
		



</body>
</html>