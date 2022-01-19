<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productView</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<script>
var id = '${sessionScope.id}';

function loginCheck() {	
	if(id != null && id != "") {
		return true;
	} else {
		return false;
	}
}
	$(document).ready(
			function() {
				if(loginCheck()) {
					$.ajax({
						url: "/like/${p.num}/mem",
						data: { mem_id: id, p_num: ${p.num} },
						method: "post",
						success: function(data) {
							if(data == 1) {
								$("#vpBtn1").removeClass("bi-gift");
								$("#vpBtn1").addClass("bi-gift-fill");
							}
						}
					})
				};
				
				
				$("img").mouseover(
						function() {
							var n1 = $(this).attr("id");
							if (n1 == 'mainImg') {
								return false;
							}
							var n2 = $(this).attr("class");
							$("#mainImg").attr(
									"src",
									"${pageContext.request.contextPath }/img?num="
											+ n2 + "&fname=" + n1);
						});
				
				$("#pLike").click(function() {
					if(loginCheck()) {
						$.ajax({
							url: "/like/${p.num}",
							data: {mem_id: id, p_num: ${p.num} },
							method: 'post',
							success: function(data) {
								if(data == 1) {
									$("#vpBtn1").removeClass("bi-gift");
									$("#vpBtn1").addClass("bi-gift-fill");
								} else {
									$("#vpBtn1").removeClass("bi-gift-fill");
									$("#vpBtn1").addClass("bi-gift");
								}
							}
						});
					} else {
						var an = confirm("로그인이 필요한 기능입니다. 로그인 하시겠습니까?");
						if(an == true) {
							location.href="/member/login";
						}
					}
				});
				
				$("#myTab a").click(function(e) {
					e.preventDefault();
					$(this).tab("show");
				});
				
				/* $("#reviewWrite").click(function() {
					if(loginCheck()) {
						var option = "width = 700, height = 400, top = 100, left = 200, scrollbars = no, location = no, toolbars = no, status = no";
						window.open("/review/add?pNum=${p.num}", "비밀번호 변경", option);
					} else {
						alert("로그인 후 작성 가능 합니다.");
					}
				}); */
				
				 $("#qBtn").click(function() {
				if(loginCheck()) {
					var option = "width = 700, height = 400, top = 100, left = 200, scrollbars = no, location = no, toolbars = no, status = no";
					window.open("/qna/add?p_num=${p.num}", "질문 등록", option);
				} else {
					var an = confirm("로그인이 필요한 기능입니다. 로그인 하시겠습니까?");
					if(an == true) {
						location.href="/member/login";
					}
				}
			}); 
			});
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row" style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="col-2"></div>
		<div class="col-8">
			<div id="p1" class="row">
				<div id="imgP"
					class="col-6 align-items-center justify-content-center">
					<c:choose>
						<c:when test="${not empty p.files }">
							<table style="text-align: center; width: 100%">
								<tr>
									<td colspan="5" style="padding: 0px"><img id="mainImg"
										width="80%" height="200"
										src="${pageContext.request.contextPath }/img?num=${p.num}&fname=${p.files[0]}">
									</td>
								</tr>
								<tr id="listTr">
									<c:forEach items="${p.files }" var="f" varStatus="status">
										<td class="imgListTd"><img id="${p.files[status.index]}"
											class="${p.num }" width="40" height="40"
											src="${pageContext.request.contextPath }/img?num=${p.num}&fname=${p.files[status.index]}">
										</td>
									</c:forEach>
								</tr>
							</table>
						</c:when>
						<c:otherwise>
							<table>
								<tr>
									<td colspan="5" style="padding: 0px"><img id="mainImg"
										width="100%" height="200"
										src="${pageContext.request.contextPath }/img?num=0&fname=no_img.jpg">
									</td>
								</tr>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="productInfo" class="col-6">
					<div class="my-2" style="font-size: 30px">${p.product_title }</div>
					<div class="priceDiv row my-2" style="font-size: 20px">
						<div class="col-6">
							<c:if test="${p.discount != 0 }">
								<span>${p.discount }%</span>
							</c:if>
						</div>
						<div style="display: inline-block; text-align: right"
							class="col-6">
							<c:choose>
								<c:when test="${p.discount == 0 }">
									<b>${p.product_price }</b>원
								</c:when>
								<c:otherwise>
									<small style="color: gray"><b><strike>${p.product_price }원</strike></b></small>
									<b>${fn:split(p.product_price - p.product_price * p.discount/100, '.')[0]}</b>원
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="btnDiv my-5 text-center">
						<button type="button" style="width: 100%" class="btn btn-dark">구매</button>
						<button id="pLike" type="button" style="width: 49%"
							class="btn btn-outline-dark my-2">
							<i id="vpBtn1" class="mx-1 bi bi-gift"></i>찜하기
						</button>
						<button type="button" style="width: 49%"
							class="btn btn-outline-dark my-2">
							<i id="vpBtn2" class="mx-1 bi bi-cart-plus"></i>장바구니
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	<div class="mainDiv row" id="reviewDiv" style="padding: 0 5% 0 5%">
		<div class="col-2"></div>
		<div class="col-8 my-2">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li role="presentation" style="width: 50%" class="nav-item"><a
					class="nav-link active" id="home-tab" data-toggle="tab" href="#r1">리뷰</a></li>
				<li role="presentation" style="width: 50%" class="nav-item"><a
					class="nav-link" id="profile-tab" data-toggle="tab" href="#q1">QnA</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="r1" role="tabpanel"
					aria-labelledby="home-tab">
					<c:import url="/review/list?p_num=${p.num }"></c:import>
				</div>
				<div class="tab-pane fade" id="q1" role="tabpanel">
					<!-- <button type="button" id="qBtn" class="btn btn-dark">질문</button> -->
					<c:import url="/qna/list?p_num=${p.num }"></c:import>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
</body>
</html>