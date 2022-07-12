<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

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

<body>
	<h2 align="center">병원</h2>
	<table class="mytable" align="center" width=1000>
		<%-- 	    <div>
        	<select name="sort" id="sort" onchange="sortHospital()">
            	<option value="지역별" <c:if test="${sortValue == 'recent'}">${'selected'}</c:if> >지역별</option>
            </select>
        </div> --%>
		<tr>
			<th width=40 height=50>번호</th>
			<th width=70>지역</th>
			<th colspan="2" width=25%>병원</th>
			<th width=25%>주소</th>
			<th>전화번호</th>
			<th>24시</th>
			<th>연중무휴</th>
			<th>주차</th>
		</tr>

		<c:if test="${empty list}">
			<tr>
				<td colspan="9" align="center">데이터가 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${not empty list}">
			<c:set var="no1" value="${no}" />
			<c:forEach var="hospital" items="${list}">
				<tr>
					<td>${no1}</td>
					<td>${hospital.hospital_loc}</td>
					<td align="center">
					<c:if test="${empty hospital.hospital_file}">
						<img src="${path}/images/basic_hospital.jpg" height="100" width="100" /></c:if>
					<c:if test="${not empty hospital.hospital_file}">
						<img src="<%=request.getContextPath() %>/upload/hospital/${hospital.hospital_file}"
							height="120" width="120" /></c:if>
					</td>
					<td><a href="hospital_view?hospital_no=${hospital.hospital_no}&page=${pp.currentPage}&state=view">
							${hospital.hospital_name} </a></td>
					<td>${hospital.hospital_addr}</td>
					<td>${hospital.hospital_tel}</td>
					<td>${hospital.hospital_24}</td>
					<td>${hospital.hospital_holiday}</td>
					<td>${hospital.hospital_parking}</td>
				</tr>
				<c:set var="no1" value="${no1 -1}" />
			</c:forEach>
		</c:if>
	</table>
	
	<br>
	<form action="hospital_list" align=center>
		<input type="hidden" name="page" value="1">
		<select name="search">
			<option value="hospital_name" <c:if test="${search=='hospital_name'}">selected="selected" </c:if>>병원명</option>
			<option value="hospital_loc" <c:if test="${search=='hospital_loc'}">selected="selected" </c:if>>지역</option>
		</select>
		<input type="text" name="keyword"> <input type="submit" value="확인">
	</form>
	
	<br>
	<div align=center>
		<!-- 검색 했을 경우의 페이징 처리 -->
		<c:if test="${not empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="hospital_list?page=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage == i}"></c:if>
				<a href="hospital_list?page=${i}&search=${search}&keyword=${keyword}">${i}</a>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="hospital_list?page=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a>
			</c:if>
		</c:if>

		<!-- 전체 목록의 페이징 처리 -->
		<c:if test="${empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk}">
				<a href="hospital_list?page=${pp.startPage - 1}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage == i}"></c:if>
				<a href="hospital_list?page=${i}">${i}</a>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="hospital_list?page=${pp.endPage + 1}">다음</a>
			</c:if>
		</c:if>
	</div>
	
	<br>
	  	<c:if test="${sessionScope.mem_id == 'admin'}">
			<div align="center">
				<input type="button" class="btn btn-outline-secondary" value="병원 등록" onClick="location.href='hospital_insertForm'"/>
			</div>
		</c:if>
	<br>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>