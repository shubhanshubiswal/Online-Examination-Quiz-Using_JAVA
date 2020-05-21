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
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
	Statement st=conn.createStatement();
	//out.print();
	s=request.getParameter("id");
	session.setAttribute("oldinstr", s);
	
	%>
		<form  method="post">

<pre>

             <h1>Update Instruction Page</h1>
        

     instruction:<input type="text" name="instruction" value="<%= s%>"><br> 
   
     <input type="submit" formaction="zIupdate2.jsp" value="Done" />
     
     
    </form>


</pre>

	
	<%
		}

	catch(Exception e)
	{
out.print(e);
	}


	%>

				
			
		</center>
	</main>
</body>
</html>