<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("리뷰가 작성되었습니다.");
		opener.location.href = "${pageContext.request.contextPath}/product/${num}";
		window.close();
	</script>
</body>
</html>