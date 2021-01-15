<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet" %>
<!DOCTYPE html>

<%
	String id=(String)request.getParameter("id");
	String name=(String)request.getParameter("name");
	String address=(String)request.getParameter("address");
	String tel=(String)request.getParameter("tel");
	String errmsg=(String)request.getAttribute("errmsg");
	ResultSet rs=null;

%>


<html>
<head>
<meta charset="UTF-8">
<title>住所録編集画面</title>
</head>
<body>

	<p>住所録管理システム：住所録編集</p>

	<form method="GET" action="./EditBL">
		<table>
			<tr>
				<input type="hidden" name="id" value=<%= id %>>
				<td>名前*：</td>
				<td><input type="text" value=<%= name %> name="name"></td>
			</tr>
			<tr>
				<td>住所*：</td>
				<td><input type="text" value=<%= address %> name="address"></td>
			</tr>
			<tr>
				<td>電話番号：</td>
				<td><input type="text" value=<%= tel %> name="tel"></td>
			</tr>
			<tr>
				<td width="100"></td>
				<td width="100"align="left"><input type="submit" value="確認" formaction="./EditBL">
								 </td>
				<td width="100"><input type="submit" value="戻る" formaction="./ListBL"></td>
			</tr>
			</table>
	<%if(errmsg!=null){ %>
	<%= errmsg%>
	<%} %>
	
	
	</form>


</body>
</html>