<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String tel=request.getParameter("tel");
	ResultSet rs=null;
%>
<html>
<head>
<link rel="stylesheet" href="css/ALL.css" type="text/css">
<meta charset="UTF-8">
<title>住所録削除画面</title>
</head>
<body>

	<p class=deletemsg>下記住所を削除します。よろしいですか？</p>
	<form method="GET">
	<table class="table">
		<tr>
			<input type="hidden" name="id" value=<%= id %>>
			<td>名前　　　：</td>
			<td><%= name %><input type="hidden" name="name" value=<%= name %>></td>
		</tr>
		<tr>
			<td>住所　　　：</td>
			<td><%= address %><input type="hidden" name="address" value=<%= address %>></td>
		</tr>
		<tr>
			<td>電話番号：</td>
			<td><%= tel %><input type="hidden" name="tel" value=<%= tel %>></td>
		</tr>
	</table>
	<input type="submit" value="OK"  formaction="./DeleteCommitBL" class="bttn btn1"><input type="submit" value="キャンセル"  formaction="./ListBL" class="bttn">


    </form>

</body>
</html>