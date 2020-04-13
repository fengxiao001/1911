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
<div id="test1" style="display: none;"></div>
	<script type="text/javascript" id="probar">
	<div>
		<input id='checktext' required lay-verify="required"
			placeholder="请输入ID或商品名称" autocomplete="off" class="layui-input">
		<button class="layui-btn layui-btn-normal" id='checkBut'>查询</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_del()'>删除</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_add()'>增加</button>
		<button class="layui-btn layui-btn-normal" onclick='pro_update()'>修改</button>
	</div>
</script>

<script type="text/html" id="gendan">
  <a class="layui-btn layui-btn-ms "  lay-event="fenghao" onclick=gendan();>跟单</a>
</script>

	<table class="layui-table"
		lay-data="{url:'checkgonghai',method:'post',toolbar:'#probar',id:'userlist',page:true,}"
		lay-filter="filter">
		<thead>
			<th lay-data="{type:'radio'}"></th>
			<th lay-data="{field:'customer_id',sort:true}">客户ID</th>
			<th lay-data="{field:'customer_name',sort:true}">客户姓名</th>
			<th lay-data="{field:'customer_man',edit:'text'}">客户性别</th>
			<th lay-data="{field:'customer_tel',edit:'text'}">客户电话</th>
			<th lay-data="{field:'customer_email',edit:'text'}">客户邮箱</th>
			<th lay-data="{field:'customer_addr',edit:'text'}">客户地址</th>
			<th lay-data="{field:'customer_public',width:100,templet:function(d){
				if(d.customer_public == 1){
				return '是';
				}else{
				return '否';
				}
				}}">公海用户</th>
	        <th lay-data="{field:'customer_grade',width:170,templet:function(d){
				if(d.customer_grade == 1){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';}
				else if(d.customer_grade == 2){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';
				}else if(d.customer_grade == 3){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';
				}else if(d.customer_grade == 4){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';
				}else if(d.customer_grade == 5){
				return '<i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i><i class='+' layui-icon '+'>'+'&#xe67a;'+'<i>';
				}else{
				return '  ';
				}
				}}">评级</th>
				<th lay-data="{toolbar:'#gendan'}">操作</th>
			</tr>
		</thead>
	</table>

	<!-- 弹出层 (增加)-->
	<div hidden id='insertdate_user_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户ID</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_id" name="customer_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户名字</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_name" name="customer_name"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户性别</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_man" name="customer_man"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户电话</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_tel" name="customer_tel"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户邮箱</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_email" name="customer_email"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户地址</label>
				<div class="layui-input-inline">
					<input type="text" id="insertdate_addr" name="customer_addr"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
			<label class="layui-form-label">公海用户</label>
			<div class="layui-input-inline layui-form">
				 <input type="radio" name="customer_public" id="insert_public" value="1" title="是" >
            <input type="radio" name="customer_public" id="insert_public" value="0" title="否">    
			</div>
		</div>
		</div>
	</div>
	<!-- 弹出层（ 修改） -->
	<div hidden id='update_user_div'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户名</label>
				<div class="layui-input-inline">
					<input type="text" id="update_name" name="facename"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户性别</label>
				<div class="layui-input-inline">
					<input type="text" id="update_man" name="customer_man"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户电话</label>
				<div class="layui-input-inline">
					<input type="text" id="update_tel" name="customer_tel"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户邮箱</label>
				<div class="layui-input-inline">
					<input type="text" id="update_email" name="customer_email"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户地址</label>
				<div class="layui-input-inline">
					<input type="text" id="update_addr" name="customer_addr"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<div hidden id='update_gendan_div'>
		<div class="layui-form-item">
		<div class="layui-inline">
				<label class="layui-form-label">确定要跟单吗？</label>
				<div class="layui-input-inline">
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
var rate = layui.rate;

//查询
$("#checkBut").click(function() {
	var checktext = $("#checktext").val();
	table.reload("userlist",{
	url:"checkyonghu",
	where:{
	"checktext":checktext
					}
			});
});

	//增加
		function pro_add() {
		var checkdata = table.checkStatus('customer').data;
		$("input[name='customer_public'][value='"+checkdata.customer_public+"']").prop("checked","checked");
			layer.open({
				title : "增加信息",
				type : 1,
				/*对应第一个div的id  */
				content : $("#insertdate_user_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					$.post("insertkehu", {
					"customer_id":$("#insertdate_id").val(),
						"customer_name" : $("#insertdate_name").val(),
						"customer_man": $("#insertdate_man").val(),
						"customer_tel":$("#insertdate_tel").val(),
					    "customer_email":$("#insertdate_email").val(),
					    "customer_addr":$("#insertdate_addr").val(),
					    "customer_public" : $("input[name='customer_public']:checked").val(),
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
				var checkid = checkdata[0].customer_id;
				$("#update_name").val(checkdata[0].role_name);
				layer.open({
					title : "修改信息",
					type : 1,
					/*对应第一个div的id  */
					content : $("#update_user_div"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("updatekehu", {
							"customer_id" : checkid,
							"customer_name" : $("#update_name").val(),
							"customer_man" : $("#update_man").val(),
							"customer_tel" : $("#update_tel").val(),
							"customer_email" : $("#update_email").val(),
							"customer_addr" : $("#update_addr").val(),
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
				var checkid = checkStatus[0].customer_id;
				layer.open({
					title : "提示框",
					type : 1,
					content : '确定要删除吗？',
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post("delkehu", {
							"customer_id" : checkid
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
			};
		}		
		
		//修改
		function pingji() {
			//checkStatus是layui定义的方法，获取选中行的数据
			var checkdata = table.checkStatus('userlist').data;
			var grade;
				rate.render({
					  elem: '#test1'
					  ,choose: function(value){
						  grade=value;
					  }
					});
			if (checkdata.length > 0) {
				var checkid = checkdata[0].customer_id;
				layer.open({
					title : "修改信息",
					type : 1,
					/*对应第一个div的id  */
					content : $("#test1"),
					btn : [ "保存", "关闭" ],
					btn1 : function() {
						$.post("updatepingji", {
							"customer_id" : checkid,
							"customer_grade" : grade
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
		
     //跟单
		function gendan() {
			//checkStatus是layui定义的方法，获取选中行的数据
			var checkdata = table.checkStatus('userlist').data;
			if (checkdata.length > 0) {
				var checkid = checkdata[0].customer_id;
				$("#update_name").val(checkdata[0].role_name);
				layer.open({
					title : "跟单",
					type : 1,
					/*对应第一个div的id  */
					content : $("#update_gendan_div"),
					btn : [ "确定", "关闭" ],
					btn1 : function() {
						$.post("updategendan", {
							"customer_id" : checkid,
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
</script>
</body>
</html>