<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
th, td {
  text-align: center;
  height:50;
}
a{
  text-decoration: none;
  color : black;
}
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<body>
<c:choose>
	<c:when test="${empty list}">
		<h2 style="margin-left: 43%; margin-top: 7%; margin-bottom: 6%">주문한 상품이 없습니다.</h2>
	</c:when>
	<c:otherwise>
		<div style="margin-left: 21%">
			<h3 style="margin-left: 47%">주문 내역</h3>
			<table class=mytable align=center width=850>
				<tr height=50>
					<th>주문일자</th>
					<th>주문번호</th>
					<th>상품명</th>
					<th>총결제금액</th>
					<th>주문상태</th>
				</tr>
				<c:forEach var="row" items="${list}">
					<tr height=50>
						<td><fmt:formatDate value="${row.payment_regdate}"
								pattern="yyyy-MM-dd" /></td>
						<td><a href="${path}/order_view?payment_no=${row.payment_no}"
							style="text-decoration: none">${row.order_no}</a></td>
						<td>${row.product_name}</td>
						<td><fmt:formatNumber value="${row.payment_price}"
								pattern="###,###,###" />원</td>
						<td>${row.order_state}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
	</c:otherwise>
</c:choose>
	<br><br><br><br><br><br><br><br><br><br><br>

</div>
<%@ include file="../include/footer.jsp" %>
</body>