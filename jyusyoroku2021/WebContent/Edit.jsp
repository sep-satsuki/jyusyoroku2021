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
<link rel="stylesheet" href="css/ALL.css" type="text/css">
<meta charset="UTF-8">
<title>住所録編集画面</title>
</head>
<body>

	<p>住所録管理システム：住所録編集</p>

	<form method="GET" action="./EditBL">
		<table class="table">
			<tr>
				<input type="hidden" name="id" value=<%= id %>>
				<td>名前　　　：</td>
				<td><input type="text" name="name" value=<%= name %> ></td>
			</tr>
			<tr>
				<td>住所　　　：</td>
				<td><input type="text" name="address" value=<%= address %> ></td>
			</tr>
			<tr>
				<td>電話番号：</td>
				<td><input type="text" name="tel" value=<%= tel %> ></td>
			</tr>

		</table>
		<input type="submit" value="確認" formaction="./EditBL" class="bttn btn1"><input type="submit" value="戻る" formaction="./ListBL" class="bttn">


			<br>
			<br>
			<br>

	<div class="errmsg"><%if(errmsg!=null){ %>
											<%= errmsg%>
										 <%} %></div>
	</form>
</body>
</html>