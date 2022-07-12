<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<script src="${path}/js/tipboard.js"></script>
</head>
<body>
	<h2 align=center>상세 페이지</h2>
 	<div class="container" align=center>		
		<c:if test="${not empty tipboard.tip_file}">
			<img src="${path}/upload/tipboard/${tipboard.tip_file}">
		</c:if>

		<c:if test="${empty tipboard.tip_file}">
			<p>이미지가 없습니다.</p>
		</c:if>
	</div>
		
		<table align=center>
		<tr height=50><td><strong>${tipboard.tip_title}</strong></td></tr>
		<tr><td>${tipboard.tip_content}</td></tr>
		</table>
<br>
		<div align=center>
			<c:if test="${sessionScope.mem_id == tipboard.mem_id}">
				<input type="button" class="btn btn-outline-secondary" value="수정"
					onClick="location.href='statusTipboard?tip_no=${tipboard.tip_no}&pageNum=${pageNum}&state=edit'">
				<input type="button" class="btn btn-outline-secondary" value="삭제"
					onClick="location.href='statusTipboard?tip_no=${tipboard.tip_no}&pageNum=${pageNum}&state=del'">
			</c:if>
			<input type="button" class="btn btn-outline-secondary" value="목록"
				onClick="location.href='tipboardList?pageNum=${pageNum}'">
		</div>
	<br>

	<div style="margin:auto;text-align:center;">
	<form style="display:inline-block;" name="frm" id="frm">
		<input type="hidden" name="mem_id" id="mem_id" value="${sessionScope.mem_id}">
		<input type="hidden" name="tip_no" id="tip_no" value="${tipboard.tip_no}">
		<textarea rows="5" cols="70" name="tipreply_content" id="tipreply_content"></textarea>
		<input type="button" class="btn btn-outline-secondary" value="댓글달기" id="repInsert">
	</form>
	</div>
	<br>
	
	<div id="slist"></div>
	<br>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>