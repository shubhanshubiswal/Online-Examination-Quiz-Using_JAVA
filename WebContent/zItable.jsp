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

<br><br><br>

<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
	Statement st=conn.createStatement();
	String sql="select * from instr";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{
	%>
	
	
	<main>
		<center>
			
			
					<h1>List of Instructions</h1><br>
			
				<table class="table" border="1" cellpadding="5">
  					<tr>
  					  <th>Sl No.</th>
  					  <th>Instructions</th>
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
			 			<%=rs.getString("instruction") %>
						
					</td>
					<td><a href="zIupdate.jsp?id=<%=rs.getString("instruction")%>" > - Update</a><br><a href="zIdelete.jsp?id=<%=rs.getString("instruction")%>" > - Delete</a></td>

				
			<%
				i++;
			}
			i=1;

			%>
			
				</table>
				<br><br>
				<input type="button" name="Exit" style="white-space: normal;" value="Add Instruction" class="btn" onclick="window.location.href='AddInstr.html';"></th>
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