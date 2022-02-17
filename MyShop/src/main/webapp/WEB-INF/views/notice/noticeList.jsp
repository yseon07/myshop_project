<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyShop-notice</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<!-- <script src="/resources/js/m.js"></script> -->
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<c:if test="${sessionScope.type == 0 }">
					<button type="button" class="btn btn-dark my-1"
						style="float: right"
						onclick="location.href='${pageContext.request.contextPath}/notice/write'">공지
						작성</button>
				</c:if>
				<table class="table table-hover border-bottom"
					style="text-align: center">
					<thead class="table-secondary">
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">작성자</th>
						</tr>
					</thead>
					<c:set var="num"
						value="${pm.totalCount - ((pm.p.page-1) * 10) }" />
					<c:forEach items="${list }" var="n" varStatus="status">
						<tr>
							<td>${num }
							</td>
							<td><a
								href="${pageContext.request.contextPath }/notice/${n.num}"
								class="text-reset" style="text-decoration: none">${n.notice_title }</a></td>
							<td><fmt:formatDate var="day" value="${n.write_date}"
									pattern="yyyy.MM.dd" />${day }</td>
							<td>관리자</td>
						</tr>
						<c:set var="num" value="${num-1 }"></c:set>
					</c:forEach>
				</table>
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<c:if test="${pm.prev }">
							<li class="page-item"><a
								href="notice${pm.makeQuery(pm.startPage - 1)}"
								class="page-link">이전</a></li>
						</c:if>
						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
							<li class="page-item"><a href="notice${pm.makeQuery(idx)}"
								class="page-link">${idx }</a></li>
						</c:forEach>
						<c:if test="${pm.next && pm.endPage > 0}">
							<li class="page-item"><a
								href="notice${pm.makeQuery(pm.endPage + 1)}" class="page-link">다음</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>