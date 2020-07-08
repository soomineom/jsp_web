<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation" %>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset" %>

<% 
   String query="SELECT *from chart";
   JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/homework","com.mysql.jdbc.Driver","root","abcd1234");
   
   dataset.executeQuery(query);
   JFreeChart chart=ChartFactory.createBarChart3D("Puppy Chart-Normal","day","eat/drink",dataset,PlotOrientation.VERTICAL,true,true,false);
   
   try {
      ServletOutputStream outStream = response.getOutputStream();
      ChartUtilities.writeChartAsJPEG(outStream, chart, 400, 400);
   }
   catch (IOException e)
   {
      System.out.println("Problem in creating chart.");
   }
%>