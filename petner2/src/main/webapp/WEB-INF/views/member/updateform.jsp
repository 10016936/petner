<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
<!-- jquery ui가 최신버전에서는 쓸수 없다. -->
<script src="${path}/js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${path}/css/body.css">
<script>
//우편번호, 주소 Daum API
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {				
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
			document.getElementById('mem_post').value = data.zonecode;
			document.getElementById('mem_addr1').value = data.address;				
		}
	}).open();
}
</script>
</head>

<body>
<form method="post" action="mem_update" enctype="multipart/form-data" id="tab2" name="tab" class="tab">
	<input type="hidden" name="mem_id" id="mem_id" value="${member.mem_id}">
	<input type="hidden" name="mem_pwd" id="mem_pwd" value="${member.mem_pwd}">
	<div style="margin-left:25%">
		<h3 align=center>회원 정보 수정</h3>
		<table class=mytable align=center height=500>
		<tr>
			<th width=150>아이디</th>
			<td>${member.mem_id}</td>
		</tr>	
		<tr>
			<th>이름</th>
			<td>${member.mem_name}</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="mem_pwd2" id="mem_pwd2" class="mem"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><select name="mem_phone1">
			<option value="010" <c:if test="${member.mem_phone1 == '010'}">${'selected'}</c:if>>010</option>
			<option value="011" <c:if test="${member.mem_phone1 == '011'}">${'selected'}</c:if>>011</option>
			<option value="012" <c:if test="${member.mem_phone1 == '012'}">${'selected'}</c:if>>012</option>
			<option value="013" <c:if test="${member.mem_phone1 == '013'}">${'selected'}</c:if>>013</option>
			</select> - 
			<input type="text" name="mem_phone2" id="mem_phone2" value="${member.mem_phone2}"/> - 
			<input type="text" name="mem_phone3" id="mem_phone3" value="${member.mem_phone3}"/></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" name="mem_post" id="mem_post" readonly value="${member.mem_post}">
				<input type="button" value="우편번호검색" onClick="openDaumPostcode()"/></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="mem_addr1" id="mem_addr1" class="mem" readonly value="${member.mem_addr1}"></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" name="mem_addr2" id="mem_addr2" class="mem" value="${member.mem_addr2}"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="mem_email" id="mem_email" value="${member.mem_email}"/>@<input type="text" name="mem_domain" id="mem_domain" value="${member.mem_domain}"/>
				<select id="mail_list" onchange="domain_list()">
					<option value="">직접입력</option>
					<option value="daum.net" <c:if test="${member.mem_domain == 'daum.net'}">${'selected'}</c:if>>daum.net</option>
					<option value="nate.com" <c:if test="${member.mem_domain == 'nate.com'}">${'selected'}</c:if>>nate.com</option>
					<option value="naver.com" <c:if test="${member.mem_domain == 'naver.com'}">${'selected'}</c:if>>naver.com</option>
					<option value="hotmail.com" <c:if test="${member.mem_domain == 'hotmail.com'}">${'selected'}</c:if>>hotmail.com</option>
					<option value="gmail.com" <c:if test="${member.mem_domain == 'gmail.com'}">${'selected'}</c:if>>gmail.com</option>
				</select></td>
		</tr>
		<tr>
			<th>프로필</th>
			<td><input type="file" id="mem_profile" name="mem_profile1"/></td>
		</tr>
		</table>
		
		<div class="position1" align=center>
		<input type="submit" value="수정" id="sign_up"/>
		<input type="button" value="취소" id="sign_up" onClick="history.back(-1)">
		</div>
	</div>
	</form>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>