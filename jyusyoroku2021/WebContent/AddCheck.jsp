<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//AddBLから値を受け取っている
	String name=(String)request.getAttribute("name");
	String address =(String)request.getAttribute("address");
	String tel=(String)request.getAttribute("tel");

%>
<html>
<head>
<meta charset="UTF-8">
<title>住所録新規登録確認画面</title>
</head>
<body>

	<p>住所録管理システム：住所録登録確認</p>

	<form method="GET"  action="./AddCommitBL">
		<table>
			<tr>
				<td>名前*：</td>
				<td><%= name %><input type="hidden" name="name" value=<%= name %>></td>
			</tr>
			
			<tr>
				<td>住所*：</td>
				<td><%= address %><input type="hidden" name="address" value=<%= address %>></td>
			</tr>
			
			<tr>
				<td>電話番号 ：</td>
				<td><%= tel %><input type="hidden" name="tel" value=<%= tel %>></td>
			</tr>
		</table>
		<input type="submit"  value="登録" ><input type="submit" formaction="Add.jsp" value="戻る">
	
	</form>


</body>
</html>