<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource var="db" driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="system" password="password"/>
	
	<sql:query var="rs" dataSource="${db }">
		select * from student	
	</sql:query>
	
	<table border="2" width="100%">
		<tr>
			<th>Roll</th>
			<th>Name</th>
			
			<th>Operations</th>
		</tr>
		<c:forEach var="table" items="${rs.rows }">
			<tr>
				<td><c:out value="${table.roll }"></c:out>    </td>
				<td><c:out value="${table.name }"></c:out>    </td>
				 
				<td><a href="abc.html">prepare</a><br/><a href="index.html">index</a> </td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
