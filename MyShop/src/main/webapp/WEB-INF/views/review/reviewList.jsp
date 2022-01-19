<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="reList" class="border-top-0 border">
		<c:choose>
			<c:when test="${not empty list }">
				<c:forEach items="${list }" var="r" varStatus="st">
					<div class="card border-0" style="width: 100%;">
						<div class="card-body">
							<h6 class="card-subtitle mb-2 text-muted">
							<fmt:formatDate var="day" value="${r.writeDate}" pattern="YYYY.MM.DD"/>
							${r.mem_id} | ${day }</h6>
							<h5 class="card-title">
								<c:forEach begin="1" end="5" varStatus="status">
									<c:choose>
										<c:when test="${r.star >= status.index}">
											<i class="fas bi bi-star-fill" style="font-size: 30px"></i>
										</c:when>
										<c:otherwise>
											<i class="fas bi bi-star" style="font-size: 30px"></i>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</h5>
							<p class="card-text">${r.content }</p>
						</div>
					</div>
					<center>
						<c:if test="${st.last == false}">
							<hr style="margin: 0; width: 95%">
						</c:if>
					</center>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="border-0 card text-center"
					style="width: 100%;">
					<div class="card-body">
						<h5 class="card-title">등록된 후기가 없습니다.</h5>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>