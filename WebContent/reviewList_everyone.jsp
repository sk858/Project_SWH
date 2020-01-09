<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>

<%  
	ReviewDTO [] rarr = (ReviewDTO [])request.getAttribute("rlist");
	MemberDTO [] marr = (MemberDTO [])request.getAttribute("mlist");
	StoreDTO [] sarr = (StoreDTO [])request.getAttribute("slist");
	int curPage = Integer.parseInt(request.getParameter("page"));
	int totalPage = (Integer)request.getAttribute("totalPage");
	int writePages = (Integer)request.getAttribute("writePages");
	String writerName = "";
	String storeName = "";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/common.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>

<title>후기 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<div id="container">
   <nav>
      <div>네비게이션 바</div>
   </nav>
		<hr>
		<h2>후기 목록</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>매장</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>		
<%
		if(rarr == null || rarr.length == 0){
			out.println("후기 글이 없습니다.");
		} else{
			for(int i = 0; i < rarr.length; i++){
				out.println("<tr>");
				out.println("<td>" + rarr[i].getRe_uid() + "</td>");
				out.println("<td><a href='reviewView.slime?re_uid=" + rarr[i].getRe_uid() + "'>" + rarr[i].getRe_subject() + "</a></td>");
				
				for(int j = 0; j < marr.length; j++){
					if(marr[j].getMb_uid() == rarr[i].getWr_uid()){
						writerName = marr[j].getMb_id();
					}
				}
				out.println("<td>" + writerName + "</td>");
				
				for(int k = 0; k < sarr.length; k++){
					if(sarr[k].getSt_uid() == rarr[i].getSt_uid()){
						storeName = sarr[k].getSt_name();
					}
				}
				out.println("<td>" + storeName + "</td>");
				out.println("<td>" + rarr[i].getRe_views() + "</td>");
				out.println("<td>" + rarr[i].getRe_regdate() + "</td>");
				out.println("</tr>");
			}
 		}
%>		
		</table>
		<br>
<% if(marr != null || marr.length != 0){ %>
		<button onclick="location.href='reviewWrite.slime?mb_uid=<%=marr[0].getMb_uid()%>'">신규등록</button>
<% } %>
<%-- 페이징 --%>
<jsp:include page="paginationE.jsp">
	<jsp:param value="<%= writePages %>" name="writePages"/>
	<jsp:param value="<%= totalPage %>" name="totalPage"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>
</jsp:include>

   <footer>
   
   </footer>
</div>
</body>
</html>
