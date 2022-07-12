<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<title>댓글 목록</title>
<script>
$(function() {
	$('.edit1').click(function() {		// 수정버튼의 class 값으로 호출한다.
		var id  = $(this).attr('id');	// 댓글번호  .edit의 id값을 불러온다.
		var txt = $('#td_'+id).text();	// 댓글내용  $('#td_'+id)의 text값을 불러온다. 
		$('#td_'+id).html("<textarea rows='3' cols='30' id='tt_"+id+"'>"+txt+"</textarea>");
		$('#btn_'+id).html(
		   "<input type='button' value='확인' onclick='up("+id+")'> "
		  +"<input type='button' value='취소' onclick='lst()'>");
	});
});

function a(ref,lev, seq, id){	
		$("#addtd_"+id).html("<textarea rows='3' cols='30' id='tt_"+id+"'></textarea>")
		$("#addbtn_"+id).html(
				"<input type='button' value='확인' onclick='add("+ref+","+lev+","+seq+","+id+")'>"
				  +"<input type='button' value='취소' onclick='lst()'>");		
}		
// 대댓글
function add(ref,lev, seq, id) {
	var replytext = $("#tt_"+id).val();
	var mem_id = $("#mem_id").val();
	var tip_no = $("#tip_no").val();
	var tipreply_seq = $("#tipreply_seq").val();
	var tipreply_lev = $("#tipreply_lev").val();
	var formData  = "tipreply_no="+id+'&tipreply_content='+replytext+'&mem_id='+mem_id+
					"&tip_no="+tip_no+"&tipreply_seq="+seq+"&tipreply_lev="+lev+"&tipreply_ref="+ref;
	$.post('addreply', formData, function(data){
		$("#slist").html(data);
	});
}

function up(id) {
	var replytext = $('#tt_'+id).val();
	var tip_no = $("#tip_no").val();
	var formData = "tipreply_no="+id+'&tipreply_content='+replytext+"&tip_no="+tip_no;
	$.post('updateTipreply',formData, function(data) {
		$('#slist').html(data);
	});
}

function lst() {
	var tip_no = $("#tip_no").val();
	$('#slist').load('slist?tip_no='+tip_no);
}
// 삭제
function del(tipreply_no, tip_no) {
	var formData="tipreply_no="+tipreply_no+"&tip_no="+tip_no;
	$.post("deleteTipreply",formData, function(data) {
		$('#slist').html(data);
	});
}
</script>
</head>
<body>

<table align=center width=1000 height=200>
	<tr>
		<th width=120>작성자</th>
		<th width=450>내용</th>
		<th>작성일</th>
		<th></th>
		<th></th>
	</tr>
	<c:forEach var="list" items="${slist}">
<input type="hidden" name="tip_no" id="tip_no" value="${list.tip_no}">
<input type="hidden" name="mem_id" id="mem_id" value="${list.mem_id}">
<input type="hidden" name="tipreply_seq" id="tipreply_seq" value="${list.tipreply_seq}">
<input type="hidden" name="tipreply_lev" id="tipreply_lev" value="${list.tipreply_lev}">
	<tr>
		<td style="text-align:center">
		${list.mem_id}
		</td>
		
		 <td id="td_${list.tipreply_no}">
		<div>
			<c:if test="${list.tipreply_lev != 0}">
				<c:forEach var="k" begin="1" end="${list.tipreply_lev}">
					&nbsp;&nbsp;&nbsp;
				</c:forEach>
				${list.tipreply_content}
			</c:if>
			<c:if test="${list.tipreply_lev == 0}">
				&nbsp;${list.tipreply_content}
			</c:if>
		</div>
		</td>
		<td style="text-align:center"><fmt:formatDate value="${list.tipreply_date}" pattern="yy-MM-dd HH:mm" /></td>
		<c:if test="${sessionScope.mem_id == list.mem_id}">
		<td id="btn_${list.tipreply_no}">
		<input type="button" class="btn btn-outline-secondary" value="수정" id="${list.tipreply_no}">
		<input type="button" class="btn btn-outline-secondary" value="삭제" onClick="del(${list.tipreply_no}, ${list.tip_no})">
		</td>
		</c:if>
		<%-- <td id="addtd_${list.tipreply_no}"></td> --%>
		<td id="addbtn_${list.tipreply_no}">
			<input type="button" class="btn btn-outline-secondary" value="댓글달기" id="${list.tipreply_no}" 
				onClick="a(${list.tipreply_ref},${list.tipreply_lev},${list.tipreply_seq},${list.tipreply_no})"></td>
	</tr>
</c:forEach>
</table>

</body>
</html>