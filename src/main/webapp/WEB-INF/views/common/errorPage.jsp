<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
	<h1>원쿡 에러메시지</h1>
	<h2>${msg}</h2>
		<a href="javascript:void(0);" onclick="goBack();">이전으로 이동</a>
		<script>
		function goBack(){
			history.back();
		}
		</script>
</body>
</html>