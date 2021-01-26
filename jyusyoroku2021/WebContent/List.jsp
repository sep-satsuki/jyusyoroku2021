<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet" %>
<!DOCTYPE html>

<html>
<head>

<link rel="stylesheet" href="css/List.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	//DB取得用変数
	ResultSet rs = null;
	//総件数
	int listCnt = 0;
	//現在のページ
	String nowPage = "";
	int maxPage = 0;

	String SearchName = "";
%>

<p>住所録管理システム：住所録一覧</p>
<form method="GET" action="./Add.jsp">
<input type="submit" value="新規登録" class="newbtn">
</form>
<form class="Search">
	<ul>
		<li>住所：<input type="text" name="SearchName"></li>
		<li><input type="submit" value="検索"  class="bttn"></li>
	</ul>

</form>

 <%! String createPagenation(int maxPage, String nowPage) {
   //ページネーション部のHTML格納用変数
     String pagenation = "<ul>";
     //現在表示中のページ (引数として受け取ったnowPageをint型に変換)
     int currentPage = Integer.parseInt(nowPage);
     //表示させたいページリンク数の最大数
 	 int PAGE_RANGE = 5;
    //現在表示中のページの前後に表示したいページリンク数
    int PAGE_GAP = 2;
    //現在表示中のページを基準にしたページリンクの開始ページ
    int currentStartPage;
    //現在表示中のページを基準にしたページリンクの終了ページ
    int currentEndPage;

    //currentStartPageとcurrentEndPageを決定する。
    if(PAGE_RANGE < maxPage) {
      //最大ページ数がPAGE_RANGEより大きい場合
      currentStartPage = currentPage - PAGE_GAP;
      currentEndPage = currentPage + PAGE_GAP;

      if(currentStartPage < 1) {
        currentStartPage = 1;
        currentEndPage = currentStartPage + (PAGE_RANGE - 1);
      }
      if(currentEndPage > maxPage) {
        currentEndPage = maxPage;
        currentStartPage = currentEndPage - (PAGE_RANGE - 1);
      }

    } else {
      //最大ページ数がPAGE_RANGE以下の場合
      currentStartPage = 1;
      currentEndPage = maxPage;
    }

    //最初のページへのリンク「<<」と 現在表示ページの1つ前のページへのリンク「<」を作成
    if(currentPage == 1) {
      pagenation += "<li><<</li>";
      pagenation += "<li><</li>";
    } else {
      pagenation += "<li><a href=\"./ListBL?page=1\"><<</a></li>";
      pagenation += "<li><a href=\"./ListBL?page=" + (currentPage - 1) + "\"><</a></li>";
    }

    //ページ数リンクの作成
    for(int i = currentStartPage; i <= currentEndPage; i++) {
      if(currentPage == i) {
        pagenation += "<li class=\"current-page\">" + i + "</li>";
      } else {
        pagenation += "<li><a href=\"./ListBL?page=" + i + "\">" + i + "</a></li>";
      }
    }

    //現在表示ページの1つ先のページへのリンク「>」と 最後のページへのリンク「>>」を作成
    if(currentPage == maxPage) {
      pagenation += "<li>></li>";
      pagenation +=	"<li>>></li>";
    } else {
      pagenation += "<li><a href=\"./ListBL?page=" + (currentPage + 1) + "\">></a></li>";
      pagenation += "<li><a href=\"./ListBL?page=" + maxPage + "\">>></a></li>";
    }
    pagenation += "</ul>";

    return pagenation;
  }
%>
<%	
	request.setCharacterEncoding("UTF-8");
	//nowPageにリクエスト("Page")を設定、Stringに変換
	nowPage = request.getAttribute("page").toString();
	//listCntにリクエスト("listCnt")を設定、intに直してからStringに変換
	listCnt = Integer.parseInt(request.getAttribute("listCnt").toString());
	maxPage = listCnt / 10;

	 if(maxPage == 0) {
		  maxPage = 1;
	  } else {
		  if(!(listCnt % 10 == 0)) maxPage += 1 ;
	  }
	//rsにリクエスト//("Result")を設定
	rs=(ResultSet)request.getAttribute("Result");
%>
<div class="pagenation"><%= createPagenation(maxPage, nowPage) %></div>
<form>

	<table border="1" class="table">
		<tr bgcolor="#4169e1">
			<td width="50"  align="center">No.</td>
			<td width="100"  align="center">名前</td>
			<td width="300" align="center">住所</td>
			<td width="150" align="center">電話番号</td>
			<td width="100" align="center"></td>
		</tr>


		<%//繰り返し処理　while(繰り返し処理)　 %>
		<% while(rs.next()){ %>

				<%String tel=rs.getString("tel");%>
				<%if(tel.getBytes().length >0){ %>
				<%String tel1=tel.substring(0,3); %>
				<%String tel2=tel.substring(3,7); %>
				<%String tel3=tel.substring(7,11);%>
				<%tel=tel1 + "-"  + tel2 + "-" + tel3; %>
<%} %>
		<form method="get" name="<%= rs.getString("id")%>">

			<tr>
				<td width="50" align="center"><%=rs.getString("id") %><input type="hidden" name="id" value="<%= rs.getString("id")%>"></td>
				<td width="100" align="center"><%=rs.getString("name") %><input type="hidden" name="name"  value="<%= rs.getString("name")%>"></td>
				<td width="300" align="center"><%=rs.getString("address") %><input type="hidden" name="address" value="<%= rs.getString("address")%>"></td>
				<td width="120" align="center"><%=tel %><input type="hidden" name="tel" value="<%= tel%>"></td>
				<td width="100" bgcolor="#808080" align="center"><input type="submit" value="編集" formaction="./Edit.jsp"><input type="submit" value="削除" formaction="./Delete.jsp"></td>
			</tr>
		</form>
		<% }%>
	</table>

	<div class="pagenation"><%= createPagenation(maxPage, nowPage) %></div>


</form>
<form method="GET" action="./Add.jsp">
<input type="submit" value="新規登録"  class="newbtn">
</form>

</body>
</html>