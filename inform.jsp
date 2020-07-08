<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 입력 화면</title>
<style type="text/css">
div{
text-align:center;
}
span{
color:gray;
}
</style>
</head>
<body>
<div>
<span>
사료 : 110 ~150g -> 정상 <br/ >
수분 : 65 ~ 90% -> 정상 <br/>
*사료&수분 둘다 정상이어야 정상으로 기록됨 <br/>
<br/>
</span>
</div>
<form method="post" action="join.jsp">
<table width="400" align = "center" border = "1">
	<tr><th colspan="2">강아지 먹이&수분 수치 시스템</th></tr>
	<tr>
		<td width="200" align="center">n일차 </td>
		<td width="200" align="center"><input type="text" name="day"/></td>
	</tr>
	<tr>
		<td width="200" align="center">사료(g)</td>
		<td width="200" align="center"><input type="text" name="eat"/></td>
	</tr>
	<tr>
		<td width="200" align="center">수분(%) </td>
		<td width="200" align="center"><input type="text" name="drink"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="저장"/></td>
	</tr>
</table>
</form>

</body>
</html>
