<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudentDB</title>
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
<br>
<sql:setDataSource var="db" driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="system" password="password"/>
	
	<sql:query var="rs" dataSource="${db }">
		select * from stdnt
	</sql:query>
	<%int c=1; %>
	
	<center>
	<h1>Student Database</h1>
	<br>
	<br>
	<table border="2" width="30%">
		<tr>
			<th>Serial no</th>
			<th>User Id</th>
			<th>Name</th>
			
			
		</tr>
		<c:forEach var="table" items="${rs.rows }">
			<tr>
			<% out.println("<td>"+c+"</td>"); 
			 c++;%>
				<td><c:out value="${table.userid }"></c:out>    </td>
				<td><c:out value="${table.name }"></c:out>    </td>
				 
				
			</tr>
		</c:forEach>
	</table>
	<br><br><br>
	<a href="AddStudent.html">Add Entry</a><br><a href="delStudent.html">Delete Entry</a><br><a href="UpdateStudent.html">Update Entry</a>
	</center>
</body>
</html>