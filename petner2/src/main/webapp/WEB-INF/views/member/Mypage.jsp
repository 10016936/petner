<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div style="margin-left:15%">
		<table align=center width=800 height=500>
			<tr colspan=3 align=center>
				<th rowspan=6 width="50%">
				<c:if test="${empty member.mem_profile}">
       				&nbsp; </c:if>
        		<c:if test="${!empty member.mem_profile}">
					<img src="${path}/upload/member/${member.mem_profile}" width="350" height="420" />
				</c:if></th>
			</tr>
   			<tr>
				<th width=80>이름</th>
				<td>&nbsp;${member.mem_name}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>&nbsp;${member.mem_addr1} ${member.mem_addr2}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>&nbsp;${member.mem_phone1}-${member.mem_phone2}-${member.mem_phone3}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>&nbsp;${member.mem_email}@${member.mem_domain}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>&nbsp;${member.mem_grade}</td>
			</tr>
		</table>
   
<%--  
      <img src="${path}/upload/member/${member.mem_profile}">
      <h5>회원등급</h5>
      <p>${member.mem_grade}</p>
      <h5>이름</h5>
      <p>${member.mem_name}</p>
      <h5>이메일</h5>
      <p>${member.mem_email}@${member.mem_domain}</p>
      <h5>전화번호</h5>
      <p>${member.mem_phone1}-${member.mem_phone2}-${member.mem_phone3}</p>
      <h5>주소</h5>
      <p>${member.mem_addr1}-${member.mem_addr2}</p>
 
      <input type="button" value="회원 정보 수정"
         onClick="location='updateMember?mem_id=${sessionScope.mem_id}'">
      <input type="button" value="회원 탈퇴"
         onClick="location='deleteMember?mem_id=${sessionScope.mem_id}'">
      <input type="button" value="장바구니"
         onClick="location.href='basketList?mem_id=${sessionScope.mem_id}'">
   
      <c:if test="${member.mem_type=='일반회원'}">
      <input type="button" value="사업자 승인신청"
         onClick="location.href='TransferForm?mem_id=${sessionScope.mem_id}'">
      </c:if>
      <input type="button" onClick="location.href='order_list'" value="주문내역">


      <c:if test="${member.mem_type =='사업자'}">
         <input type="button" onClick="location.href='sell_list'" value="판매내역">
         <input type="button" onClick="location.href='sell_manage'" value="판매관리">
		<div align="center"><a href="productmylist?seller_no=${sessionScope.seller_no}">내 등록상품</a></div>
	  </c:if> --%>
   </div>
	<br>
	
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>