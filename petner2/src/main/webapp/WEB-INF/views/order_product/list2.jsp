<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="../include/header.jsp" %>

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
    <h2 align=center height=50> 결제가 완료된 상품이 없습니다.</h2>
  </c:when>
  <c:otherwise>
<div>
    <h2 align=center>판매 내역</h2>
    <table class=mytable align=center>
        <tr height=50>
            <th>판매일자</th>
            <th>판매번호</th>
            <th>상품명</th>
            <th>수량</th>
            <th>총 결제금액</th>
            <th>구매자</th>
            <th>진행상태</th>
        </tr>
      <c:forEach var="row" items="${list}" varStatus="i">
        <tr height=50>
          <td>
            <fmt:formatDate value="${row.payment_regdate}" pattern="yyyy-MM-dd HH:mm"/>
          </td>
          <td>${row.order_no}</td>
          <td><a href="${path}/order_view?payment_no=${row.payment_no}">${row.product_name}</a>
          </td>
          <td>${row.product_ea}</td>
          <td><fmt:formatNumber value="${row.payment_price}" pattern="###,###,###"/>원</td>
          <td>${row.mem_id}</td>
        </tr>
      </c:forEach>
      <c:forEach var="row2" items="${list2}" varStatus="i">
        <tr>
          <td>${row2.order_state}</td>
        </tr>
      </c:forEach>
	</table>
</div>
  </c:otherwise>
</c:choose>
</div>
<%@ include file="../include/footer.jsp" %>
