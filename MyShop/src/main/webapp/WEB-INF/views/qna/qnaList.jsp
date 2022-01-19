<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkAnswer() {
		let c = $("#adA").val();
		if (c != null && c.trim() != "") {
			return true;
		} else {
			alert("답변을 작성하세요.");
			return false;
		}
	}

	$(function() {
		$("#ans").click(function() {
			$('#exam').collapse('toggle');
		});
	});
</script>
</head>
<body>
	<div id="reList" class="border-top-0 border">
		<c:choose>
			<c:when test="${not empty list }">
				<c:forEach items="${list }" var="q" varStatus="st">
					<div class="card border-0" style="width: 100%;">
						<div class="card-body">
							<h6 class="card-subtitle mb-2 text-muted">
								<fmt:formatDate var="day" value="${q.writeDate}"
									pattern="YYYY.MM.DD" />
								${q.mem_id} | ${day }
								<c:if test="${sessionScope.type == 0 }">
									<button id="ans" style="float: right" type="button"
										class="btn btn-dark">답변</button>
								</c:if>
							</h6>
							<p class="card-text">${q.content }</p>
						</div>
					</div>
					<!-- toggle -->
					<div class="collapse" id="exam" style="text-align: right">
						<form action="${pageContext.request.contextPath }/qna/add"
							method="post" onsubmit="return checkAnswer()">
							<textarea id="adA" rows="5" class="w-100 form-control"
								style="resize: none" name="content"></textarea>
							<button type="submit" class="btn btn-dark">작성</button>
							
							<input type="hidden" name="p_num" value="${q.p_num }">
							<input type="hidden" name="top_question" value="${q.num }">
							<input type="hidden" name="qna_type" value="1"> <input
								type="hidden" name="mem_id" value="${sessionScope.id }">
						</form>
					</div>
					<!-- toggle -->
					<center>
						<c:if test="${st.last == false}">
							<hr style="margin: 0; width: 95%">
						</c:if>
					</center>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="border-0 card text-center" style="width: 100%;">
					<div class="card-body">
						<h5 class="card-title">등록된 질문이 없습니다.</h5>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>