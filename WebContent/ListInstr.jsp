<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>InstructionDb</title>
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
		select * from instr	
	</sql:query>
	<br>
	<br>
	<center>
	<h1>Instruction Database</h1>
	<br>
	<br>
	<table border="2" width="20%">
		<tr>
			
			<th>Instructions</th>
			
			
		
		</tr>
		<c:forEach var="table" items="${rs.rows }">
			<tr>
			
				<td><c:out value="${table.instruction }"></c:out>    </td>
			
				 
				
			</tr>
		</c:forEach>
	</table>
	<br><br><br>
	<a href="AddInstr.html">Add Entry</a><br><a href="delInstr.html">Delete Entry</a><br><a href="UpdateInstr.jsp">Update Entry</a>
	</center>
	
</body>
</html>