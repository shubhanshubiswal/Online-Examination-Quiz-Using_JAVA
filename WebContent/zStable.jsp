<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	body {
  background-image: url("./img/bg2.png");
  background-size: 1230px 600px;
  
  
}


	</style>
</head>
<body>




<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
	Statement st=conn.createStatement();
	String sql="select * from stdnt";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{
	%>
	
	
	<main>
		<center>

			
					<h1>List of Students</h1><br>
			
				<table class="table" border="1" cellpadding="5">
  					<tr>
  					  <th>Sl No.</th>
  					  <th>USER ID</th>
  					   <th>NAME</th>
  					  <th>Update/Delete</th>
  					</tr>
	<%
			while(rs.next())
			{
			%>
				<tr>
					<td>
						<%=i %>
					</td>
					<td>
			 			<%=rs.getString("userid") %>
						
					</td>
					<td>
			 			<%=rs.getString("name") %>
						
					</td>
					<td><a href="zSupdate.jsp?id=<%=rs.getString("userid")%>" > - UPDATE</a><br><a href="zSdelete.jsp?id=<%=rs.getString("userid")%>" > - Delete</a></td>

				
			<%
				i++;
			}
			i=1;

			%>
				</table>
				
				<input type="button" name="Exit" style="white-space: normal;" value="Add Student" class="btn" onclick="window.location.href='AddStudent.html';"></th>
				<input type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='AdminLogin2.html';">

			</section>
			<%
		}
		
		

	}
	


	catch(Exception e)
	{

	}
	st.close();
	rs.close();
	conn.close();
	%>

				
			
		</center>
	</main>