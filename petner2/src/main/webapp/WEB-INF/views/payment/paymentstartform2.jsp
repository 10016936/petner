<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ include file="../include/header.jsp"%>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
var check = false;
var payment_no1;

function point(mem_point) {
	var usemem_point = document.getElementById("usemem_point").value;	
	location.href="membermiletest?mem_point="+mem_point+"&usemem_point="+usemem_point;
}
</script>
<style>
.payment {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
}
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>
</head>
<body>
	<script>
		 			
		 $(document).on("click","#button",function(){
			
			IMP.init("imp01626965");      
			IMP.request_pay({
    		pg : "html5_inicis",
    		pay_method : "card",
    		merchant_uid : ${payment_no1} + new Date().getTime(),
   			name : '${payment.product_name}',
    		amount : ${payment.payment_price},
    		buyer_email : '${pullemail}',
    		buyer_name : '${member.mem_name}',
    		buyer_tel : '${telall}',
    		buyer_addr : '${member.mem_addr1}+${member.mem_addr2}',
   			buyer_postcode : '${member.mem_post}'
			}, function(rsp) {
    		if ( rsp.success ) {
        		var msg = "결제가 완료되었습니다.";
        		msg += "고유ID : " + rsp.imp_uid
        		msg += "상점 거래ID : " + rsp.merchant_uid
        		msg += "결제 금액 : " + rsp.paid_amount
        		msg += "카드 승인번호 : " + rsp.apply_num
        		msg += "payment_no :" + ${payment_no1}
   			   alert(msg);
    
        		location.href = "paymenttest?payment_no="+'${payment_no1}'
    		} else {
        		var msg = "결제에 실패하였습니다.";
        		msg += "에러내용 : " + rsp.error_msg
   		 	}
			});
		});
			 
		 </script>

	<form action="paymentapi" method="post" id="form7485" name="myform">
		<div class="payment">
			<input type="hidden" name="mem_id" id="mem_id" value="${payment.mem_id}">
			<input type="hidden" name="product_no" id="product_no" value="${payment.product_no}">
			<input type="hidden" name="product_ea" id="product_ea" value="${product_ea}">
			<input type="hidden" name="product_name" id="product_name" value="${product_name}">
			<input type="hidden" name="product_price" id="product_price" value="${product_price}">
			<input type="hidden" name="payment_price" id="payment_price" value="${payment.payment_price}">
			<input type="hidden" name="payment_info1" id="payment_info1" value="${payment_info1}">
			<input type="hidden" name="seller_no" id="seller_no" value="${payment.seller_no}">
			<input type="hidden" name="payment_no" id="payment_no" value="${payment.payment_no}">
			
			<h2 align=center>결제</h2>
			<h3 style="margin-left: 20%">상품정보</h3>
			<table class=mytable align=center width=600 height=150>
				<tr>
					<th width=180>상품명</th>
					<td>${product_name}</td>
				</tr>
			<tr>
					<th>가격</th>
					<td><fmt:formatNumber pattern="###,###,###" value="${product_price}"/>원</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>${product_ea}개</td>
				</tr>
			</table>
			<br>
			<h3 style="margin-left: 20%">배송 정보</h3>
			<table class=mytable align=center width=600 height=250>
				<tr>
					<th width=180>주문자</th>
					<td>${member.mem_name}</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" name="mem_post" id="mem_post" readonly value="${member.mem_post}">
						<input type="button" value="우편번호검색" onClick="openDaumPostcode()"/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" size=45 name="mem_addr1" id="mem_addr1" class="mem" readonly value="${member.mem_addr1}"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" size=45 name="mem_addr2" id="mem_addr2" class="mem" value="${member.mem_addr2}"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${member.mem_phone1}-${member.mem_phone2 }-${member.mem_phone3}</td>
				</tr>
			</table>
			<br>
			
			<h3 style="margin-left: 20%">결제 정보</h3>
			<table class=mytable align=center width=600 height=250>	
				<tr>
					<th width=180>주문금액</th>
					<td><fmt:formatNumber pattern="###,###,###" value="${product_price*product_ea}" />원</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>
						<c:if test="${member.mem_grade == 'VIP'}">0원 (VIP할인)</c:if>
						<c:if test="${member.mem_grade != 'VIP'}">2,500원</c:if>
					</td>
				</tr>
				<tr>
					<th>보유 적립금</th>
					<td>
						<c:if test="${transferpoint == null}">${member.mem_point}원</c:if>
						<c:if test="${transferpoint != null}">${transferpoint}원 / ${payment_info1}</c:if>
						&nbsp;&nbsp;&nbsp;
						<input type="text" id=usemem_point name=usemem_point value="${member.mem_point}">
						<input type="button" id="button1" name="button1" value="적립금 사용"
							onclick="point('${member.mem_point}','${payment.product_no}','${payment.product_ea}')">
					</td>
				</tr>
				<tr>
					<th>총 결제금액</th>
					<td><fmt:formatNumber pattern="###,###,###" value="${payment.payment_price}" />원
					</td>
				</tr>
				<tr>
					<th>결제 수단</th>
					<td><select name="payment_info">
							<option value="" selected disabled hidden>결제수단을 선택하세요</option>
							<option value="card" selected="selected">카드</option>
							<option value="noaccount">무통장입금</option>
						</select>
					</td>
				</tr>
			</table>
			<br>
			
				<div align=center>
					<input type="checkbox" id="check" name="check" onclick="check1()" checked="checked">
					상기의 내용을 모두 확인했고 결제를 진행합니다.
					<!-- 체크박스는 name을 같게하고 value를 다르게 -->
					<br><br><br>
					<input type="button" class="btn btn-outline-secondary" value="확인" name="button" id="button">
				</div>
		</div>
	</form>
	<br>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>