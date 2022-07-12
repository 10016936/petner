<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>반려동물 쇼핑몰 커뮤니티 펫트너(PETNER)</title>
</head>
<body>
	<div class="search" align=center>
		<div class="title">
			<h4>반려동물 쇼핑몰 커뮤니티</h4>
			<h2>펫트너(PETNER)</h2>
		</div>
		<div class="searchtab">
			<input type="text">
		</div>
		<button type="button" class="button">
			<img src="${path}/img/magni.jpg">
		</button>
	</div>

	<span><h2 align=center>인기 지식정보</h2></span>
	<div>
		<p>🐱 스토어</p>
		<p class="add">
			<a href="productlist">더보기</a>
		</p>
	</div>
	<div class="info1">
	<c:forEach var="list" items="${list}" begin="0" end="9" step="1">
		<div class="content" align=center>
			<a href="productdetail?product_no=${list.product_no}"> <img src="${path}/upload/product/${list.product_img}">${list.product_name}
			<br><fmt:formatNumber value="${list.product_price}"
								pattern="###,###,###"/>원</a>
		</div>
	</c:forEach>
	</div>	
	<br>
	
	<div>
		<p>🐱 병원</p>
		<p class="add">
			<a href="hospital_list">더보기</a>
		</p>
	</div>
	<div>
	<c:forEach var="hospital" items="${hlist}" begin="0" end="9" step="1">
		<div class="content" align=center>
			<a href="hospital_view?hospital_no=${hospital.hospital_no}"> <img src="${path}/upload/hospital/${hospital.hospital_file}">${hospital.hospital_name}</a>
		</div>
	</c:forEach>
	</div>
	<br>
	
	<div>
		<table width=100% align=center>
			<tr height=20>
				<td width=40%><p>🐱 팁게시판</p></td>
				<td width=10%><a href="tipboardList" style="text-decoration:none"><p>더보기</p></a></td>
				<td width=43%><p>🐱 미아게시판</p></td>
				<td width=7%><a href="lostListView" style="text-decoration:none"><p>더보기</p></a></td>
			</tr>
			<tr>
				<td colspan=2>
					<c:forEach var="list" items="${tlist}" begin="0" end="4" step="1">
						<ul>
							<li><a href="tipboard_detail?tip_no=${list.tip_no}"
									style="text-decoration:none; color:black;">${list.tip_title}</a></li>
						</ul>
					</c:forEach>
				</td>
				<td colspan=2>
					<c:forEach var="list" items="${llist}" begin="0" end="4" step="1">
						<ul>
							<li><a href="lostView?lost_no=${list.lost_no}&page=1"
									style="text-decoration:none; color:black;">${list.lost_title}</a></li>
						</ul>
					</c:forEach>
				</td>
			</tr>
		</table>		
<%-- 					
		<p>팁게시판</p>
		<p class="add">
			<a href="tipboardList">더보기</a>
		</p>
		<c:forEach var="list" items="${tlist}" begin="0" end="4" step="1">
		<ul>
			<li><a href="tipboard_detail?tip_no=${list.tip_no}"
					style="text-decoration:none; color:black;">${list.tip_title}</a></li>
			<li>${list.tip_content}</li>
		</ul>
		</c:forEach>
 	</div>
	<div>
		<p>미아게시판</p>
		<p class="add">
			<a href="lostListView">더보기</a>
		</p>
	<c:forEach var="list" items="${llist}" begin="0" end="4" step="1">
		<ul>
			<li><a href="lostView?lost_no=${list.lost_no}&page=1"
					style="text-decoration:none; color:black;">${list.lost_title}</a></li>
			<li>${list.lost_content}</li>
		</ul>
	</c:forEach>
--%>
	</div>
	<br><br>
</div>
<%@include file="include/footer.jsp" %>
</body>

</html>