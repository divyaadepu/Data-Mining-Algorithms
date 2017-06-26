<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Social Media</title>
<style type="text/css">
table, tr,th, td {
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
			int g[][]=new int[1][2];
			g[0][0]=0; //male
			g[0][1]=1; //female
			int edu[][]=new int[1][4];
			edu[0][0]=0; //ug
			edu[0][1]=0; //g
			edu[0][2]=0; //pg
			edu[0][3]=0; //hs
			int fa[][]=new int[1][4];
			fa[0][0]=0; //<1
			fa[0][1]=0; //1-5
			fa[0][2]=0; //5-10
			fa[0][3]=0; //>10
			int ms[][]=new int[1][2];
			ms[0][0]=0; //single
			ms[0][1]=0; //married
			int snap[][]=new int[1][2];
			snap[0][0]=0; //yes
			snap[0][1]=1; //no
			for(i=0;i<20;i++)
			{
				//gender count
				if(data[i][0].equals("Male"))
					g[0][0]++;
				else 
					g[0][1]++;
				//education count
				if(data[i][1].equals("Under Graduate"))
					edu[0][0]++;
				else if(data[i][0].equals("Graduate"))
					edu[0][1]++;
				else if(data[i][0].equals("Post Graduate"))
					edu[0][2]++;
				else
					edu[0][3]++;
				
				//family income count
				if(data[i][2].equals("<1 Lakh"))
					fa[0][0]++;
				else if(data[i][2].equals("1 - 5 Lakhs"))
					fa[0][1]++;
				else if(data[i][2].equals("5 - 10 Lakhs"))
					fa[0][2]++;
				else
					fa[0][3]++;
				//marital count
				if(data[i][3].equals("Single"))
					ms[0][0]++;
				else
					ms[0][1]++;
				//snapchat count
				if(data[i][4].equals("No"))
					snap[0][1]++;
				else
					snap[0][0]++;
			}
			
			int gen=Integer.parseInt(request.getParameter("gender"))-1;
			String ge= " ";
			switch(gen)
			{
				case 0: ge=new String("Male");
						break;
				case 1: ge=new String("Female");
						break;
			}				
			int ed=Integer.parseInt(request.getParameter("edu"))-1;
			String e= " ";
			switch(ed)
			{
				case 0: e=new String("Under Graduate");
						break;
				case 1: e=new String("Graduate");
						break;
				case 2: e=new String("Post Graduate");
						break;
			}
			int fi=Integer.parseInt(request.getParameter("fi"))-1;
			String f = " ";
			switch(fi)
			{
				case 0: f=new String("<1 Lakh");
						break;
				case 1: f=new String("1 - 5 Lakhs");
						break;
				case 2: f=new String("5 - 10 Lakhs");
						break;
				case 3: f=new String("> 10 Lakhs");
						break;
			}				
			int m=Integer.parseInt(request.getParameter("ms"))-1;
			String ma = " ";
			switch(m)
			{
				case 0: ma=new String("Single");
						break;
				case 1: ma=new String("Married");
						break;
			}
			int c1=0,c2=0,c3=0,c4=0;
			for(i=0;i<20;i++)
			{
				if(data[i][0].equals(ge)&&data[i][4].equals("Yes"))
					c1++;
				if(data[i][1].equals(e)&&data[i][4].equals("Yes"))
					c2++;
				if(data[i][2].equals(f)&&data[i][4].equals("Yes"))
					c3++;
				if(data[i][3].equals(ma)&&data[i][4].equals("Yes"))
					c4++;
			}
			int d1=0,d2=0,d3=0,d4=0;
			for(i=0;i<20;i++)
			{
				if(data[i][0].equals(ge)&&data[i][4].equals("No"))
					d1++;
				if(data[i][1].equals(e)&&data[i][4].equals("No"))
					d2++;
				if(data[i][2].equals(f)&&data[i][4].equals("No"))
					d3++;
				if(data[i][3].equals(ma)&&data[i][4].equals("No"))
					d4++;
			}
			
			float p_s_y=((float)snap[0][0])/((float)20);
			float p_s_n=((float)snap[0][1])/((float)20);
			float gn=((float)c1)/((float)g[0][gen]);
			float ngn=((float)d1)/((float)g[0][gen]);
			float edc=((float)c2)/((float)edu[0][ed]);
			float nedc=((float)d2)/((float)edu[0][ed]);
			float an=((float)c3)/((float)fa[0][fi]);
			float nan=((float)d3)/((float)fa[0][fi]);
			float mr=((float)c4)/((float)ms[0][m]);
			float nmr=((float)d4)/((float)ms[0][m]);
			float yes,no;
			try{
				yes=p_s_y*gn*edc*an*mr;
			}
			catch(Exception exp)
			{
				out.println(exp);
				yes=0;
			}
			out.println("<br><br>Probability of using Snapchat: "+yes+"<br>");
			try{
				no=p_s_n*ngn*nedc*nan*nmr;
			}
			catch(Exception exp)
			{
				out.println(exp);
				no=0;
			}
			out.println("Probability of not using Snapchat: "+no+"<br>");
			if(yes>no)
				out.println("<br><b>The person will use snapchat</b>");
			else
				out.println("<br><b>The person will not use snapchat</b>");	
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