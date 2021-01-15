<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String id=(String)request.getAttribute("id");
	String name=(String)request.getAttribute("name");
	String address=(String)request.getAttribute("address");
	String tel=(String)request.getAttribute("tel");


%>

<html>
<head>
<meta charset="UTF-8">
<title>住所録編集確認画面</title>
</head>
<body>

	<p>住所録管理システム：住所録編集</p>

	<form method="GET" action="./EditCommitBL">
		<table>
			<tr>
				<input type="hidden" name="id" value=<%= id %>>
				<td>名前*：</td>
				<td><%= name %><input type="hidden" value=<%= name %>></td>
			</tr>
		    <tr>
				<td>住所*：</td>
				<td><%= address %><input type="hidden" value=<%= address %>></td>
			</tr>
		    <tr>
				<td>電話番号：</td>
				<td><%= tel %><input type="hidden" value=<%= tel %>></td>
			</tr>
			<tr>
					<td width="100"></td>
																									<% //formactionは遷移先%>
					<td width="100"align="left"><input type="submit" value="編集" formaction="./EditCommitBL"></td>

					<td width="100"><input type="submit" value="戻る" formaction="./Edit.jsp"></td>
				</tr>
			
			
		</table>

	</form>



</body>
</html>