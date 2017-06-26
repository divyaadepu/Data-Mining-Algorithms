<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Social Media</title>
<style type="text/css">
table, tr,th,td {
    border: 1px solid black;
}
</style>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import ="java.lang.Math"%>
<%

String csvFile = "D:/Exp3.csv";
BufferedReader br = null;
Scanner sc=new Scanner(System.in);
String line = "";
double sum = 0.0; 
int count=0,i;


    br = new BufferedReader(new FileReader(csvFile));
	
	String[] mov = line.split(",");


	int a[]=new int[20];
	int b[]=new int[20];

	//float s[]=new float[14];
	mov = line.split(",");
	//line=br.readLine();
	//System.out.println(l);
	i=0;
	while((line=br.readLine())!=null)
	{
		
	
			mov = line.split(",");
		a[i]=Integer.parseInt(mov[4]);
		b[i]=Integer.parseInt(mov[5]);
		
		
		i++;
		//System.out.println(s[i][j]+"\t");
		}
		//System.out.println("\n");			i++;
	
		out.println("<table>");
		out.println("<tr><th>Number of Follwers</th><th> Age</th></tr>");

	for(i=0;i<20;i++)
	{
		out.println("<tr>");
		out.println("<td>");
			out.println(a[i]);
			out.println("</td>");
					out.println("<td>");
			out.println(b[i]);
			out.println("</td>");
					out.println("</tr>");
	}
	out.println("</table>");

	int a_sum=0,b_sum=0;
	for(i=0;i<20;i++)
	{
		a_sum=a_sum+a[i];
		b_sum=b_sum+b[i];
	}
	
	double a_mean=a_sum/20;
	double b_mean=b_sum/20;
	//out.println("Mean"+a_mean);
	double w1=0.0,w1_num,w1_den;
	double a_a[]=new double[20];
	double b_b[]=new double[20];
	double c_c[]=new double[20];
	for(i=0;i<20;i++)
	{
		a_a[i]=a[i]-a_mean;
		b_b[i]=b[i]-b_mean;
		c_c[i]=(a[i]-a_mean)*(a[i]-a_mean);
	}

	for(i=0;i<20;i++)
	{
		w1=w1 +((a_a[i]*b_b[i])/c_c[i]);
		//System.out.println("Current Age"+w1);
	}
	out.println("W1  "+w1);
	out.println("<br><br>");
	double w0;
	w0=b_mean-(w1*a_mean);
	out.println("W0  "+w0);
	out.println("<br><br>");
	


%>
<form action="http://localhost:8080/DM_miniproject/exp5_final.jsp">
Enter number of followers:<br>
<input type="text" name="no">

<input type="submit" value="Submit"><br>


 </form>
</body>
</html>