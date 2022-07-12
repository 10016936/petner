<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../include/header.jsp" %>   
<%@ include file="../include/sidebar.jsp" %>   

<!DOCTYPE html>
<html>
<head>
<style>
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 원래는 action으로 지정된 컨트롤러에서 암호비교를 했음 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	/* function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호가 다르면 수정할 수 없습니다");
			frm.passwd2.value = '';
			frm.passwd2.focus();
			return false;
		}
	} */
	
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {				
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('seller_post').value = data.zonecode;
				document.getElementById('seller_addr1').value = data.address;				
			}
		}).open();
	}
</script>
</head>
<body>
	<div class="container" style="margin-left: 15%">
		<h3 class="text-primary" align=center>사업자 신청</h3>
		<!-- <form action="Transfer" method="post" name="frm" onsubmit="return chk()"> -->
		<form action="Transfer" method="post" name="frm">
			<input type="hidden" name="mem_id" value="${mem_id}">
			<!-- db에 저장된 비번 -->
			<table class=mytable align=center width=600 height=400>
				<tr>
					<th width=200>아이디</th>
					<td>${mem_id}</td>
				</tr>
				<tr>
					<th>회사명</th>
					<td><input type="text" size=50 name="seller_name" required="required"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" size=37 name="seller_post" id="seller_post" required="required">
						<input type="button" value="우편번호검색" class="input_button" onclick="openDaumPostcode()" />
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" size=50 name="seller_addr1" id="seller_addr1" required="required"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" size=50 name="seller_addr2" required="required"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%@ include file="tel_number.jsp"%>
						<select name="seller_tel1">
							<c:forEach var="t" items="${tel}" begin="0" end="18">
								<!-- request.setAttribute로 tel값을 공유하고 와야한다 -->
								<option value="${t}">${t}</option>
							</c:forEach>
						</select>-<input name="seller_tel2" id="seller_tel2" size="15" maxlength="4" class="input_box" /> -
						<input name="seller_tel3" id="seller_tel3" size="15" maxlength="4" class="input_box" />
					</td>
				</tr>
			</table>
			<br>
			
			<div align=center>
				<input type="submit" class="btn btn-outline-secondary" value="신청">
				<input type="reset" class="btn btn-outline-secondary" value="취소">
			</div>
		</form>
	</div>
	<br>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>