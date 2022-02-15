<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<script>

	$(function() {
		$.ajax({
			url: "/qna/list/ans?p_num=${p.num}",
			method: "get",
			success: function(data) {
				for(i = 0 ; i < data.length ; i++) {
					var d = data[i].writeDate;
					var html = "<div class='px-5 card border-0' style='width: 100%;'>";
					html += "<div class='card-body' style='padding-top: 0'>";
					html += "<h4><i style='float: left' class='bi bi-arrow-return-right'></i></h4>";
					html += "<h6 class='card-subtitle mb-2 text-muted'> 관리자 | " + data[i].writeDate + "</h6>";
					html += "<div class='px-4'><p class='card-text'>" + data[i].content + "</p>";
					html += "</div></div></div>";
					html += "<center><c:if test='${st.last == false}'><hr style='margin: 0; width: 95%'></c:if></center>";
					$("#" + data[i].top_question).append(html);
				}
			}
		});
		
		$(".ans").click(function() {
			let n = $(this).attr("data-num");
			$('.exam' + n).collapse('toggle');
		});
	});
	
	function checkAnswer(num) {
		var c = $("#adA" + num).val();
		if (c != null && c.trim() != "") {
			return true;
		} else {
			alert("답변을 작성하세요.");
			return false;
		}
	}
</script>
</head>
<body>
	<div id="reList" class="border-top-0 border pb-2">
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list }" var="q" varStatus="st">
					<c:if test="${q.qna_type == 0}">
						<div id="${q.num }" class="card border-0" style="width: 100%;">
							<div class="card-body" style="padding-bottom: 3px">
								<h6 class="card-subtitle mb-2 text-muted">
									<fmt:formatDate var="day" value="${q.writeDate}"
										pattern="yyyy.MM.dd" />
									${q.mem_id} | ${day }
									<c:if test="${sessionScope.type == 0 }">
										<button data-num="${q.num }" style="float: right"
											type="button" class="ans btn btn-dark">답변</button>
									</c:if>
								</h6>
								<p class="card-text">${q.content }</p>
							</div>
						</div>
						<!-- toggle -->
						<div class="collapse exam${q.num}" style="text-align: right">
							<form class="answerForm${q.num }"
								action="${pageContext.request.contextPath }/qna/add"
								method="post">
								<textarea id="adA${q.num}" rows="5" class="w-100 form-control"
									style="resize: none" name="content"></textarea>
								<button type="submit" class="btn btn-dark"
									onclick="return checkAnswer(${q.num})">작성</button>
								<input type="hidden" name="p_num" value="${q.p_num }"> <input
									type="hidden" name="top_question" value="${q.num }"> <input
									type="hidden" name="qna_type" value="1"> <input
									type="hidden" name="mem_id" value="${sessionScope.id }">
							</form>
						</div>
						<!-- toggle -->
						<center>
							<c:if test="${st.last == false}">
								<hr class="mt-2" style="margin: 0; width: 95%">
							</c:if>
						</center>
					</c:if>
					<%-- <c:if test="${q.qna_type == 1}">
						<div class="px-5 card border-0" style="width: 100%;">
							<div class="card-body">
								<h4>
									<i style="float: left" class="bi bi-arrow-return-right"></i>
								</h4>
								<h6 class="card-subtitle mb-2 text-muted">
									<fmt:formatDate var="day" value="${q.writeDate}"
										pattern="YYYY.MM.DD" />
									관리자 | ${day }
								</h6>
								<div class="px-4">
									<p class="card-text">${q.content }</p>
								</div>
							</div>
						</div>
						<center>
							<c:if test="${st.last == false}">
								<hr style="margin: 0; width: 95%">
							</c:if>
						</center>
					</c:if> --%>
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