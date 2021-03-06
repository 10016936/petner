<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<style>
.mytable { border-collapse:collapse; }  
.mytable th, td { border-bottom:1px solid gray; }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(function() {
		$('#list').load('replyList?lost_no=${lost.lost_no} table'); // table을 적으면 게시판목록 문구를 제외한 테이블만 불러옴
	
		$('#repInsert').click(function() {
			if (!frm.lostreply_content.value) {
				alert('내용을 입력하세요.');
				frm.lostreply_content.focus();
				return false;
			}
			var frmData = $('form').serialize(); // name값이 변수 value값이 value로 뽑아옴
			// var frmData = 'replyer='+frm.replyer.value+'&bno='+
			//				  frm.bno.value+'&replytext='+frm.replytext.value;		
			// $.post("요청이름","값 전달","콜백함수")
			$.post('${path}/replyLostInsertOk', frmData, function(data) {
//				alert(data);
//				alert(frm.lostreply_content.value);
				$('#list').html(data); // id가 slist로 되어있는 div영역에 콜백함수로 받은 값을 뿌려준다
				frm.lostreply_content.value = '';
			});
		});	
	
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">상세 페이지</h2>
		<table class="mytable" width=900 height=550>
			<tr colspan=3 align=center>
				<th rowspan=6 width="45%">
				<c:if test="${empty lost.lost_file}">&nbsp;</c:if> 
       			<c:if test="${!empty lost.lost_file}">
					<img src="<%=request.getContextPath() %>/upload/lost/${lost.lost_file}"
							height="85%" width="90%" />
				</c:if></th>
			</tr>
			<tr>
				<th width=150>작성자</th>
				<td>${lost.mem_id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${lost.lost_title}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${lost.lost_date}</td>
			</tr>
			<tr>
				<th>잃어버린 위치</th>
				<td height=270>
				<input type="hidden" name="lat" id="lat" value="${lost.lat}">  
			 	<input type="hidden" name="lng" id="lng" value="${lost.lng}">
			 	
				<div id="map" style="width:95%;height:85%;"></div>
				<div id="clickLatlng"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6afa2b45b865af0845103e126c4bc00e"></script>
<script>

//var lat = document.getElementById("lat");
//var lng = document.getElementById("lng");

var lat = $('#lat').val()
var lng = $('#lng').val()


/* var lat;
var lng; */

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(lat,lng), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '위도 : ' + latlng.getLat() + '<br>경도 : ' + latlng.getLng();
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
//  lat = latlng.getLat();
//	lng = latlng.getLng();
//	alert("lat1:"+lat);
//	alert("lng1:"+lng);
});

/* function myson(mem_id){
	alert("lat2:"+lat);
	alert("lng2:"+lng);
	/* var lat = latlng.getLat();
	var lng = latlng.getLng(); */
//	$("#mem_id").val(mem_id);
//	 var mem_id = document.getElementById("mem_id") 
//	var mem_id = $('#mem_id').val();
//	 location.href="lostlatlng?lat="+lat+"&lng="+lng+"&mem_id="+mem_id; 
	/* location.href="insertAction?lat="+lat+"&lng="+lng; */
	/* document.getElementById(lat).value = lat; 
	document.getElementById(lng).value = lng; */ 
//	$("#lat").val(lat);
//	$("#lng").val(lng);
	/* self.close(); }*/
</script>								
				</td>
			</tr>
			<tr>
				<th height=130>내용</th>
				<td><pre>${lost.lost_content}</pre></td>			
			</tr>
		</table>
		<br>
					
		<div align=center>				
			<input type=button class="btn btn-outline-secondary" value="수정"
				onClick="location.href='lostUpdateForm2?num=${lost.lost_no}&pageNum=${pageNum}&lat=${lost.lat}&lng=${lost.lng}'">
			<input type=button class="btn btn-outline-secondary" value="삭제"
				onClick="location.href='lostDeleteForm?num=${lost.lost_no}&pageNum=${pageNum}'">
			<input type=button class="btn btn-outline-secondary" value="목록"
				onClick="location.href='lostListView?pageNum=${pageNum}'">
		</div>
		
		<br>
		<form name="frm" id="frm"> <!-- 비동기적인 처리이므로 action이 없음 -->
			<input type="hidden" name="mem_id" value="${mem_id}"> <!-- 로그인해서 댓글을 다는 아이디의 아이디값 -->
			<input type="hidden" name="lost_no" value="${lost.lost_no}">
			<textarea rows="5" cols="70" name="lostreply_content"></textarea>
			<input type="button" class="btn btn-outline-secondary" value="댓글달기" id="repInsert">
		</form>
		
		<br>
		<div align=center id="list"></div>
	</div>
	<br>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>