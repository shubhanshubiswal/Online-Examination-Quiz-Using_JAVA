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
	
	
	

	
	
	int serialno=Integer.parseInt(request.getParameter("serialno"));
	String userid=request.getParameter("userid");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
	Statement st=conn.createStatement();
	String olduid= (String) session.getAttribute("olduid");
	


	
	String sql="update stdnt set serialno='"+serialno+"',userid='"+userid+"',name='"+name+"',password='"+password+"' where userid='"+olduid+"'";
	
	
	int status=st.executeUpdate(sql);
	%><jsp:forward page="zStable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}


	%>

				
			
		</center>
	
</body>
</html>