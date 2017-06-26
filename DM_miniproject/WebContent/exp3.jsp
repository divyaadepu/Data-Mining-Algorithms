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
        String line = "";
double sum = 0.0; 
		int count=0,i;


br = new BufferedReader(new FileReader(csvFile));
			
			String[] mov = line.split(",");

		
			int s[]=new int[20];
			//float s[]=new float[14];
			mov = line.split(",");
			//line=br.readLine();
			//System.out.println(l);
			i=0;
			while((line=br.readLine())!=null)
			{
				
			
					mov = line.split(",");
				s[i]=Integer.parseInt(mov[5]);
				i++;
				//System.out.println(s[i][j]+"\t");
				}
				//System.out.println("\n");			i++;
			
			

			out.println("Age of Joining\n");
			out.println("<br>");
			out.println("</table>");
			for(i=0;i<20;i++)
			{
				out.println("<td>");
				out.println(s[i]);
					out.println("</td>");
			}
			out.println("</table>");
			out.println("<br>");
			
			int temp;
			int n=20;
				for(i=0; i < n; i++)
				{  
					for(int j=1; j < (n-i); j++)
				 {  
					if(s[j-1] > s[j])
						  {  
                                 //swap elements  
						temp = s[j-1];  
						s[j-1] = s[j];  
						s[j] = temp;  
                         }  

                 } 
				}	
				out.println("<br>");
				out.println("Age of Joining In Ascending Order\n");
				out.println("<br>");
			
				out.println("</table>");
				for(i=0;i<20;i++)
				{
					out.println("<td>");
						out.println(s[i]);
						out.println("</td>");
				}
				out.println("</table>");
				out.println("<br>");
				
	int k=0;
	int x2[][]=new int[4][5];
	for(i=0; i < 4; i++)
		{ 
	
		for(int j=0; j < 5; j++)
			{ 
				x2[i][j]=s[k++];
			}		
		}			
	out.println("<br>");
	out.println("<b>Discretion</b>");
	out.println("<br>");
	out.println("<table>");
		for(i=0; i < 4; i++)
		{ 
			out.println("<tr><th>");
			out.println("Bin "+i);
			out.println("</th>");
			for(int j=0; j < 5; j++)
			{
				out.println("<td>");
				out.println(x2[i][j]);
				out.println("</td>");
			}
			out.println("</tr>");
		}
		out.println("</table>");
	
	System.out.println("\n");
	double avg;
	double ans=0;
	for(i=0;i<20;i++)
	{
		ans=ans+s[i];
	}
	
	avg=ans/20;
	
	
	
	for(i=0;i<20;i++)
	{
		sum=sum + Math.pow((s[i]-avg),2);
	}
	
	sum=sum/20;
	
	double sd;
	
	sd=Math.sqrt(sum);
	
	double zscore[]=new double[20];
	
	for(i=0;i<20;i++)
	{
		zscore[i]=(s[i]-avg)/sd;

	}
	
	out.println("<b>Normalization using Z Score</b>");
	out.println("<br>");
	out.println("<br>");
	out.println("<table>");
	//System.out.println("\n");
	for(i=0;i<20;i++)
	{
			out.println("<tr><td>");
			out.println(zscore[i]);
			out.println("</td></tr>");
	}
	out.println("</table>");

%>
</body>
</html>