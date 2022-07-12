<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${path}/js/tipboard.js"></script>
</head>
<body>
	<form action="deleteTip" method="post" enctype="multipart/form-data" id="tab3">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="tip_no" value="${tipboard.tip_no}">
		<input type="hidden" name="mem_id" value="${sessionScope.mem_id}">
		<input type="hidden" name="mem_pwd" value="${member.mem_pwd}" id="mem_pwd">
		<input type="hidden" name="tip_file" value="${tipboard.tip_file}">

		<h2 align=center>삭제</h2>
		<table border=1 align=center>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="mem_pwd" name="mem_pwd"></td>
			</tr>
		</table>
		<br>

		<div align=center class="position1">
			<input type="submit" class="btn btn-outline-secondary" value="삭제">
			<input type="reset" class="btn btn-outline-secondary" value="취소">
		</div>
	</form>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>