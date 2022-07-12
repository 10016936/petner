<%@ page import="petner.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
td {
  text-align: center;
}
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<script>
		$(function() {
			$(".btn").click(
					function() {
						var basket_no = $(this).attr('id');
						var basket_ea = $("#basket_ea_" + basket_no).val();
						var mem_id = $("#mem_id").val();
						var product_price = $("#product_price").val();
						var frmData = "basket_no=" + basket_no + "&basket_ea="
								+ basket_ea + "&mem_id=" + mem_id
								+ "&product_price=" + product_price;
						$.post("update_ea", frmData, function(data) {
							//			alert(data);
							$('#slist').html(data);
							location.reload();
						});
					});
		});
	</script>

	<form action="payment" method="post">
		<c:if test="${empty list}">
			<h2 style="margin-left: 43%; margin-top: 7%; margin-bottom: 14%">장바구니가 비어있습니다.</h2>
		</c:if>
		<c:if test="${not empty list}">
		<div style="margin-left: 23%">
			<h3 style="margin-left: 46%">장바구니</h3>
			<table class=mytable width=850>
				<tr height=50>
					<th width=5%></th>
					<th>번호</th>
					<th>상품번호</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>단가</th>
					<th>수량</th>
					<th>합계금액</th>
				</tr>
				<tr>
						<c:forEach var="basket" items="${list}">
							<c:set var="product" value="<%=new Product()%>"></c:set>
							<input type="hidden" value="${basket.mem_id}" id="mem_id">
							<input type="hidden" value="${basket.product_price}" id="product_price">

							<%-- <div class="basketdiv">
		<div class="row head">
			<div class="subdiv">
				<div class="check">선택</div>
				<div class="img">이미지</div>
				<div class="pname">상품명</div>
			</div>
			<div class="subdiv">
				<div class="basketprice">가격</div>
				<div class="num">수량</div>
				<div class="sum">합계</div>				
			</div>
			<div class="subdiv">
				<div class="basketcmd">삭제</div>
			</div>
			<div class="split"></div>
		</div>
		
		<div class="row data">
			<div class="subdiv">
				<div class="check"><input type="checkbox" name="basket_payment" id="basket_${basket.basket_no}" value="${basket.basket_no}"></div>
			</div>
		
		</div>
	</div>
 --%>
							<tr height=50>
								<td><input type="checkbox" name="basket_payment"
									id="basket_${basket.basket_no}" value="${basket.basket_no}"></td>
								<td id="td_${basket.basket_no}">${basket.basket_no}</td>
								<td>${basket.product_no}</td>
								<td><img src="${path}/upload/product/${basket.product_img}" width=100 height=100></td>
								<%-- <td>${basket.mem_id}</td> --%>
								<td>${basket.product_name}</td>
								<td><fmt:formatNumber value="${basket.product_price}"
								pattern="###,###,###" />원</td>
								<td><input type="number" value="${basket.basket_ea}"
									name="basket_ea" id="basket_ea_${basket.basket_no}">
									<input type="button" value="변경" id="${basket.basket_no}" class="btn">
								</td>
								<td><fmt:formatNumber value="${basket.basket_product_sum}"
								pattern="###,###,###" />원</td>
							</tr>
						</c:forEach>
			</table>
			<br>
			
			<div style="margin-left: 48%">
				<input type="submit" value="결제" class="btn btn-outline-secondary">
			</div>
		</div>
		</c:if>
		<br>
	</form>
	<br><br><br><br><br>

</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>