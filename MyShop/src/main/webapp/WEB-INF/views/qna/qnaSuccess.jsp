<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		if ('${result}' == 1) {
			alert("답변이 작성 되었습니다.");
			location.href = "${pageContext.request.contextPath}/product/${num}";
		} else {
			alert("질문이 작성 되었습니다.");
			opener.location.href = "${pageContext.request.contextPath}/product/${num}";
			window.close();
		}
	</script>
</body>
</html>