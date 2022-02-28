<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div id="#wrap">
  <c:import url="/WEB-INF/jsp/include/mainheader.jsp"/>
  <section class="d-flex justify-content-center">
  <img src="/static/img/videologo.png" class="mt-5 mr-5" width="300" height="300">
  <form id="loginForm">
  <div class="login-box my-5 border rounded p-5">
     <div class="display-4 text-danger text-center ">HONFTEL</div>
     <!--  아이디, 패스워드, 패스워드 확인, 이름, 이메일 -->
     <input type="text" class="form-control mt-3" placeholder="아이디" id="loginIdInput">
     <input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
     
     <button type="submit"  class="btn btn-danger btn-block mt-3">로그인</button>
     <div class="text-center">
		<a href="/user/signup_view">회원가입</a>
	 </div>


  </div>
  </form>
    
  </section>
  <c:import url="/WEB-INF/jsp/include/footer.jsp"/>
  
  
  </div>
  
  <script>
   $(document).ready(function(){
	   
	   $("#loginForm").on("submit",function(e) {
		   e.preventDefault();
		   alert();
		   
		   var loginId = $("#loginIdInput").val();
		   var password = $("#passwordInput").val();
		  
		   if(loginId == ""){
			   alert("아이디를 입력하시오");
			   return;
		   }
		   if(password == ""){
			   alert("비밀번호를 입력하시오");
			   return;
		   }
		   
		   $.ajax({
			   type: "post",
			   url: "/user/sign_in",
			   data:{"loginId":loginId, "password":password},
			   success:function(data){
				   if(data.result=="success"){
					  location.href="/post/timeline";
					  alert("로그인 성공");
				   }else{
					   alert("아이디 혹은 비밀번호를 확인하세요");
				   }
			   }
			   
			   
		   });
		   
		   
		   
	   });
	   
   });
   </script>

</body>
</html>