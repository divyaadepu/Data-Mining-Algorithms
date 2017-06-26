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
		  FileInputStream fis = new FileInputStream(csvFile);
		  DataInputStream myInput = new DataInputStream(fis);
        String line = "";
        String cvsSplitBy = ",";
		int data[]=new int[97];
		double[] grp1 = new double[10000];
		double[] grp2 = new double[10000];

        try {
			int i=0;
            
            while ((line = myInput.readLine()) != null) {

                // use comma as separator
                String[] soc= line.split(cvsSplitBy);
				data[i]=Integer.parseInt(soc[4]);
               i++;

            }
			
			out.println("<table>");
			out.println("<tr><th>Number of Followers</th></tr>");
			for(i=0;i<20;i++){
				out.println("<tr>");
				out.println("<td>");
				out.println(data[i]);
				out.println("</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			double c1=0,c2=0,val=0,min=100000,gr1=data[0],gr2=data[1];
				int m=0,n=0;
				for(int j =0;j<20;j++)
				{
					for (int k=j+1;k<20;k++)
					{
						for(int l=0;l<20;l++){
							c1=(data[j]-data[l])*(data[j]-data[l]);
							c2=(data[k]-data[l])*(data[k]-data[l]);
							if(c1<c2){
								val=val+c1;
							}
							else{
								val=val+c2;
							}
						
						}
					if(val<min){
						min=val;
						gr1=data[j];
						gr2=data[k];
						}
							
					
					}
				}
				
				
				for(int j =0;j<20;j++)
				{
					c1=(data[j]-gr1)*(data[j]-gr1);
					c2=(data[j]-gr2)*(data[j]-gr2);
					if(c1<c2){
						grp1[m]=data[j];
						m=m+1;
					}
					else{
						grp2[n]=data[j];
						n=n+1;
					}
						
				}
				out.println("<br>");
				out.println("The clusters are <b>High   </b>"+gr1+" <b>Low   </b>"+gr2+"<br>");
				out.println("<table>");
				out.println("<tr><th>High</th></tr>");
				i=0;
				int j=0;
				while(i!=m){
					out.println("<tr>");
					out.println("<td>");
					out.println(grp1[i]);
					out.println("</td>");
					out.println("</tr>");
					i++;
				}
				out.println("</table>");
				out.println("<br>");
				out.println("<table>");
				out.println("<tr><th>Low</th></tr>");
				while(j!=n){
					out.println("<tr>");
					out.println("<td>");
					out.println(grp2[j]);
					out.println("</td>");
					out.println("</tr>");
					j++;
				}
				out.println("</table>");
				
				double m1=0,m2=0;
				for(j=0;j<m;j++){
					m1=m1+grp1[j];
				}
				for(j=0;j<n;j++){
					m2=m2+grp2[j];
				}
				out.println("<br><br>");
				out.println("Mean of <b>High   </b>"+gr1+" is "+m1/m+"<br>");
				out.println("Mean of <b>Low   </b>"+gr2+" is "+m2/n+"<br>");
			
			
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
</body>
</html>