<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
	<h2 align="center">상품 목록</h2>
	<table class=mytable align="center" width=1100 height=550>
		<tr>
			<th width=80 height=50>번호</th>
			<th colspan="2" width=200>종류</th>
			<th>사진</th>
			<th width=30%>상품명</th>
			<th>제조사</th>
			<th width=80>가격</th>
		</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="6">등록된 상품이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty list}">
		<!-- 전체목록 -->
		<c:forEach var="plist" items="${list}">
		<c:if test="${plist.product_del == 'n'}">
		<tr>
			<td>${plist.product_no}</td>
			<td width=70>${plist.product_pet}</td>
			<td width=100>${plist.product_category}</td>
			<td><a href="productdetail?product_no=${plist.product_no}&pageNum=${pp.currentPage}">
				<img src="<%=request.getContextPath()%>/upload/product/${plist.product_img}" width=200 height=200></a>
			</td>
			<td>
				${plist.product_name}
			</td>
			<td>${plist.product_make}</td>
			<td><fmt:formatNumber pattern="###,###,###" value="${plist.product_price}" />원</td>
		</tr>
		</c:if>
		</c:forEach>
	</c:if>
	</table>
	<br>
	<form action="productlist" align="center">
		<input type="hidden" name="pageNum" value="1">
		<select name="search">
			<option value="product_no" <c:if test="${search=='product_no'}">selected="selected"</c:if>>상품번호</option>
			<option value="product_name" <c:if test="${search=='product_name'}">selected="selected"</c:if>>상품명</option>
			<option value="product_make" <c:if test="${search=='product_make'}">selected="selected"</c:if>>제조사명</option>
			<option value="seller_name" <c:if test="${search=='seller_name'}">selected="selected"</c:if>>판매자명</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="확인">
	</form>
	<br>
	<div align="center">
	<!-- 전체 페이징 -->
	<c:if test="${empty keyword}">
		<c:if test="${pp.startPage > pp.pagePerBlk}">
			<a href="productlist?pageNum=${pp.startPage - 1}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage == i}"></c:if>
			<a href="productlist?pageNum=${i}">${i}</a>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="productlist?pageNum=${pp.endPage + 1}">다음</a>
		</c:if>
	</c:if>
	
	<!-- 검색 페이징 -->
	<c:if test="${not empty keyword}">
		<c:if test="${pp.startPage > pp.pagePerBlk}">
			<a href="productlist?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage == i}"></c:if>
			<a href="productlist?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="productlist?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a>
		</c:if>
	</c:if>
	</div>
	<br>

	<c:if test="${sessionScope.mem_type == '사업자'}">
		<div align="center"><a href="productmylist?seller_no=${sessionScope.seller_no}">내 등록상품</a></div>
	</c:if>
	<br>
	</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>