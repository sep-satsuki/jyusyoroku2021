<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//サーブレットから値を受け取っている
	String name=(String)request.getAttribute("name");
	String address=(String)request.getAttribute("address");
	String tel=(String)request.getAttribute("tel");
	String errmsg=(String)request.getAttribute("errmsg");

%>
<html>
<head>
<meta charset="UTF-8">
<title>住所録新規登録画面</title>
</head>
<body>

<p>住所録管理システム：住所録登録</p>

	<form action="./AddBL" method="GET">
	
		名前*:<input type="text" name="name"><br>
		住所*：<input type="text" name="address"><br>
		電話番号:<input type="text" name="tel"><br>
	
		<input type="submit" value="確認" ><input type="submit" value="戻る" formaction="ListBL">
	</form>



</body>
</html>