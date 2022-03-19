<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동영상 정보 업로드</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

<div id="#wrap" >
  <c:import url="/WEB-INF/jsp/include/mainheader.jsp"/>
		<section class="d-flex justify-content-center">
			<div class="w-75 my-5">
		   <div class="d-flex">
	     	<input type="text" class="form-control mt-3" placeholder="작품 이름" id="subjectInput">
	     	<button type="button" class="ml-3 mt-3 btn btn-sm  btn-success" id="duplicateBtn">중복확인</button>
	       </div>
		   <div id="duplicateDiv" class="d-none">
				<small class="text-danger">중복된 제목입니다.</small>
		   </div>
		   <div id="noneDuplicateDiv" class="d-none">
				<small class="text-success">사용 가능한 제목입니다.</small>
			</div>
			<input type="text" class="form-control mt-3" placeholder="작품 장르" id="genreInput">
	     	<textarea class="mt-3 form-control" rows="5" placeholder="작품 줄거리" id="contentInput"></textarea>
	     	<input type="text" class="form-control mt-3" placeholder="작품 방영요일" id="broadcastdaysInput">
	     	<input type="text" class="form-control mt-3" placeholder="작품 출시일" id="releasedateInput">
	     	<input type="text" class="form-control mt-3" placeholder="작품 평점" id="gradeInput">
	     	<input type="text" class="form-control mt-3" placeholder="작품 예고편 링크" id="videoPathInput">
	     	<div class="mt-2 d-flex justify-content-between">
	     	<input type="file" class="mt-3" id="fileInput">
	     	<button type="button" class="btn btn-success btn-sm" id="saveBtn">저장</button>
	     	</div>
	     	
	     	
	     	
			</div>


		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
  
  
  </div>
  
  <script> 
         $(document).ready(function(){
        	 
        	 var isSubjectCheck = false;
    		 var isDuplicateSubject = true;
    		 
    		// 아이디에 입력이 있을경우 중복체크 상태를 초기화 한다
    			$("#subjectInput").on("input", function() {
    				$("#duplicateDiv").addClass("d-none");
    				$("#noneDuplicateDiv").addClass("d-none");
    				isSubjectCheck = false;
    				isDuplicateSubject = true;
    			});
    		
        	 $("#saveBtn").on("click",function(){
        		 let subject = $("#subjectInput").val().trim();
        		 let genre = $("#genreInput").val().trim();
        		 let content = $("#contentInput").val().trim();
        		 let broadcastdays = $("#broadcastdaysInput").val().trim();
        		 let releasedate = $("#releasedateInput").val().trim();
        		 let grade = $("#gradeInput").val();
        		 let videoPath = $("#videoPathInput").val().trim();
        		 
        		 if(subject ==""){
        			 alert("제목을 입력하세요");
        			 return;
        		 }
        		 if(genre ==""){
        			 alert("장르를 입력하세요");
        			 return;
        		 }
        		 if(content == ""){
        			 alert("내용을 입력하세요");
        			 return;
        		 }
        		 if(broadcastdays == ""){
        			 alert("방영요일을 입력하세요");
        			 return;
        		 }
        		 if(releasedate == ""){
        			 alert("출시일을 입력하세요");
        			 return;
        		 }
        		 if(grade == ""){
        			 alert("평점을 입력하세요");
        			 return;
        		 }
        		 if(videoPath == ""){
        			 alert("예고편 링크를 입력하세요");
        			 return;
        		 }
        		 
        		 var formData = new FormData();
        		 formData.append("subject",subject);
        		 formData.append("genre",genre);
        		 formData.append("content",content);
        		 formData.append("broadcastdays",broadcastdays);
        		 formData.append("releasedate",releasedate);
        		 formData.append("grade",grade);
        		 formData.append("videoPath",videoPath);
        		 
    
        		 formData.append("file", $("#fileInput")[0].files[0]);
        		 
        		 
        		 $.ajax({
        			 type: "post",
        			 url: "/post/create",
        			 data: formData,
        			 enctype: "multipart/form-data", //파일 업로드 필수
        			 processData: false, //파일 업로드 필수
        			 contentType:false, // 파일 업로드 필수
        			 success:function(data){
        				if(data.result=="success"){
        					
        					
        					location.href="/post/homepage";
        					
        				}else{
        					alert("글쓰기 실패");
        					
        				}
        				
        			 },
        			 error:function(){
        				 alert("에러발생");
        			 }
        		 });
        	 });
        	 
        	 
        	 $("#duplicateBtn").on("click",function(){
				  
        		 let subject = $("#subjectInput").val().trim();
				  
				  
        		 if(subject ==""){
        			 alert("제목을 입력하세요");
        			 return;
        		 }
				
				  $.ajax({
					  type:"post",
					  url:"/post/duplicate",
					  data:{"subject":subject},
					  success:function(data){
						  //{isDuplicate: true}
						    isSubjectCheck = true;
						  if(data.isDuplicate=="true"){
						  alert("중복된 제목입니다");
						  isDuplicate = true; <%-- isDuplicate 라는 변수가 어디에 선언되어 있는지 또는 isDuplicateDubject와는 어떠한 관련이 있는지에 대해 궁금합니다 --%>
							$("#duplicateDiv").removeClass("d-none");
							$("#noneDuplicateDiv").addClass("d-none");
			
						  }else{
						  alert("사용가능한 제목입니다");
						  isDuplicate = false;
							$("#duplicateDiv").addClass("d-none");
							$("#noneDuplicateDiv").removeClass("d-none");
						  }
						  
						
							
							
						  
					  },
					  error:function(){
						  alert("에러발생");
						  
					  }
				  });
				  
			  });
        	 
         });
         
  
  
  
  </script>

</body>
</html>