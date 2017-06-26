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

        String csvFile = "D:/social.csv";
        BufferedReader br = null;
        String line = "";
        double sum = 0.0; 
		int count=0,i=1,j=0,k=0;

 try{     

            br = new BufferedReader(new FileReader(csvFile));
           
			
			String[] mov = line.split(",");

		
			float s[][]=new float[14][3];
			//float s[]=new float[14];
			mov = line.split(",");
			//line=br.readLine();
			//System.out.println(l);
			i=0;
			while((line=br.readLine())!=null)
			{
				
			{
				mov = line.split(",");
				
				for(j=0;j<3;j++)
				{
				s[i][j]=Float.parseFloat(mov[4+j]);
				//System.out.println(s[i][j]+"\t");
				}i++;
				//System.out.println("\n");			i++;
			}
			}

			out.println("<table>");
			out.println("<tr>");
			out.println("<th>Followers</th><th>Age of Joining</th><th>Current Age</th>");
			for(i=0;i<14;i++)
			{
				out.println("<tr>");
				for(j=0;j<3;j++)
				{
					out.println("<td>");
					out.println(s[i][j]);
					out.println("</td>");
				}
				out.println("</tr>");
			}
			out.println("</table>");
			double m[][]=new double[14][14];
			
			for(i=0;i<14;i++)
			{
				
				for(j=0;j<14;j++)
				{
					if(i==j)
						m[i][j]=0;
					else if(j>i)
						m[i][j]=0;
					else
						
					{	
						for(k=0;k<3;k++)
						m[i][j]=m[i][j]+Math.abs(s[i][k]-s[j][k]);
					}
				}
			}
			
			out.println("\nManhattan is");
			out.println("\n\n\n");
			out.println("<table>");
			
			for(i=0;i<14;i++)
			{
				out.println("<tr>");
				for(j=0;j<14;j++)
				{
					out.println("<td>");
					out.println((int)m[i][j]);
					out.println("</td>");
				}
				out.println("</tr>");
			}
			out.println("</table>");
			double e[][]=new double[14][14];
			for(i=0;i<14;i++)
			{
				
				for(j=0;j<14;j++)
				{
					if(i==j)
						e[i][j]=0;
					else if(j>i)
						e[i][j]=0;
					else
						
					{	
						for(k=0;k<3;k++)
						e[i][j]=e[i][j]+(s[i][k]-s[j][k])*(s[i][k]-s[j][k]);
						e[i][j]=Math.sqrt(e[i][j]);
					}
				}
			}
			
			
			
			
			out.println("\nEuclidean is");
			
			out.println("\n\n\n");
			out.println("<table>");
			for(i=0;i<14;i++)
			{
				out.println("<tr>");
				for(j=0;j<14;j++)
				{
					 out.println("<td>");
					out.println((int)e[i][j]);
					out.println("</td>");
				}
				out.println("</tr>");
			}
			 out.println("</table>");
       } 

		
		catch (Exception e) 
		{
            System.out.println("Exception caused");
        }       
        
    
	%>
</body>
</html>