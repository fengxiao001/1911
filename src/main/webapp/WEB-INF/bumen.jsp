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
		<button class="layui-btn layui-btn-warm" onclick='quanxian()'>权限设置</button>
	</div>
</script>

	<table class="layui-table"
		lay-data="{url:'checkbumen',method:'post',toolbar:'#probar',id:'userlist',page:true,}"
		lay-filter="filter">
		<thead>
			<th lay-data="{type:'radio'}"></th>
			<th lay-data="{field:'bmid',sort:true}">部门ID</th>
			<th lay-data="{field:'bmname',sort:true}">部门姓名</th>
			<th lay-data="{field:'managerr',sort:true}">部门人员</th>
		</tr>
		</thead>
	</table>
	
	<!-- 弹出层（ 修改） -->               
	<div hidden id='update_user_div'>
		<div class="layui-form-item">
			<div class="layui-inline">                          
				<label class="layui-form-label">部门名字</label>
				<div class="layui-input-inline">                      
					<input type="text" id="update_name" name="bmname"
						autocomplete="off" class="layui-input">	      					
               </div>                                          
			</div>
		</div>
	</div>
	
	
	<!-- 弹出层 (增加)-->
	<form action="" class="layui-form" method="post">
	<div  hidden id="insert_user_div">
       <div class="layui-inline">
			<label class="layui-form-label">部门名</label>
			<div class="layui-input-inline">
				<input type="text" name="bmname" autocomplete="off"
					id="insert_name" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">经理</label>
			<div class="layui-input-inline">
				<select name="sort" lay-verify="" id="goods">
					<option value="">请选择人员</option>
				</select>
			</div>
		</div>
	</div>
	</form>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script src="../layui/layui.all.js"></script>
	<script type="text/javascript">
var $ = layui.jquery;
var table = layui.table;
var layer = layui.layer;
var form = layui.form;

//查询
$("#checkBut").click(function() {
	var checktext = $("#checktext").val();
	alert(checktext);
	table.reload("userlist",{
	url:"checkper",
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
				content : $("#insert_user_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.post("insertbumen", {
						"bmname" : $("#insert_name").val(),
						"managerr" : $("#goods").val(),
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
				var checkid = checkdata[0].bmid;
				$("#update_name").val(checkdata[0].role_name);
				layer.open({
					title : "修改信息",
					type : 1,
					/*对应第一个div的id  */
					content : $("#update_user_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("updatebumen", {
							"bmid" : checkid,
							"bmname" : $("#update_name").val(),
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
				var checkid = checkStatus[0].bmid;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要删除吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post("delbumen", {
							"bmid" : checkid
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
		function findAll() {
			$(function() {
				$.ajax({
					type : "post",
					url : "findAll",
					dataType : "json",
					success : function(data) {
						$.each(data, function(index, item) {
							console.log(data);
							$("#goods").append(
									"<option value="+item.facename+">"
											+ item.facename + "</option>");
							form.render('select');
						})
						form.render('select');
					}
				})
			})
		}
		findAll();
		
		function quanxian(){
			var checkStatus = table.checkStatus('userlist').data
			if (checkStatus.length > 0) {
			var role_id = checkStatus[0].role_id;
	          	window.location.href = 'role_perm_page/'+role_id+'';
			}else{
			layer.msg("请先选中数据")
			}
		}
</script>
</body>
</html>