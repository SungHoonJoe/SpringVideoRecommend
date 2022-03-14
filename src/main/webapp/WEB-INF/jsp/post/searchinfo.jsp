<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	
  	<link rel="stylesheet" href="/static/css/style.css">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<title>홈 화면</title>
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class=" ">

			
			<div class="display-4"></div>

			<div
					class="d-flex  mt-3 changeline   ">
					<c:forEach var="postDetail" items="${postList }" >

						<div class="page m-2  ">
							<!-- page 부분 width:180px 임에도 검사하면 앞쪽만 132.39로 잡히고 뒤쪽은 120으로 잡힌다 m-3로 일시적인 해결은 했으나... -->
							<div class=" h-75">
								<a href="/post/detail_view?postId=${postDetail.id}"><img
									src="${postDetail.imagePath }" width="120" height="150"></a>
							</div> 
							<div class="h-25 break text-center">
								<a class="" href="/post/detail_view?postId=${postDetail.id}">${postDetail.subject }</a>
							</div>
						</div>

					</c:forEach>
				</div>

				
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				
				<div class="modal-body text-center"><a href="#" id="deleteBtn">삭제하기</a></div>
				
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {

			
			$("#imgBtn").on("click", function() {
				// fileInput 클릭 효과
				$("#addBtn").click();

			});

			$("#uploadBtn").on("click", function() {
				let content = $("#contentInput").val().trim();

				if (content == "") {
					alert("내용을 입력하세요");
					return;
				}

				// 파일 유효성 검사
				if ($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}

				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);

				$.ajax({
					type : "post",
					url : "/post/create",
					data : formData,
					enctype : "multipart/form-data",
					processData : false,
					contentType : false,
					success : function(data) {

						if (data.result == "success") {
							location.reload();
						} else {
							alert("글쓰기 실패");
						}
					},
					error : function() {
						alert("글쓰기 에러");
					}
				});

			});

			$(".commentBtn").on("click", function() {
				// postId, content
				let postId = $(this).data("post-id");
				// "#commentInput5"
				let content = $("#commentInput" + postId).val();

				$.ajax({
					type : "post",
					url : "/post/comment/create",
					data : {
						"postId" : postId,
						"content" : content
					},
					success : function(data) {
						if (data.result == "success") {
							location.reload();
						} else {
							alert("댓글 작성 실패");
						}

					},
					error : function() {
						alert("에러!!");
					}

				});

			});

			$(".likeBtn").on("click", function(e) {
				e.preventDefault();
				let postId = $(this).data("post-id");

				$.ajax({
					type : "get",
					url : "/post/like",
					data : {
						"postId" : postId
					},
					success : function(data) {

						location.reload();

					},
					error : function() {
						alert("좋아요 에러!!!");
					}
				});
			});

			$("#searchBtn").on("click", function(e) {
				
				let year = $("#yearInput").val();

				$.ajax({
					type : "get",
					url : "/post/like",
					data : {
						"postId" : postId
					},
					success : function(data) {

						location.reload();

					},
					error : function() {
						alert("좋아요 에러!!!");
					}
				});
				

			});
			
			$(".moreBtn").on("click",function(e){
				e.preventDefault();
				let year = $(this).data("post-id");
				
				//postId 를 모달의 삭제하기 버튼에 값을 부여한다.
				$("#deleteBtn").data("post-id",postId);
				
			});
			
			$("#deleteBtn").on("click",function(e){
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else{
							alert("삭제 실패!");
						}
					}, error:function() {
						alert("삭제 에러!!");;
					}
					
				});
				
				alert(postId);
			});
			
		});
	</script>

</body>
</html>