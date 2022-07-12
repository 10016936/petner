<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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

<c:choose>
	<c:when test="${empty list}">
		<h2 style="margin-left: 43%; margin-top: 7%; margin-bottom: 14%">판매된 상품이 없습니다.</h2>
	</c:when>
	<c:otherwise>
		<div class="container" style="margin-left: 21%">
			<h3 style="margin-left: 45%">판매 내역</h3>
			<table class=mytable align=center width=900>
				<tr height=50>
					<th>판매일자</th>
					<th>판매번호</th>
					<th>상품명</th>
					<th>총 결제금액</th>
					<th>구매자</th>
					<th>판매상태</th>
				</tr>
				<c:forEach var="row" items="${list}">
					<tr height=50>
						<td><fmt:formatDate value="${row.payment_regdate}" pattern="yyyy-MM-dd" /></td>
						<td><a href="${path}/order_view?payment_no=${row.payment_no}"
							style="text-decoration: none">${row.order_no}</a></td>
						<td>${row.product_name}</td>
						<td><fmt:formatNumber value="${row.payment_price}" pattern="###,###,###" />원</td>
						<td>${row.mem_id}</td>
						<td>${row.order_state}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
		<br>
	</c:otherwise>
</c:choose>
<br><br><br><br><br><br><br><br><br><br><br>

</div>
<%@ include file="../include/footer.jsp" %>
