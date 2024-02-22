<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
				<form action="${contextPath}/board/modify" method="post">
					<table class="table table-bordered table-hover">
						<tr>
							<td class="text-center"><label>번호</label></td>
							<td><input type="text" class="form-control" name="idx" value="${board.idx}" readonly /></td>
						</tr>
						<tr>
							<td class="text-center"><label>제목</label></td>
							<td><input type="text" class="form-control" name="title" value="<c:out value='${board.title}'/>" /></td>
						</tr>
						<tr>
							<td class="text-center"><label>내용</label></td>
							<td><textarea rows="10" class="form-control"  style="resize: none;" name="content"><c:out value="${board.content}" /></textarea></td>
						</tr>
						<tr>
							<td class="text-center"><label>작성자</label></td>
							<td><input type="text" class="form-control" name="writer" value="<c:out value='${board.writer}' />" readonly /></td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
							<c:if test="${!empty member && member.memID eq board.memID}">
								<button type="submit" class="btn btn-sm btn-primary">수정</button>
								<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${contextPath}/board/remove?idx=${board.idx}'">삭제</button>
							</c:if>
							<c:if test="${empty member || member.memID ne board.memID }">
								<button type="submit" class="btn btn-sm btn-primary" disabled>수정</button>
								<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${contextPath}/board/remove?idx=${board.idx}'" disabled>삭제</button>
							</c:if>
								<button type="button" class="btn btn-sm btn-info" onclick="location.href='${contextPath}/board/list'">목록</button>
							</td>
						</tr>					
					</table>
				</form>
			</div>
			<div class="panel-footer">스프2탄(답변형 게시판 만들기)</div>
		</div>
	</div>
</body>
</html>