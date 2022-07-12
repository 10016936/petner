<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
a{
  text-decoration: none;
  color : black;
}
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<script src="${path}/js/jquery.js"></script>
<!-- 게시판 목록 비동기 처리 -->
<script>
	$(function() {
		$('#list').load('qna_list?page=${page} table');
	});
</script>

<body>
	<h2 align=center>상세 페이지</h2>
	<table class=mytable align=center width=600 height=450>
		<tr>
			<th>작성자</th>
			<td>${qna.mem_id}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${qna.qna_readcount}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${qna.qna_reg}"
					pattern="yy-MM-dd HH:mm" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><c:if test="${qna.qna_lev == 0}">[${qna.qna_category}] ${qna.qna_title}</c:if>
				<c:if test="${qna.qna_lev != 0}">${qna.qna_title}</c:if></td>
		</tr>
		<tr>
			<td colspan="2" height=250><pre>${qna.qna_content}</pre></td>
		</tr>
		<c:if test="${qna.qna_lev == 0}">
			<tr>
				<th>첨부파일</th>
				<td><c:if test="${qna.qna_file != null}">
						<a href="${path}/upload/qna/${qna.qna_file}" target="_blank"
							style="text-decoration: none">${qna.qna_file}</a></c:if>
					<c:if test="${qna.qna_file == null}">없음</c:if></td>
			</tr>
		</c:if>
	</table>
	<br>
	<div align="center">
		 <c:if test="${qna.qna_lev != 0 && (sessionScope.mem_id == 'admin' || sessionScope.mem_type == '사업자')}">
		 <c:if test="${qna.qna_lev != 0}"> 
			<input type="button" class="btn btn-outline-secondary" value="수정"
				onClick="location.href='qna_view?qna_no=${qna.qna_no}&page=${page}&state=update'">
			<input type="button" class="btn btn-outline-secondary" value="삭제"
				onClick="location.href='qna_delete?qna_no=${qna.qna_no}&page=${page}'">
		</c:if>
		</c:if>
		 	<c:if test="${qna.qna_lev == 0 && (sessionScope.mem_id == 'admin' || sessionScope.mem_type == '사업자')}">
		<c:if test="${qna.qna_lev == 0}">
			<input type="button" class="btn btn-outline-secondary" value="답변"
				onClick="location.href='qna_view?qna_no=${qna.qna_no}&page=${page}&state=reply'">
		</c:if>
		 	</c:if>
		<c:if test="${qna.qna_lev == 0}">
			<input type="button" class="btn btn-outline-secondary" value="수정"
				onClick="location.href='qna_view?qna_no=${qna.qna_no}&page=${page}&state=update'">
			<input type="button" class="btn btn-outline-secondary" value="삭제"
				onClick="location.href='qna_view?qna_no=${qna.qna_no}&page=${page}&state=delete'">
		</c:if>
		<input type="button" class="btn btn-outline-secondary" value="목록"
			onClick="location.href='qna_list?page=${page}'">
	</div>
	<br>
	<br>
	<div id="list"></div>
	<br>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>