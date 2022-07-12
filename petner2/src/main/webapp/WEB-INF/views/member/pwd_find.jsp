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
 
<title>비번찾기</title>
<script>
 function check(){
	 if($.trim($("#id").val())==""){
		 alert("아이디를 입력하세요!");
		 $("#id").val("").focus();
		 return false;
	 }
	 if($.trim($("#name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#name").val("").focus();
		 return false;
	 }
 }
</script>
</head>
<body>
 <div id="pwd_wrap" align=center>
 
 <c:if test="${empty pwdok}"> 
  <h2 class="pwd_title" align=center>비밀번호 찾기</h2>
  <form method="post" action="pwd_find_ok.nhn"
  		onsubmit="return check()">  
   <table id="pwd_t" align=center>
    <tr>
     <th width=33%>아이디</th>
     <td><input name="mem_id" id="id" size="14" class="input_box"/></td>
    </tr>
    
    <tr>
     <th>이름</th>
     <td><input name="mem_name" id="name" size="14" class="input_box"/></td>
    </tr>
   </table>
   <br>
   <div id="pwd_menu" align=center>
    <input type="submit" class="btn btn-outline-secondary" value="찾기"/>
    <input type="reset" value="취소" class="btn btn-outline-secondary" onclick="$('#id').focus();"/>
   </div>
   <br><br>
   <div id="pwd_close" align=center>
    <input type="button" value="닫기" onclick="self.close();" />
   </div>
  </form>
  </c:if>
  
  
  <c:if test="${!empty pwdok}">
    <h2 class="pwd_title2">비밀번호 찾기</h2>
    <table id="pwd_t2">
     <tr>
      <td>${pwdok}</td>
     </tr>
    </table>
    <br><br><br><br>
    <div id="pwd_close2">
    <input type="button" value="닫기" onclick="self.close();" />
    <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
    </div>
  </c:if> 
  
 </div>
</body>
</html>