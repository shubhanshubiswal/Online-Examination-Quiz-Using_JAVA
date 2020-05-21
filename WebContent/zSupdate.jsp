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
	
	int serialno=0;
	String userid=null;
	String name=null;
	String password=null;
	
	
	
	s=request.getParameter("id");
	session.setAttribute("olduid", s);
	
	String sql="select * from stdnt where userid='"+s+"'";
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{
	 serialno=rs.getInt("serialno");
	 userid=rs.getString("userid");
	 name=rs.getString("name");
	 password=rs.getString("password");
	}
	
	
	
	%>
	
	
	<form  method="post">

<pre>

             <h1>Add Student Page</h1>
        
   Serial No :<input type="text" name="serialno" value="<%= serialno%>"><br>
    userid  :<input type="text" name="userid"  value="<%= userid%>"><br> 
     name  :<input type="text" name="name" value="<%= name%>" ><br> 
    Password  :<input type="password" name="password" value="<%= password%>"><br> 

     <input type="submit" formaction="zSupdate2.jsp" value="Done" />
     
  
     
    
    </form>
  <center><h2><a href="AdminLogin2.jsp" id="back">BACK</a></h2></center>

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