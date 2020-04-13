<%@ page language="java" contentType="texthtml; UTF-8"
	pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="layui/css/layui.css" />
</head>
<body>

<script src="layui/layui.all.js"></script>
<script type="text/javascript">
console.log("跳转登录");
window.top.location.href="login"
</script>
</body>
</html>