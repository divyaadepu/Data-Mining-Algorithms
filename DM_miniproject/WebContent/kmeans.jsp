<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
int count=0,i;
Scanner sc=new Scanner(System.in);

    br = new BufferedReader(new FileReader(csvFile));
	out.println("Number of follwers");
	String[] mov = line.split(",");


	int s[]=new int[20];
	//float s[]=new float[14];
	mov = line.split(",");
	//line=br.readLine();
	//out.println(l);
	i=0;
	while((line=br.readLine())!=null)
	{
		
	
			mov = line.split(",");
		s[i]=Integer.parseInt(mov[4]);
		i++;
		//out.println(s[i][j]+"\t");
		}
		//out.println("\n");			i++;
	
	

out.println("<table>");
	for(i=0;i<10;i++)
	{
		
			out.println("<tr><td>"+s[i]+"</td></tr>");
		
	}

	out.println("</table><br>");
	
	Random rand = new Random();
	int min=0; int max=9;
	out.println("K=2");
	int k=2;	
	out.println("<br>");
	int cluster[]=new int[10];
	int obj[][]=new int[10][k];

	out.println("<br>");
	for(i=0; i<k; i++)
	{
		out.println("<br>");
		int j = rand.nextInt((max - min) + 1) + min;
		out.println("Mean "+s[j]);
		for(int a=0; a<10; a++)
		{
			obj[a][i]= Math.abs(s[a]-s[j]);
		}
	}

	out.println("<br>");
	int diss1=0, diss2=0;
	
	for(i=0; i<10; i++)
	{
		if(obj[i][0]>obj[i][1])
		{
			cluster[i]=1;
			diss1+=obj[i][1];
		}
		else
		{
			diss2+=obj[i][0];
			cluster[i]=0;
		}
	}
	/*

	for(i=0;i<k;i++)
	{
		out.println("Group" +i);
		for(int j=0; j<10; j++)
		{
		out.println(s[j]+"\t"+obj[j][i]);
		}
		out.println();
	}*/
	int minc, maxc;
	for(i=0;i<k;i++)
	{
		minc=2000;
		maxc=0;
		for(int j=0;j<10;j++)
		{
			if(cluster[j]==i )
			{
				if(s[j]<minc){
					minc=s[j];
				}
				if(s[j]>maxc){
					maxc=s[j];
				}
			}
		}
		
		out.println("<table>");
		out.println("<tr><th>");
		out.println("Range:"+minc+"-"+maxc+"</th></tr>");
		
		for(int j=0;j<10;j++)
		{
			if(cluster[j]==i )
			{
				if(s[j]<minc){
					minc=s[j];
				}
				if(s[j]>maxc){
					maxc=s[j];
				}
			out.println("<tr><td>"+s[j]+"</td> </tr>");
			}
		}
		out.println("</table>");
		
		out.println("<br>");
	}
	





%>
</body>
</html>