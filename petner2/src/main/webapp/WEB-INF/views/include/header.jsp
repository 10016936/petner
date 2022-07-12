<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${path}/css/styles.css" rel="stylesheet"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 
<title>펫트너 PETNER - 반려동물 쇼핑몰 커뮤니티</title>
</head>
<body>

<%-- <c:if test="${sessionScope.mem_id != 'admin'}"> --%>
<div class="top-header">
<div class="header">
<%-- </c:if> --%>

<%-- <c:if test="${sessionScope.mem_id == 'admin'}">
<div class="top-header">
<div class="header">
		<a href="sellerList">사업자 목록</a>
		<a href="reviewlist">리뷰 목록</a>
</c:if> --%>
<c:if test="${sessionScope.mem_id == null}">
	<div class="login">
		<a href="Sign">회원가입</a>
		<a href="Loginform">로그인</a>
	</div>	
</c:if>
<c:if test="${sessionScope.mem_type == '일반회원'}">
	<div class="login">
		<a>${sessionScope.mem_id}님 환영합니다.</a>
		<a href="Mypage?mem_id=${sessionScope.mem_id}">마이페이지</a>
		<a href="basketList?mem_id=${sessionScope.mem_id}">장바구니</a>
		<a href="Logout">로그아웃</a>
	</div>	
</c:if>

<c:if test="${sessionScope.mem_type == '사업자' || sessionScope.mem_id == 'admin'}">
	<div class="login">
		<a>${sessionScope.mem_id}님 환영합니다.</a>
		<a href="Mypage?mem_id=${sessionScope.mem_id}">마이페이지</a>
		<a href="Logout">로그아웃</a>
	</div>	
</c:if>

</div>
</div>

<div class="main">
<div class="logo-line">
	<div class="logo">
		<a href="productlist1"><img src="${path}/images/petner.png"></a>
	</div>
	<div class="info">
		<a href="productlist">스토어</a>
	</div>
	<div class="info">
		<a href="qna_list">Q&A게시판</a>
	</div>
	<div class="info">
		<a href="tipboardList">팁게시판</a>
	</div>
	<div class="info">
		<a href="lostList">미아게시판</a>
	</div>
	<div class="info">
		<a href="hospital_list">병원안내</a>
	</div>
</div>
