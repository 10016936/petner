<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>

<style>

th {
margin-bottom: 10px;
}
form {
margin-bottom: 50px;
}
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${path}/js/product.js"></script>
<meta charset="UTF-8">
<title>상품수정</title>
</head>
<body>
	<script>
		$(document).ready(function(){
			$("#select_cat").hide();
			$("#select_dog").hide();
			
			$("#cat").click(function(){
				$("#select_cat").show();
				$("#select_dog").hide();
			});
			
			$("#dog").click(function(){
				$("#select_dog").show();
				$("#select_cat").hide();
			});			
		});
	</script>
	
	<div align="center">
	${seller.seller_no}
	${seller.seller_name}
	</div>
	
	<form action="productupdateresult" method="post" id="productupdate" enctype="multipart/form-data">
		<input type="hidden" name="seller_no" value="${seller.seller_no}">
		<input type="hidden" name="seller_name" value="${seller.seller_name}">
		<input type="hidden" name="product_no" value="${old.product_no}">
		<input type="hidden" name="pageNum" value="${pp.currentPage}">
		<input type="hidden" name="oldStock" id="oldStock" value="${old.product_stock}">
		
		<h2 align=center>상품 수정</h2>
		<table class=mytable align=center width=600 height=750>
		<tr>
			<th width=180>펫종류</th>
			<td><input type="radio" name="product_pet" value="고양이" id="cat" <c:if test="${old.product_pet == '고양이'}">${'checked'}</c:if>>고양이
				<input type="radio" name="product_pet" value="개" id="dog" <c:if test="${old.product_pet == '개'}">${'checked'}</c:if>>개
			</td>
		</tr>
		<tr>
			<th>상품종류</th>
			<td><div id="select_cat">
				<select name="product_category" id="product_categorycat">
					<option value="">선택하세요</option>
					<option value="사료" <c:if test="${old.product_category == '사료'}">${'selected'}</c:if>>사료</option>
					<option value="간식" <c:if test="${old.product_category == '간식'}">${'selected'}</c:if>>간식</option>
					<option value="배변" <c:if test="${old.product_category == '배변'}">${'selected'}</c:if>>배변</option>
					<option value="미용" <c:if test="${old.product_category == '미용'}">${'selected'}</c:if>>미용</option>
					<option value="급식기" <c:if test="${old.product_category == '급식기'}">${'selected'}</c:if>>급식기</option>
					<option value="장난감" <c:if test="${old.product_category == '장난감'}">${'selected'}</c:if>>장난감</option>
					<option value="이동장" <c:if test="${old.product_category == '이동장'}">${'selected'}</c:if>>이동장</option>
					<option value="캣타워" <c:if test="${old.product_category == '캣타워'}">${'selected'}</c:if>>캣타워</option>
					<option value="스크래쳐" <c:if test="${old.product_category == '스크래쳐'}">${'selected'}</c:if>>스크래쳐</option>
					<option value="영양제" <c:if test="${old.product_category == '영양제'}">${'selected'}</c:if>>영양제</option>
				</select>
				</div>
	
				<div id="select_dog">
				<select name="product_category" id="product_categorydog">
					<option value="">선택하세요</option>
					<option value="사료" <c:if test="${old.product_category == '사료'}">${'selected'}</c:if>>사료</option>
					<option value="간식" <c:if test="${old.product_category == '간식'}">${'selected'}</c:if>>간식</option>
					<option value="배변" <c:if test="${old.product_category == '배변'}">${'selected'}</c:if>>배변</option>
					<option value="미용" <c:if test="${old.product_category == '미용'}">${'selected'}</c:if>>미용</option>
					<option value="급식기" <c:if test="${old.product_category == '급식기'}">${'selected'}</c:if>>급식기</option>
					<option value="장난감" <c:if test="${old.product_category == '장난감'}">${'selected'}</c:if>>장난감</option>
					<option value="이동장" <c:if test="${old.product_category == '이동장'}">${'selected'}</c:if>>이동장</option>
					<option value="캣타워" <c:if test="${old.product_category == '캣타워'}">${'selected'}</c:if>>하우스</option>
					<option value="스크래쳐" <c:if test="${old.product_category == '스크래쳐'}">${'selected'}</c:if>>산책줄</option>
					<option value="영양제" <c:if test="${old.product_category == '영양제'}">${'selected'}</c:if>>영양제</option>
				</select>
				</div>
			</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" size=50 name="product_name" id="product_name" value="${old.product_name }"></td>
		</tr>
		<tr>
			<th>제조사</th>
			<td><input type="text" size=50 name="product_make" id="product make" value="${old.product_make }"></td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td><input type="text" size=50 name="product_price" id="product_price" value="${old.product_price}"></td>
		</tr>
		<tr>
			<th>재고</th>
			<td><select name="stockadd" id="product_stockadd">
					<option value="">선택</option>
					<option value="+">+</option>
					<option value="-">-</option>
				</select>
				<input type="text" name="product_stock" id="product_stock" value="0"> &nbsp;(현재 재고량 : ${old.product_stock})
			</td>
		</tr>
		<tr>
			<th height=33%>상품이미지</th>
			<td><img src="<%=request.getContextPath()%>/upload/product/${old.product_img}" width=200 height=200>
				<br><input type="file" name="product_img_" id="product_img"></td>
		</tr>
		<tr>
			<th height=37%>상품설명</th>
			<td><textarea rows="15" cols="50" name="product_content" id="product_content">${old.product_content}</textarea>
				<br><input type="file" multiple="multiple" name="product_contentimg_" id="product_contentimg">
				<%-- <br>
				<c:forEach var="list" items="${list}">
					${list}
					<div><img src="<%=request.getContextPath()%>/upload/product/${list}" width=200 height=500></div>
				</c:forEach> --%>
			</td>
		</tr>
		</table>
		<br>
		<div align=center>
		<input type="submit" class="btn btn-outline-secondary" value="수정">
		<input type="button" class="btn btn-outline-secondary" value="삭제" 
			onClick="if(confirm('정말 삭제하시겠습니까?'))location='productdeleteresult?product_no=${old.product_no}&pageNum=${pageNum}'">
		<input type="button" class="btn btn-outline-secondary" value="목록" onClick="location='productlist'">
		</div>
	</form>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>