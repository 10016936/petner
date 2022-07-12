<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@include file="../include/sidebar.jsp"%>

<style>
td {
  text-align: center;
}
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<html>
<body>
<form action="update_seller_accept" method="post">
	<div style="margin-left: 23%">
	<h3 style="margin-left: 50%">사업자 관리</h3>
	<table class=mytable align=center width=950 height=550>
		<tr>
			<th></th>
			<th>번호</th>
			<th>회사명</th>
			<th width=35%>주소</th>
			<th>연락처</th>
			<th>사업자</th>
			<th>승인상태</th>
		</tr>

		<c:forEach var="list" items="${list}">		
		<tr>
			<td><input type="checkbox" name="update_seller_accept" id="update_seller_accept" value="${list.seller_no}"></td>
			<td>${list.seller_no}</td>
			<td>${list.seller_name}</td>
			<td>${list.seller_addr1}-${list.seller_addr2}</td>
			<td>${list.seller_tel1}-${list.seller_tel2}-${list.seller_tel3}</td>
			<td>${list.mem_id}</td>
			<td>
			<c:if test="${list.seller_accept != 0}">
			승인완료</c:if>
			<c:if test="${list.seller_accept == 0}">
			승인대기
			
			</c:if>
			</td>	
		</tr>
		</c:forEach>
	</table>
	<br>
		<div style="margin-left: 50%">
			<input type="submit" class="btn btn-outline-secondary" value="승인">
			<input type="button" class="btn btn-outline-secondary" value="반려">
		</div>
	<br>
	</div>
</form>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>