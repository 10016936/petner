<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${path}/js/review.js"></script>
<style>
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>
<meta charset="UTF-8">
<title>리뷰등록</title>
</head>
<body>
	<form action="reviewupdateresult" method="post" id="reviewupdate" enctype="multipart/form-data">
		<input type="hidden" name="mem_id" value="${member.mem_id}">
		<input type="hidden" name="mem_name" value="${member.mem_name}">
		<input type="hidden" name="product_no" value="${product.product_no}">
		<input type="hidden" name="review_no" value="${old.review_no}">
		
		<h2 align=center>리뷰 수정</h2>
		<table class=mytable align=center width=600 height=400>
			<tr>
				<th width=25%>제목</th>
				<td><input type="text" size=60 name="review_title" id="review_title" value="${old.review_title}"></td>
			</tr>
			<tr>	
				<th>작성자명</th>
				<td>${old.mem_name}</td>
			</tr>
			<tr>
				<th>추천여부</th>
				<td>
					좋아요<input type="radio" name="review_like" id="good" value="좋아요" <c:if test="${old.review_like == '좋아요'}">${'checked'}</c:if>>
					별로예요<input type="radio" name="review_like" id="bad" value="별로예요" <c:if test="${old.review_like == '별로예요'}">${'checked'}</c:if>>
				</td>
			</tr>
			<tr>
				<td colspan=2 height=50%><textarea rows="12" cols="79" name="review_content" id="review_content">${old.review_content}</textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td colspan="3">
				<input type="file" multiple="multiple" name="review_file_" id="review_file">
				<c:forEach var="flist" items="${flist}">
					<div><img src="<%=request.getContextPath()%>/upload/review/${flist}" width=300></div>
				</c:forEach>
				</td>
			</tr>
		</table>
		<br>
		
		<div align=center>
			<input type="submit" class="btn btn-outline-secondary" value="수정">
			<input type="button" class="btn btn-outline-secondary" value="취소" onClick="javascript:history.go(-1)">
		</div>
		<br>
	</form>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>