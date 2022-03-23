<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/mainheader.jsp" />
		<section class="d-flex justify-content-center">
			<div class="mt-3 col-5">
				<img src="${post.imagePath }" width="450" height="550">
				<h2 class="mt-2 text-center">제작정보</h2>
				<h4 class="mt-2 text-center">출시일 : ${post.releasedate }</h4>
			</div>
			<div class=" mt-3 ml-3 col-7">
				<div class="d-flex justify-content-between content">
					<h2>${post.subject}</h2>
					<a href="${post.videoPath}"
						class="ml-3 btn btn-dark btn-block w-50 h-50">예고편 보기</a>
				</div>
				<div class="interval">
					<b>${post.genre}</b>
				</div>
				<hr>
				<div class="interval">
					<b>평점 ${post.grade}</b>
				</div>
				<hr>


				<h5 class=" interval">줄거리</h5>
				<div>${post.content}</div>
				<hr>
				<div class="d-flex mt-3 border-top">
					<input type="text" class="form-control border-0 bin" id="commentInput${post.id }">
					<button class="btn btn-info ml-2 commentBtn" data-post-id="${post.id }">게시</button>

				</div>
		</section>
		
		
		<!--  댓글  -->
		<div class=" middle-size m-2">

			<c:forEach var="comment" items="${comment }">
				<div class="m-1 border rounded">
				<div class="m-2 d-flex justify-content-between">
					<div class="more-icon"><b>${comment.userName }</b></div>
					<div class="d-flex more-icon">
					<div class="more-icon"><fmt:formatDate value="${comment.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
					<div class="more-icon">
					<a class="text-dark moreBtn" data-post-id="${post.id }" data-comment-id="${comment.id }" data-user-id="${commentwriter}" href="#"> 
					<i class="bi bi-x" data-toggle="modal" data-target="#exampleModalCenter"></i>
					</a>
					</div>
					</div>		
					</div>
					<hr>
					<div class="ml-2 mb-3 more-icon">${comment.content }</div>
				</div>
			</c:forEach>

		</div>
		
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
				$("#fileInput").click();

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

			$(".unlikeBtn").on("click", function(e) {
				e.preventDefault();
				let postId = $(this).data("post-id");

				$.ajax({
					type : "get",
					url : "/post/unlike",
					data : {
						"postId" : postId
					},
					success : function(data) {
						if (data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}

					},
					error : function() {
						alert("좋아요 취소 실패!!!")
					}
				});

			});
			$(".moreBtn").on("click",function(e){
				e.preventDefault();
				let postId = $(this).data("post-id");
				let commentId = $(this).data("comment-id");
				let commentwriter = $(this).data("user-id");
				
				//postId 를 모달의 삭제하기 버튼에 값을 부여한다.
				$("#deleteBtn").data("post-id",postId);
				$("#deleteBtn").data("comment-id",commentId);
				$("#deleteBtn").data("user-id",commentwriter);
			});
			
			
			$("#deleteBtn").on("click",function(e){
				e.preventDefault();
				let postId = $(this).data("post-id");
				let commentId = $(this).data("comment-id");
				let commentwriter = $(this).data("user-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId,"commentId":commentId,"commentwriter":commentwriter},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else{
							alert("댓글을 작성한 본인이 아닙니다. 삭제 불가능합니다");
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