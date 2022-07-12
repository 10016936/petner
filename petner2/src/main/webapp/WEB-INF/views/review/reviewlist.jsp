<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

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
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<meta charset="UTF-8">
<title>리뷰관리</title>
</head>
<body>
	<div style="margin-left: 21%">
	<h3 style="margin-left: 45%">리뷰 관리</h3>
	<table class=mytable align="center" width=850>
		<tr height=50>
			<th>번호</th>
			<th>상품번호</th>
			<th width=45%>제목</th>
			<!-- <th>첨부</th> -->
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5" height=50>등록된 리뷰가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:set var="num" value="${no}" />
			<c:forEach var="rlist" items="${list}">
				<tr height=50>
					<c:if test="${rlist.review_del == 'n'}">
						<td>${num}</td>
						<td>${rlist.product_no}</td>
						<td><a href="reviewdetail?review_no=${rlist.review_no}&pageNum=${pp.currentPage}">${rlist.review_title}</a></td>
						<%-- <td><img src="<%=request.getContextPath()%>/upload/review/${rlist.review_file}" width=200></td> --%>
						<td>${rlist.mem_name}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${rlist.review_date}" /></td>
					</c:if>
				</tr>
				<c:set var="num" value="${num -1}"></c:set>
			</c:forEach>
		</c:if>
	</table>
	<br>
	
	<div align="center">
		<c:if test="${pp.startPage > pp.pagePerBlk}">
			<a href="reviewlist?pageNum=${pp.startPage - 1}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage == i}"></c:if>
			<a href="reviewlist?pageNum=${i}">${i}</a>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="reviewlist?pageNum=${pp.endPage + 1}">다음</a>
		</c:if>
	</div>
	</div>
	<br>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>