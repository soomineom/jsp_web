<%@ page import = "java.sql.*" %>
<%
   	Connection conn = null;
   	PreparedStatement pstmt = null;
    request.setCharacterEncoding("UTF-8");
    String day  = request.getParameter("day");            
    String eat = request.getParameter("eat");
    String drink  = request.getParameter("drink");    
    
    //db명:homework, 정상테이블:chart, 비정상테이블:chart22, 모두:chart33
    
   try {
      String url = "jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=UTF-8";
      String id = "root"; 
      String pw = "abcd1234"; 
      Class.forName("com.mysql.jdbc.Driver");
      int aeat = Integer.parseInt(eat);
      int adrink = Integer.parseInt(drink);
      if(110 <= aeat && aeat < 151 && 65<=adrink && adrink<=100 )
      {
        out.println("Normal ! :)");
      	conn = DriverManager.getConnection(url, id, pw);
      	String sql = "INSERT INTO chart(day, eat, drink)  VALUES('"+day+"','"+eat+"','"+drink+"')";
     	pstmt = conn.prepareStatement(sql);
      	pstmt.executeUpdate();
     	pstmt.close();
      	conn.close();
      }
      else if(aeat<110 || 150<=aeat || adrink<65 || 100<adrink)
      {
        conn = DriverManager.getConnection(url, id, pw);
        String sql = "INSERT INTO chart22(day, eat, drink)  VALUES('"+day+"','"+eat+"','"+drink+"')";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
      }
    
      conn = DriverManager.getConnection(url, id, pw);
      String sql = "INSERT INTO chart33(day, eat, drink)  VALUES('"+day+"','"+eat+"','"+drink+"')";
      pstmt = conn.prepareStatement(sql);
      pstmt.executeUpdate();
      pstmt.close();
      conn.close();
   }
       catch(Exception e){
        out.println( e );
    }
       
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sensor</title>
</head>
<body>
<font color=red>
See TABLE & CHARTS
<BR>
</font>
<form>

<BR>
<font color=green>
Normal
</font>
<BR><jsp:include page="real_normal.jsp"/><BR>

<font color=green>
Not Normal
</font>
<BR><jsp:include page="not_normal.jsp"/><BR>

<font color=blue>
All
</font>
<BR><jsp:include page="show_all.jsp"/>

</form>
</body>
</html>
