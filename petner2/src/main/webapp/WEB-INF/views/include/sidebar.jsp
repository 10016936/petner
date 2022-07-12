<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>펫트너 PETNER - 반려동물 쇼핑몰 커뮤니티</title>
</head>

<body>
<!-- Sidebar -->
<div class="w3-sidebar w3-white w3-bar-block" style="width:15%; height:50%">
  <h3 class="w3-bar-item">My Page</h3>
  <c:if test="${sessionScope.mem_id !='admin'}">
  <a href="updateMember?mem_id=${sessionScope.mem_id}" class="w3-bar-item w3-button">회원 정보 수정</a>
  </c:if>
  
  <c:if test="${sessionScope.mem_type =='일반회원'}">
  <a href="basketList?mem_id=${sessionScope.mem_id}" class="w3-bar-item w3-button">장바구니</a>
  <a href="order_list" class="w3-bar-item w3-button">주문 내역</a>
  <a href="TransferForm?mem_id=${sessionScope.mem_id}" class="w3-bar-item w3-button">사업자 신청</a>
  </c:if>

  <c:if test="${sessionScope.mem_type !='일반회원' && sessionScope.mem_id !='admin'}">
  <a href="productmylist?seller_no=${sessionScope.seller_no}" class="w3-bar-item w3-button">상품 관리</a>
  <a href="sell_list" class="w3-bar-item w3-button">판매 내역</a>
  <a href="sell_manage" class="w3-bar-item w3-button">판매 관리</a>
  </c:if>
  
  <c:if test="${sessionScope.mem_id !='admin'}">
  <a href="deleteMember?mem_id=${sessionScope.mem_id}" class="w3-bar-item w3-button">회원 탈퇴</a>
  </c:if>
  
  <c:if test="${sessionScope.mem_id =='admin'}">
  <a href="hospital_list" class="w3-bar-item w3-button">병원 관리</a>
  <a href="sellerList" class="w3-bar-item w3-button">사업자 관리</a>
  <a href="qna_list" class="w3-bar-item w3-button">문의 관리</a>
  <a href="reviewlist" class="w3-bar-item w3-button">리뷰 관리</a>
  </c:if>
  
</div>

<!-- Page Content -->
<div style="margin-left:25%">

<!-- <div class="w3-container w3-white">
  <h1>My Page</h1>
</div> -->

<div class="w3-container">
</div>

</div>
</body>
