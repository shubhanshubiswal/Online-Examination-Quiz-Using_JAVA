<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
	
<meta charset="ISO-8859-1">
<title>Online QnA</title>
<script>
var deadline = new Date("Nov 23, 2019 13:01:00").getTime(); 
var x = setInterval(function() { 
var now = new Date().getTime(); 
var t = deadline - now; 
var days = Math.floor(t / (1000 * 60 * 60 * 24)); 
var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60)); 
var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60)); 
var seconds = Math.floor((t % (1000 * 60)) / 1000); 
document.getElementById("demo").innerHTML = hours + "h " + minutes + "m " + seconds + "s "; 
	if (t < 0) { 
		clearInterval(x); 
		document.getElementById("demo").innerHTML = "EXPIRED"; 
		document.forma.p.disabled = true;
		document.forma.n.disabled = true;
		//document.forma.s.disabled = true;
		
	} 
}, 1000);
</script>
</head>


<body>
<%@page import="java.sql.*,java.io.*" %>
	
<%

 try {
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
		Statement st=con.createStatement();
		

int serial=1;


String sql1="select count(a) from que";
ResultSet rc=st.executeQuery(sql1);
rc.next();
int count=	rc.getInt(1);
//out.print(count);

		String sql2="select * from qc";
		ResultSet rb=st.executeQuery(sql2);
		while(rb.next())
		{
		serial=rb.getInt("count");
		}
		
	if(serial<=count){
		
			
		String sql="select * from que where serialno='"+serial+"'";

		ResultSet rs=st.executeQuery(sql);
		
		while(rs.next())
		{
			out.println("<form name='forma' method='post'>");
			out.println("<div id='timer'>Submit before :	<span id='demo'></span></div><br><br>");
			out.println("<br><br><center>"+rs.getInt(1)+".\t"+rs.getString(2)+"</br><br><br>");
			
			
			
			out.println("<input type='radio' name='q' value='a'/>"+rs.getString(3)+"</br><br>");
			out.println("<input type='radio' name='q' value='b'/>"+rs.getString(4)+"</br><br>");
			out.println("<input type='radio' name='q' value='c'/>"+rs.getString(5)+"</br><br>");
			out.println("<input type='radio' name='q' value='d'/>"+rs.getString(6)+"</br><br><br>");
			
			
			out.println("<input name='p' type='submit' formaction='prev.jsp' value='<< Previous'>");
			
			out.println("<input name='s' type='submit' formaction='Aall.jsp' value='Answer'>");
			
			out.println("<input name='n' type='submit' formaction='next.jsp' value='Next >>'></center>");
			
			
			
	
		}
	
	
	
	 }
	 
		 
	 

}
catch(Exception e)
{
System.out.print(e);

out.print(e);
}


%>
</body>
</html>