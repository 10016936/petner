<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<head>
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
</head>

<body>
<div>
	<h2 align=center>주문이 완료되었습니다.</h2>
	<table class=mytable align=center width=700 height=350>
		<tr>
			<th width=30%>주문승인번호</th>
			<td width=70%>${payment.order_no}</td>
		</tr>
		<tr>
			<th>주문일자</th>
			<td>${payment.payment_regdate}</td>
		</tr>
		<tr>
			<th>주문자명</th>
			<td>${member.mem_name}</td>
		</tr>
		<tr>
			<th>총 결제금액</th>
			<td><fmt:formatNumber pattern="###,###,###"
						value="${payment.payment_price}"/>원</td>
		</tr>
		<tr>
			<th>배송지</th>
			<td>(${member.mem_post}) ${member.mem_addr1} ${member.mem_addr2}</td>
		</tr>
	</table>
</div>
<br>
<br>
<div>
	<h2 align=center>주문 상품 정보</h2>
	<table class=mytable align=center width=700>
		<c:forEach var="row" items="${list}">
			<tr>
				<th colspan=2 width=60%>상품명</th>
				<th>가격</th>
				<th>수량</th>
			</tr>
			<tr>
				<td><img src="${path}/upload/product/${row.product_img}"
					width=120 height=110></td>
				<td><a href="${path}/productdetail?product_no=${row.product_no}"
					style="text-decoration: none">${row.product_name}</td>
				<td><fmt:formatNumber pattern="###,###,###"
						value="${row.product_price}" />원</td>
				<td>${row.order_ea}개</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div align=center>
		<input type="button" class="btn btn-outline-secondary"
			onClick="location.href='${path}/order_list?mem_id=${member.mem_id}'" value="주문 내역 확인">
	</div>
	<br>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
