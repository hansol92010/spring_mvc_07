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

	<script>
		$(document).ready(function() {
			var result = '${result}';
			checkModal(result);
			$("#regBtn").click(function() {
				location.href = "${contextPath}/board/register";
			});
		});
		
		function checkModal(result) {
			if(result == '') {
				return;
			}
			// 새로운 다이얼로그 창 띄우기
			$(".modal-body").html(result);
			$("#myModal").modal("show");
		}
		
		function goMsg() {
			$(".modal-body").html("삭제된 게시물입니다");
			$("#myModal").modal("show");
		}
	</script>
</head>
<body>
	<div class="container">
		<h2>Spring MVC</h2>
		<div class="panel panel-default">
			<div class="panel-heading">
				<c:if test="${empty member}">
					<form class="form-inline text-right" action="${contextPath}/login/loginProcess" method="post">
						<div class="form-group">
							<label for="memID">ID:</label>
							<input type="text" class="form-control" id="memID" name="memID">
						</div>
						<div class="form-group">
							<label for="memPwd">Password:</label>
							<input type="password" class="form-control" id="memPwd" name="memPwd">
						</div>
						<button type="submit" class="btn btn-default">로그인</button>
					</form>
				</c:if>
				<c:if test="${!empty member }">
					<form class="form-inline text-right" action="${contextPath}/login/logoutProcess" method="post">
						<div class="form-group">
							<label>${member.memName}님</label>, 방문을 환영합니다. 
						</div>
						<button type="submit" class="btn btn-default">로그아웃</button>
					</form>
				</c:if>
			</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="board" items="${list}">
						<tr>
							<td>${board.idx}</td>
							<td>		
								<c:if test="${board.boardLevel > 0}">
									<c:forEach begin="1" end="${board.boardLevel}" >
										<span style="padding-left:10px"></span>
									</c:forEach>
									<c:if test="${board.boardAvailable == 1}">
										<img src="${contextPath}/resources/image/reply.png" width="10px" height="10px"/> <a href="${contextPath}/board/get?idx=${board.idx}"><c:out value="[RE] ${board.title}" /></a>
									</c:if>
									<c:if test="${board.boardAvailable ==0}">
										<img src="${contextPath}/resources/image/reply.png" width="10px" height="10px"/> <a href="javascript:goMsg()">삭제된 게시물입니다</a>
									</c:if>
								</c:if>
								<c:if test="${board.boardLevel eq 0}">
									<c:if test="${board.boardAvailable == 1}">
										<a href="${contextPath}/board/get?idx=${board.idx}"><c:out value="${board.title}" /></a>
									</c:if>
									<c:if test="${board.boardAvailable == 0}">
										<a href="javascript:goMsg()">삭제된 게시물입니다</a>
									</c:if>
								</c:if>
							</td>
							<td>${board.writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.indate}" /></td>
							<td>${board.count}</td>
						</tr>					
					</c:forEach>
					<c:if test="${!empty member}">
						<tr>
							<td colspan="5">
								<button id="regBtn" class="btn btn-sm btn-primary pull-right">글쓰기</button>	
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Modal Header</h4>
							</div>
							<div class="modal-body">
						  		<p>This is a small modal.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- // Modal -->
			</div>
			<div class="panel-footer">스프2탄(답변형 게시판 만들기)</div>
		</div>
	</div>
</body>
</html>