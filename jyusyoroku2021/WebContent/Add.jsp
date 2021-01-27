<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//変数の宣言
	String name=(String)request.getAttribute("name");
	String address=(String)request.getAttribute("address");
	String tel=(String)request.getAttribute("tel");
	String errmsg=(String)request.getAttribute("errmsg");
%>


<html>
<head>
<link rel="stylesheet" href="css/ALL.css" type="text/css">
<meta charset="UTF-8">
<title>住所録新規登録画面</title>
</head>
<body>

<p>住所録管理システム：住所録登録</p>
	<form action="./AddBL" method="GET">
		<table class="table">
			<tr>
				<td>名前　　　：</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>住所　　　：</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>電話番号：</td>
				<td><input type="text" name="tel"></td>
			</tr>
		</table>
		<input type="submit" value="確認" class="bttn btn1"><input type="submit" value="戻る" formaction="ListBL" class="bttn">
	</form>
<br>

<div class="errmsg"><%if(errmsg!=null){ %>
	<%= errmsg%>
<%} %></div>

</body>
</html>