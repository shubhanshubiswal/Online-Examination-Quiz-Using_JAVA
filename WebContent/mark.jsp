<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results</title>
</head>
<body>

	<sql:setDataSource var="db" driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="system" password="password"/>
	
	<sql:query var="rs" dataSource="${db }">
		select * from counter	
	</sql:query>
	
	<br><br>
	<center>
	<table border="2" width="20%">
		<tr>
			<th>Questions Attempted</th>
			<th>Correct Answers</th>
			<th>Marks Obtained</th>
		
			
		
		</tr>
		<c:forEach var="table" items="${rs.rows }">
			<tr>
				<td><c:out value="${table.attempt }"></c:out>    </td>
				<td><c:out value="${table.correct }"></c:out>    </td>
				<td><c:out value="${table.correct }"></c:out>    </td>
		
			</tr>
		</c:forEach>
	</table>
	</center>
	<br>
	<br>
	<center><a href="home.html" class="button">Exit</a></center>
</body>
</html>
