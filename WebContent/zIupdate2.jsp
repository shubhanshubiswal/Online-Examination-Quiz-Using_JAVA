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
	String inst=request.getParameter("instruction");
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
	Statement st=conn.createStatement();
	String oldinstr= (String) session.getAttribute("oldinstr");
	


	
	String sql="update instr set instruction='"+inst+"' where instruction='"+oldinstr+"'";
	
	
	int status=st.executeUpdate(sql);
	%><jsp:forward page="zItable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}


	%>

				
			
		</center>
	</main>
</body>
</html>