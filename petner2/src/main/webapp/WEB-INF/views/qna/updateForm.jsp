<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- 외부 자바스크립트 파일(유효성 검사) 불러오기 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/js/qna.js"></script>
<script src="${path}/js/jquery.js"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<body>
	<form action="qna_update" method="post" name="form"
		enctype="multipart/form-data" onSubmit="return check()">
		<input type="hidden" id="page" name="page" value="${page}">
		<input type="hidden" id="qna_no" name="qna_no" value="${qna.qna_no}">
		<input type="hidden" id="qna_pwd" name="qna_pwd" value="${qna.qna_pwd}">
		
		<c:if test="${qna.qna_lev == 0 }"><h2 align=center>문의글 수정</h2></c:if>
		<c:if test="${qna.qna_lev != 0 }"><h2 align=center>답변 수정</h2></c:if>
		<table class=mytable align=center width=600 height=450>
			<tr>
				<th width=180>작성자</th>
				<td><input type="hidden" id="mem_id" name="mem_id" value="${qna.mem_id}">${qna.mem_id}</td>
			</tr>
			<c:if test="${qna.qna_lev == 0 }">
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="qna_pwd2" name="qna_pwd2" autofocus="autofocus">
						<c:if test="${qna.qna_secret == 'Y'}">
						<input type="checkbox" value="Y" checked>비밀글
						<input type="hidden" id="qna_secret" name="qna_secret" value="N"></c:if>
						<c:if test="${qna.qna_secret == 'N'}">
						<input type="checkbox" onclick="$('#qna_secret').val('Y')">비밀글
						<input type="hidden" id="qna_secret" name="qna_secret" value="N"></c:if>
					</td>
				</tr>
			</c:if>
			<c:if test="${qna.qna_lev == 0 }">
				<tr>
					<th>문의종류</th>
					<td><select id="qna_category" name="qna_category">
							<option value="${qna.qna_category}">${qna.qna_category}</option>
							<option value="상품">상품</option>
							<option value="결제">결제</option>
							<option value="배송">배송</option>
							<option value="교환/환불">교환/환불</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
			</c:if>
			<tr>
				<th>제목</th>
				<td><c:if test="${qna.qna_lev == 0 }">
						<input type="text" size=60 id="qna_title" name="qna_title" value="${qna.qna_title}"></c:if>
					<c:if test="${qna.qna_lev != 0 }">
						<input type="hidden" id="qna_title" name="qna_title" value="${qna.qna_title}">${qna.qna_title}
						<input type="checkbox" onclick="$('#qna_secret').val('Y')">비밀글
						<input type="hidden" id="qna_secret" name="qna_secret" value="N"></c:if>
				</td>
			<tr>
				<th>내용</th>
				<td height=45%><textarea rows="15" cols="57" id="qna_content" name="qna_content">${qna.qna_content}</textarea></td>
			</tr>
			 	<c:if test="${qna.qna_lev == 0}">
			<tr>
				<th>파일첨부</th>
				<td><input type="file" id="qna_file1" name="qna_file1"></td>
			</tr>
			 	</c:if>
		</table>
		<br>
		<div align=center>
			<input type="submit" class="btn btn-outline-secondary" value="수정">
			<input type="reset" class="btn btn-outline-secondary" value="취소">
		</div>
	</form>
	<br>

</div>
<%@ include file="../include/footer.jsp" %>
</body>