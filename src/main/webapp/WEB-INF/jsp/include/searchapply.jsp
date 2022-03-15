<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {

		$("#retrieval").on("click", function() {
			let subject = $("#subject").val();

			location.href = "/post/searchinfo/?subject=" + subject;

		});

	});
</script>