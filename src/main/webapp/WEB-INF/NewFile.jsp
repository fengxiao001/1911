<%@ page language="java" contentType="texthtml; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
</head>
<body>
	<div>
		<input id='checktext' required lay-verify="required"
			placeholder="请输入ID或商品名称" autocomplete="off" class="layui-input">
		<button class="layui-btn layui-btn-normal" id='checkBut'>查询</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_del()'>删除</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_add()'>增加</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_update()'>修改</button>
		<button class="layui-btn layui-btn-warm" id='checkBut'>权限设置</button>
	</div>


	<table class="layui-table"
		lay-data="{url:'checkuser',method:'post',toolbar:'#probar',id:'userlist',page:true,}"
		lay-filter="filter">
		<thead>
			<th lay-data="{type:'radio'}"></th>
			<th lay-data="{field:'role_id',sort:true}">角色ID</th>
			<th lay-data="{field:'role_name',edit:'text'}">角色名</th>
			</tr>
		</thead>
	</table>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="layui/layui.all.js"></script>
	<script type="text/javascript">
var $ = layui.jquery;
var table = layui.table;
var layer = layui.layer;

//查询
$("#checkBut").click(function() {
	var checktext = $("#checktext").val();
	alert(checktext);
	table.reload("yonghu",{
	url:"checkuser",
							where:{
								"checktext":checktext
					}
			});
});

</script>
</body>
</html>