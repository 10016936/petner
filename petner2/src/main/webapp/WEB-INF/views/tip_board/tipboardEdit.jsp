<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<meta charset="UTF-8">
<title>팁게시판 수정폼</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<script src="${path}/js/tipboard.js"></script>
</head>
<body>
	<form action="updateTip" method="post" enctype="multipart/form-data" id="tab1">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="tip_no" value="${tipboard.tip_no}">
	<input type="hidden" name="mem_id" value="${sessionScope.mem_id}">
	<input type="hidden" name="mem_pwd" value="${member.mem_pwd}" id="mem_pwd">
	<table class=mytable align=center width=600 height=400>
		<tr>
			<th width=180>작성자</th>
			<td><input type="hidden" id="mem_id" name="mem_id" value="${sessionScope.mem_id}">${mem_id}</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" size=60 id="mem_pwd2"></td>
		</tr>
		<tr>
			<th>펫 종류</th>
			<td><input type="radio" name="tip_pet" value="cat" id="tip_pet1" <c:if test="${tipboard.tip_pet == 'cat'}">${'checked'}</c:if>>고양이
				<input type="radio" name="tip_pet" value="dog" id="tip_pet2" <c:if test="${tipboard.tip_pet == 'dog'}">${'checked'}</c:if>>강아지</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" size=60 name="tip_title" id="tip_title" value="${tipboard.tip_title}"></td>
		</tr>
		<tr>
			<th height=50%>내용</th>
			<td><textarea rows="12" cols="57" name="tip_content" id="tip_content">${tipboard.tip_content}</textarea></td>
		</tr>
		<tr>
			<th>파일첨부</th>
			<td><input type="file" id="tip_file1" name="tip_file1"></td>
		</tr>
	</table>
	<br>
	
	<div align=center class="position1">
		<input type="submit" class="btn btn-outline-secondary" value="수정">
		<input type="reset" class="btn btn-outline-secondary" value="취소">
	</div>
	<br>
</form>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>