<%@ page language="java" contentType="texthtml; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<link rel="stylesheet" type="text/css" href="./layui/css/layui.css" />
</head>
<body>
	<script type="text/javascript" id="probar">
	<div>
		<input id='checktext' required lay-verify="required"
			placeholder="请输入ID或商品名称" autocomplete="off" class="layui-input">
		<button class="layui-btn layui-btn-normal" id='checkBut'>查询</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_del()'>删除</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_add()'>增加</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_update()'>修改</button>
		<button class="layui-btn layui-btn-warm" onclick='juese()'>分配角色</button>
	</div>
</script>

	<table class="layui-table"
		lay-data="{url:'chaxun',method:'post',toolbar:'#probar',id:'userlist',page:true,}"
		lay-filter="filter">
		<thead>
			<th lay-data="{type:'radio'}"></th>
			<th lay-data="{field:'faceid',sort:true}">用户ID</th>
			<th lay-data="{field:'facename',edit:'text'}">用户姓名</th>
			<th lay-data="{field:'zhiwei',edit:'text'}">职位</th>
			<th lay-data="{field:'sex',edit:'text'}">角色性别</th>
			<th lay-data="{field:'userage',edit:'text'}">角色年龄</th>
			<th lay-data="{field:'lasttime',edit:'text'}">最后登录时间</th>
			</tr>
		</thead>
	</table>

	<!-- 弹出层 (增加)-->
	<div hidden id='insertdate_user_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_name" name="facename"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">用户ID</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_id" name="faceid"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出层（ 修改） -->
	<div hidden id='update_user_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" id="update_name" name="facename"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="../layui/layui.all.js"></script>
	<script type="text/javascript">
var $ = layui.jquery;
var table = layui.table;
var layer = layui.layer;

//查询
$("#checkBut").click(function() {
	var checktext = $("#checktext").val();
	alert(checktext);
	table.reload("userlist",{
	url:"chaxun",
	where:{
	"checktext":checktext
					}
			});
});

	//增加
		function pro_add() {
			layer.open({
				title : "增加信息",
				type : 1,
				/*对应第一个div的id  */
				content : $("#insertdate_user_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.post("insertyonghu", {
						"facename" : $("#insertdate_name").val(),
						"faceid":$("#insertdate_id").val(),
					}, function() {
						//关闭窗口
						layer.closeAll();
						//列表刷新
						layer.msg("增加成功");
						table.reload("userlist");
					});
				}
			});
		}
		
		//修改
		function pro_update() {
			//checkStatus是layui定义的方法，获取选中行的数据
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].faceid;
				$("#update_name").val(checkdata[0].role_name);
				layer.open({
					title : "修改信息",
					type : 1,
					/*对应第一个div的id  */
					content : $("#update_user_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("updateyonghu", {
							"faceid" : checkid,
							"facename" : $("#update_name").val(),
						}, function() {
							//关闭窗口
							layer.closeAll();
							//列表刷新
							layer.msg("修改成功");
							table.reload("userlist");
						});
					}
				});
			} else {
				//未选中
				//提示要选中
				layer.msg("请先选中数据");
			}
		}
		
	//删除
		function pro_del() {
			var checkStatus = table.checkStatus('userlist').data
			if (checkStatus.length > 0) {
				var checkid = checkStatus[0].faceid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要删除吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post("delyonghu", {
							"faceid" : checkid
						}, function() {
							layer.closeAll();
							//重新加载列表
							table.reload("userlist");
							layer.msg("删除成功");
						});
					}
				})
			} else {
				layer.msg("请先选中数据")

			}
			;
		}		
		
		function juese(){
			var checkStatus = table.checkStatus('userlist').data
			if (checkStatus.length > 0) {
			var faceid= checkStatus[0].faceid;
	          	window.location.href = 'transfer/'+faceid+'';
			}else{
			layer.msg("请先选中数据")
			}
		}
		
</script>
</body>
</html>