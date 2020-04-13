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
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
</head>
<body>
	<input type="hidden" name="role_id" value="${role_id}"/>
	<div class="demo-tree demo-tree-box" id="test1"></div>
	<button class="layui-btn layui-btn-normal" id='save'>保存</button>
	<script src="layui/layui.all.js"></script>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
var $ = layui.jquery;
var table = layui.table;
var layer = layui.layer;
var upload=layui.upload;
var tree=layui.tree;
$.ajaxSettings.async=false;
$.post("treeJson",function(d){
	testTree=d;
});

//常规用法
tree.render({ 
	id:"perm_tree",
	showCheckbox:true,
	elem:'#test1'
	,data:testTree
});

//给保存按钮声明一个事件
    $("#save").click(function(){
	var role_id=$("[name='role_id']").val();
	var checkData = tree.getChecked('perm_tree');
		var perms="";
		for(var i=0;i<checkData.length;i++){
		perms+=checkData[i].id+',';
		var children=checkData[i].children;
		for(var j=0;j<children.length;j++){
		 perms+=children[j].id+',';
		}
		}
		location.href="role_perm/"+role_id+"/"+perms;
});
</script>
</body>
</html>