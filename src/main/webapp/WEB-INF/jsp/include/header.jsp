<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="d-flex align-items-center justify-content-between ml-3">
	  <div class="d-flex">
	  <img src="/static/img/tubelogo.png" class="mr-2" width="50" height="50">
	  <h1>HONFTEL</h1>
	  </div>
	<%-- 세션에 userId 값이 존재하는지?  --%>
	<div class="input-group mb-3">
		<input type="text" class="form-control"
			placeholder="Recipient's username" aria-label="내용을 입력해 주세요"
			aria-describedby="basic-addon2">
		<div class="input-group-append">
			<span class="input-group-text" id="basic-addon2">검색</span>
		</div>
	</div>
	<c:choose>
		<c:when test="${ not empty userId }">
			<div class="mr-3">
				${userName} <a href="/user/sign_out">로그아웃</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="mr-3">
				<a href="/user/signin_view">로그인</a>
			</div>
		</c:otherwise>
	</c:choose>
	</header>
	<hr>