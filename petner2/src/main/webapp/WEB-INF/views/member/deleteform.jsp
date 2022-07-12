<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<script src="${path}/js/member.js"></script>
<link rel="stylesheet" href="${path}/css/body.css">
</head>
<body>
<form action="mem_delete" method="post" id="tab3">
	<input type="hidden" name="mem_id" value="${member.mem_id}" id="mem_id">
	<input type="hidden" name="mem_pwd" value="${member.mem_pwd}" id="mem_pwd">
	<input type="hidden" name="mem_profile" value="${member.mem_profile}">
<br>
<div style="margin-left: 10%">
	<h3 align=center>회원 탈퇴</h3>
	<table border=1 align=center>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="mem_pwd2" name="mem_pwd2" ></td>
		</tr>
	</table>

	<div align=center class="position1">
		<input type="submit" value="탈퇴" id="sign_up"/>
		<input type="reset" value="취소" id="sign_up" onClick="location.href='Mypage?mem_id=${sessionScope.mem_id}'"/>
	</div>
</div>
</form>
<br><br><br><br><br><br><br><br><br><br>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>