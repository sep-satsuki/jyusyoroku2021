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
<meta charset="UTF-8">
<title>住所録削除画面</title>
</head>
<body>

	<p>下記住所を削除します。よろしいですか？</p>
	<form method="GET" action="./ListBL">
	<table>
		<tr>
			<input type="hidden" name="id" value=<%= id %>>
			<td>名前；</td>
			<td><%= name %><input type="hidden" name="name" value=<%= name %>></td>
		</tr>
		<tr>
			<td>住所：</td>
			<td><%= address %><input type="hidden" name="address" value=<%= address %>></td>
		</tr>
		<tr>
			<td>電話番号：</td>
			<td><%= tel %><input type="hidden" name="tel" value=<%= tel %>></td>
		</tr>
		<tr>
					<td width="100"></td>
																									<% //formactionは遷移先%>
					<td width="100"align="left"><input type="submit" value="OK" class="btn btn1" formaction="./DeleteCommitBL"></td>

					<td width="100"><input type="submit" value="キャンセル" class="btn btn2" formaction="./ListBL"></td>
				</tr>
		
		
		
	</table>

	
	
    </form>

</body>
</html>