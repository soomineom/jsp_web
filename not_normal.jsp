<%@ page  contentType="text/html;charset=utf-8"
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<%
	response.setContentType("text/html;charset=utf-8;");
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=utf-8";
	String id = "root";
	String pwd= "abcd1234";
	
	Connection conn= null;
	Statement stmt = null;
	ResultSet rs   = null;

	try {
		conn = DriverManager.getConnection(url,id,pwd);
		stmt = conn.createStatement();
		String query = "select *from chart22";
		rs = stmt.executeQuery(query);
 %>
<table border="1" cellspacing="0">
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
    } // end while
%></table>

<table>
<tr>
<td colspan="2">
<input type=button value="See Not Normal Chart" Onclick="window.location='chart_not_normal.jsp'"/>
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
