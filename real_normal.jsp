<%@ page  contentType="text/html;charset=UTF-8"
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<%
  response.setContentType("text/html;charset=UTF-8;");
  request.setCharacterEncoding("UTF-8");       
  Class.forName("com.mysql.jdbc.Driver");    
  String url = "jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=UTF-8";
  String id = "root";
  String pwd = "abcd1234";
  Connection conn= null;
  Statement stmt = null;
  ResultSet rs   = null;
  try {
      conn = DriverManager.getConnection(url, id ,pwd);
      stmt = conn.createStatement();
      String query = "select *from chart";
      rs = stmt.executeQuery(query);
      
 %>
<table border="1" cellspacing="0">
<tr>

</tr>
<tr>
<td>day</td>
<td>eat</td>
<td>drink</td>
</tr>
<%
    while(rs.next()) { 
%><tr>
<td><%=rs.getString("day")%></td>
<td><%=rs.getString("eat")%></td>
<td><%=rs.getString("drink")%></td>
</td>
</tr>
<%
    }
%></table>

<table>
<tr>
<td colspan="2" align="center">
<input type=button value="See Normal Chart" Onclick="window.location='chart_normal.jsp'"/>
</td>
</tr>
</table>

<%

  rs.close();        
  stmt.close();     
  conn.close();    
}
catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>

