<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuestionDB</title>
<style>
	body {
  background-image: url("./img/bg2.png");
  background-size: 1230px 600px;
		}
</style>
</head>
<body>



<sql:setDataSource var="db" driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="system" password="password"/>
	
	<sql:query var="rs" dataSource="${db }">
		select * from que
	</sql:query>
	<center>
	<br>
	<br>
	<br>
	<h1>QnA Database</h1>
	<br>
	
	<table border="2" width="40%">
		<tr>
			
			<th>SERIAL NO</th>
			<th>Question</th>
			<th>Correct Answer</th>
			
			
		
		</tr>
		<c:forEach var="table" items="${rs.rows }">
			<tr>
			<td><c:out value="${table.serialno }"></c:out>    </td>
				<td><c:out value="${table.question }"></c:out>    </td>
				<td><c:out value="${table.crctans }"></c:out>    </td>
			
				 
				
			</tr>
		</c:forEach>
	</table>
	<br><br><br>
	<a href="AddQuestion.html">Add Entry</a><br><a href="delQuestion.html">Delete Entry</a><br><a href="UpdateQuestion.html">Update Entry</a>
	
	</center>
	
</body>
</html>