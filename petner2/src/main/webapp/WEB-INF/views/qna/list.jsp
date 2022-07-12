<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<script src="http://code.jquery.com/jquery-latest.js"></script>

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

<body>
	<h2 align=center>Q&A 게시판</h2>
	<table class=mytable align="center" width=1000>
		<tr height=50>
			<th>번호</th>
			<th>카테고리</th>
			<th width=35%>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>첨부</th>
			<th>답변상태</th>
		</tr>

		<c:if test="${empty list}">
			<tr>
				<td colspan="8" align="center" height=50>데이터가 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${not empty list}">
			<c:set var="no1" value="${no}" />
			<c:forEach var="qna" items="${list}">
				<tr height=50>
					<td>${no1}</td>
					<td>${qna.qna_category}</td>
					<td style="text-align: left"><c:if test="${qna.qna_secret == 'Y' && (sessionScope.mem_id == null || (sessionScope.mem_type == '일반회원' && sessionScope.mem_id != qna.mem_id))}">
							<a href="qna_msg?msg=1&page=${pp .currentPage}">
								<c:if test="${qna.qna_lev <= 0 }">
									<img src="${path}/images/secret.png" width=15 height=13/>${qna.qna_title}</c:if>
								<c:if test="${qna.qna_lev > 0 }"> &nbsp;&nbsp;
									<img src="${path}/images/reply.png" width=15 height=13/>${qna.qna_title}</c:if>
							</a>
						</c:if>
						<c:if test="${qna.qna_secret == 'Y' && sessionScope.mem_id != null && (sessionScope.mem_type == '사업자' || sessionScope.mem_id == qna.mem_id || sessionScope.mem_id == 'admin')}">	
							<a href="qna_view?qna_no=${qna.qna_no}&page=${pp.currentPage}&state=view">
								<c:if test="${qna.qna_lev <= 0 }">
									<img src="${path}/images/secret.png" width=15 height=13/>${qna.qna_title}</c:if>
								<c:if test="${qna.qna_lev > 0 }">
									&nbsp;&nbsp;<img src="${path}/images/reply.png" width=15 height=13/>${qna.qna_title}</c:if>
							</a>
						</c:if>
						
						<c:if test="${qna.qna_secret == 'N' && sessionScope.mem_id == null}">
							<a href="qna_msg?msg=1&page=${pp.currentPage}">
								<c:if test="${qna.qna_lev <= 0 }">${qna.qna_title}</c:if>
								<c:if test="${qna.qna_lev > 0 }">&nbsp;&nbsp;
									<img src="${path}/images/reply.png" width=15 height=13/>${qna.qna_title}</c:if>
							</a>
						</c:if>
						<c:if test="${qna.qna_secret == 'N' && sessionScope.mem_id != null}">
							<a href="qna_view?qna_no=${qna.qna_no}&page=${pp.currentPage}&state=view">
								<c:if test="${qna.qna_lev <= 0 }">${qna.qna_title}</c:if>
								<c:if test="${qna.qna_lev > 0 }"> &nbsp;&nbsp;
									<img src="${path}/images/reply.png" width=15 height=13/>${qna.qna_title}</c:if>
							</a>
						</c:if>
					</td>
					<td>${qna.mem_id}</td>
					<td>${qna.qna_readcount}</td>
					<td><fmt:formatDate value="${qna.qna_reg}" pattern="yy-MM-dd HH:mm" /></td>
					<td align="center">
						<c:if test="${not empty qna.qna_file}">
							<img src="${path}/images/clip.png" height="20" width="20" />
						</c:if>
					</td>
					<td>${qna.qna_answer}</td>
				</tr>
				<c:set var="no1" value="${no1 -1}" />
			</c:forEach>
		</c:if>
	</table>
	<br>
	<form action="qna_list" align=center>
		<input type="hidden" name="page" value="1">
		<select name="search">
			<option value="qna_title" <c:if test="${search=='qna_title'}">selected="selected" </c:if>>제목</option>
			<option value="mem_id" <c:if test="${search=='mem_id'}">selected="selected" </c:if>>작성자</option>
			<option value="qna_content" <c:if test="${search=='qna_content'}">selected="selected" </c:if>>내용</option>
			<option value="subcon" <c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
		</select>
		<input type="text" name="keyword"> <input type="submit" value="확인">
	</form>
	<br>
	<div align=center>
		<!-- 검색 했을 경우의 페이징 처리 -->
		<c:if test="${not empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="qna_list?page=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a> </c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}"></c:if>
				<a href="qna_list?page=${i}&search=${search}&keyword=${keyword}">${i}</a>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="qna_list?page=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></c:if>
		</c:if>

		<!-- 전체 목록의 페이징 처리 -->
		<c:if test="${empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="qna_list?page=${pp.startPage - 1}">이전</a></c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}"></c:if>
				<a href="qna_list?page=${i}">${i}</a>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="qna_list?page=${pp.endPage + 1}">다음</a></c:if>
		</c:if>
	</div>
	<br>
	  	<c:if test="${sessionScope.mem_id != null}">
			<div align="center">
				<input type="button" class="btn btn-outline-secondary" value="글 작성" onClick="location.href='qna_insertForm'"/>
			</div>
		</c:if>
	<br>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>