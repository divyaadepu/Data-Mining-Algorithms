<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Social Media</title>
<style type="text/css">
table, tr,th, td {
    border: 1px solid black;
    cellpadding=10px;
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

String csvFile = "D:/final.csv";
		  FileInputStream fis = new FileInputStream(csvFile);
		  DataInputStream myInput = new DataInputStream(fis);
        String line = "";
        String cvsSplitBy = ",";
		String data[][]=new String[97][5];

        try {
			int i=0;
            
            while ((line = myInput.readLine()) != null) {

                // use comma as separator
                String[] soc= line.split(cvsSplitBy);
				data[i][0]=soc[1];
				data[i][1]=soc[2];
				data[i][2]=soc[4];
				data[i][3]=soc[16];
				data[i][4]=soc[15];
               i++;	

            }
			out.println("<table>");
			out.println("<tr><th>Gender</th><th>Education</th><th>Family Income</th><th>Marital Status</th><th>Snapchat</th></tr>");
			for(i=0;i<20;i++)
			{
				out.println("<tr><td>"+data[i][0]+"</td><td>"+data[i][1]+"</td><td>"+data[i][2]+"</td><td>"+data[i][3]+"</td><td>"+data[i][4]+"</td></tr>");
			}
			out.println("</table>");
			
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (myInput != null) {
                try {
                    myInput.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        
    
	%>
	<form action="http://localhost:8080/DM_miniproject/exp4_final.jsp">
	<br><br><br><br>
<h3>Choose from the following:</h3><br>
<table>
<tr><th>Gender: &nbsp;&nbsp;</th>
<td><input type="radio" name="gender" value="1">Male
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="gender" value="2">Female
</td></tr>
<tr><th>

Education: &nbsp;&nbsp;</th><td>
<input type="radio" name="edu" value="1">Under Graduate
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="edu" value="2">Graduate
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="edu" value="3">Post Graduate
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="edu" value="3">High School Graduate

</td></tr><tr><th>
Family Income:&nbsp;&nbsp;</th><td>
<input type="radio" name="fi" value="1"> <1 Lakh
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="fi" value="2">1 - 5 Lakhs
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="fi" value="3">5 - 10 Lakhs
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="fi" value="3"> >10 Lakhs

</td></tr><tr><th>
Marital Status:&nbsp;&nbsp;</th><td>
<input type="radio" name="ms" value="1">Single
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="ms" value="2">Married

</td></tr>

</table><br>
<input type="submit" value="Submit"><br>
 </form>
</body>
</html>