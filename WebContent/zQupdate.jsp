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
	<%! String olda=null; %>
	<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");
	Statement st=conn.createStatement();
	//out.print();
	
	int serialno=0;
	String  question=null;
	String  a=null;
	String  b=null;
	String  c=null;
	String d=null;
	String crctans=null;
	
	
	
	olda=request.getParameter("id");
	session.setAttribute("olda", olda);
	
	String sql="select * from que where a='"+olda+"'";
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{

	 question=rs.getString("question");
	 a=rs.getString("a");
	 b=rs.getString("b");
	 c=rs.getString("c");
	 d=rs.getString("d");
	 crctans=rs.getString("crctans");
	}
	
	
	
	%>
	
	
	<form  method="post">

<pre>

             <h1>Update Question</h1>
        
   Question :<input type="text" name="question" value="<%= question%>"><br>
    Option a:<input type="text" name="a" value="<%= a%>"><br> 
    Option b:<input type="text" name="b" value="<%= b%>"><br> 
    Option c:<input type="text" name="c" value="<%= c%>"><br> 
    Option d:<input type="text" name="d" value="<%= d%>"><br> 
    Answer(Option)  :<input type="text" name="crctans" value="<%= crctans%>"><br> 

     <input type="submit" formaction="zQupdate2.jsp" value="Done" />
     
      <input type="submit" formaction="zQupdate.jsp" value="clear" />
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