<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<style>
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<meta charset="UTF-8">
<title>리뷰상세</title>
</head>
<body>
	<h2 align=center>리뷰</h2>
	<table class=mytable align=center width=600 height=400>
		<tr colspan=3>
			<th width=180>상품번호</th>
			<td colspan=2>${reviewdetail.product_no}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan=2>${reviewdetail.mem_id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan=2>${reviewdetail.review_title}</td>
		</tr>
		<tr>	
			<th>추천여부</th>
			<td colspan=2>${reviewdetail.review_like}</td>
		</tr>
		<tr height=50%>	
			<td colspan=2 width=250>
			<br>
			<c:forEach var="flist" items="${flist}">
				<span><img src="<%=request.getContextPath()%>/upload/review/${flist}"
							style="margin-left:5%; margin-bottom:5%;" width=80% height=200></span>
			</c:forEach></td>
			<td colspan=2>
			<pre>${reviewdetail.review_content}</pre></td>
		</tr>
	</table>
	<br>
	
	<div align="center">
		<c:if test="${reviewdetail.mem_id == mem_id}">
			<input type="button" class="btn btn-outline-secondary" value="수정"
				onClick="location='reviewupdateform?product_no=${reviewdetail.product_no}&review_no=${reviewdetail.review_no}&pageNum=${pageNum}'">
			<input type="button" class="btn btn-outline-secondary" value="삭제" 
				onClick="if(confirm('정말 삭제하시겠습니까?'))location='reviewdeleteresult?review_no=${old.review_no}&pageNum=${pageNum}'">
		</c:if>
		<input type="button" class="btn btn-outline-secondary" value="목록" onClick="history.go(-1)">
	</div>
	<br>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>