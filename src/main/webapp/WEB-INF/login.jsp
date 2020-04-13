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
${mes}
<form action="/login_system" method="post">
<input name="username">
<input name="password" type="password">
<button>提交</button>
</form>
<div class="demo-tree demo-tree-box" id="test1"></div>
<script src="layui/layui.all.js"></script>
</body>
</html>