<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
td {
  text-align: center;
}

a{
  text-decoration: none;
  color : black;
}

li {
   display: inline-block;
}

li a {
	text-decoration: none;
}
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2 align="center">팁 게시판</h2>
<table class=mytable align=center width=1000>
	<tr height=50>
		<th>번호</th>
		<th>펫</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<c:if test="${empty list}">
		<tr>
			<td colspan=6 height=50>데이터가 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${not empty list}">
		<c:set var="no1" value="${no}"/>
		<c:forEach var="tiplist" items="${list}">
			<tr height=50>
				<td>${no1}</td>
				<td>${tiplist.tip_pet}</td>
				<td><a href="tipboard_detail?tip_no=${tiplist.tip_no}&pageNum=${pp.currentPage}">${tiplist.tip_title}</a></td>
				<td>${tiplist.mem_id}</td>
				<td><fmt:formatDate value="${tiplist.tip_regdate}" pattern="yy-MM-dd" /></td>
				<td>${tiplist.tip_readcount}</td>
			</tr>
			<c:set var="no1" value="${no1 -1}"/>
		</c:forEach>
	
	</c:if>
</table>
<br>
<form action="tipboardList" align=center>
			<input type="hidden" name="pageNum" value="1"> 
			<select	name="search">
				<option value="tip_title" <c:if test="${search=='tip_title'}">selected="selected" </c:if>>제목</option>
				<option value="tip_pet" <c:if test="${search=='tip_pet'}">selected="selected" </c:if>>펫종류</option>
				<option value="mem_id" <c:if test="${search=='mem_id'}">selected="selected" </c:if>>작성자</option>
			</select> 
			<input type="text" name="keyword"> 
			<input type="submit" value="확인">
		</form>
		<br>
		<div class="pagination" align=center style="list-style:none">
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk}">
					<li><a
						href="tipboardList?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}"></c:if>>
					<a href="tipboardList?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a
						href="tipboardList?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
			
			<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="tipboardList?pageNum=${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
						<a href="tipboardList?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="tipboardList?pageNum=${pp.endPage + 1}">다음</a></li>
				</c:if>
			</c:if>
		</div>
		<br>
		<div align="center">
			<input type="button" class="btn btn-outline-secondary" value="글 작성"
				onClick="location.href='insertTipboard'"/>
		</div>
		<br>
		</div>
		<%@ include file="../include/footer.jsp" %>

</body>
</html>