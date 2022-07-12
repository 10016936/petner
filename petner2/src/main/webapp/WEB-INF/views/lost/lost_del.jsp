<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="header.jsp"%> --%>

<script>
	function check() {
		if (frm.lost_pwd.value != frm.lost_pwd2.value) {
			alert("암호가 다르면 수정할 수 없습니다");
			frm.lost_pwd2.value = '';
			frm.lost_pwd2.focus();
			return false;
		}
	}
</script>

<body>
	<div id="del_wrap">
		<h2 align=center class="del_title">삭제</h2>
		<form method="post" action="lostDeleteFormOk"
			onsubmit="return check()" name="frm" enctype="multipart/form-data">
			<input type="hidden" name="lost_no" value="${lost.lost_no}">
			<input type="hidden" name="pageNum" value="${pageNum}"> <input
				type="hidden" name="lost_pwd" value="${lost.lost_pwd}">
			<!-- db에 저장된 비번 -->
			<table id="del_t" border=1 align=center>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="lost_pwd2" id="lost_pwd2"
						class="input_box" required="required" /></td>
				</tr>
			</table>
			<br>

			<div id="del_menu" align=center>
				<input type="submit" value="삭제" class="input_button" />
				<input type="reset" value="취소" class="input_button" onClick="history.back(-1)" />
			</div>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>

	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>