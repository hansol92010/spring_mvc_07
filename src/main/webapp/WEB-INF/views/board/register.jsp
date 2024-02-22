<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Spring MVC</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>Spring MVC</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Board</div>
			<div class="panel-body">
				<form action="${contextPath}/board/register" method="post">
					<input type="hidden" name="memID" value="${member.memID }" />
					<div class="form-group">
						<label for="title">제목</label>
						<input type="text" id="title" name="title" class="form-control" />
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea rows="10" id="content" name="content" class="form-control" style="resize: none;"></textarea>
					</div>
					<div class="form-group">
						<label for="writer">작성자</label>
						<input type="text" id="writer" name="writer" class="form-control" value="${member.memName}" readonly/>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-default btn-sm">등록</button>	
						<button type="reset" class="btn btn-default btn-sm">취소</button>								
					</div>
				</form>
			</div>
			<div class="panel-footer">스프2탄(답변형 게시판 만들기)</div>
		</div>
	</div>
</body>
</html>