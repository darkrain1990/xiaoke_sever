<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户管理</title>
<script src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath %>js/bootstrap.min.js"></script>	
<script src="<%=basePath %>js/easypiechart.js"></script>
<script src="<%=basePath %>js/easypiechart-data.js"></script>
<script src="<%=basePath %>js/bootstrap-table.js"></script>	
<script src="<%=basePath %>js/daohang.js"></script> 
<script src="<%=basePath %>js/jqPaginator.js"></script>
<link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath %>css/datepicker3.css" rel="stylesheet">
<link href="<%=basePath %>css/styles.css" rel="stylesheet">


</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="width: 100%; height: 20px">
	<jsp:include page="top.jsp"></jsp:include>
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<jsp:include page="left.jsp"></jsp:include>
</div>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row" id="yhcx">
		<ol class="breadcrumb">
			<li><a href="user.jsp"><span class="glyphicon glyphicon-home"></span></a> &nbsp/&nbsp <a href="user.jsp">权限管理</a> &nbsp/&nbsp <a href="../loads/user.jsp" class="user">用户管理</a></li>
			</ol>
	</div><!--/.row-->
		
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default" style="margin-top:20px;">
				<div class="panel-body">
                   	<div class="row">
						<div class="col-lg-2 col-sm-3 col-md-3">
							<div class="form-group">
								<label>登录名</label>
								<input type="text" class="form-control" placeholder="用户登录名" id="q_loginName">
							</div>
						</div>
						<div class="col-lg-2 col-sm-3 col-md-3">
							<div class="form-group">
								<label>手机号</label>
								<input type="text" class="form-control" placeholder="用户手机号" id="q_mobile">
							</div>
						</div>
						<div class="row" style="margin-top:24px">
							<div class="col-lg-2 col-sm-2 col-md-2">
								<button type="submit" class="btn btn-primary" onclick="query()">查询用户</button>
								<script type="text/javascript">
									//查询按钮单击事件
									function query(){
										show(1);
									}
									
									var sysFlag = false;	//所属系统查询标识
									var index = 1;	//分页组件当前页索引
								</script>
							</div>
							<div class="col-lg-2 col-lg-pull-1 col-sm-2 col-md-2">
								<button class="btn btn-primary" id="addUser">新增用户</button>
							</div>
						</div>
					</div>
						
					<div class="row" style="margin-top:20px">
                        <div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered" id="userTable">
									<thead>
										<tr class="active">
											<th>登录名</th>
											<th>用户姓名</th>
											<th style='display:none;'>用户描述</th>
											<th>是否可用</th>
											<th>是否超级用户</th>
											<th style='display:none;'>所在单位</th>
											<th style='display:none;'>职位</th>
											<th style='display:none;'>邮箱</th>
											<th style='display:none;'>手机号</th>
											<th>所属系统—角色</th>
											<th style='display:none;'>ID</th>
											<th>操作</th>
										</thead>
									<tbody id="t_attrs_body"></tbody>
								</table>
							</div>
						</div>
					</div><!--table-->
					
					<!--分页-->
					<div class="pull-right" >
						<ul class="pagination" id="pagination2"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function EditUser(id,loginName,userName,userDesc,enabled,issys,userDept,userDuty,email,mobileNum,index){
			this.id = id;
			this.loginName=loginName;
			this.userName=userName;
			this.userDesc=userDesc;
			this.enabled=enabled;
			this.issys=issys;
			this.userDept=userDept;
			this.userDuty=userDuty;
			this.email=email;
			this.mobileNum=mobileNum;
			this.index=index;
		}
		//显示用户
		function show(index){
			var url = "<%=basePath %>user/show";
			var mobile = $.trim($("#q_mobile").val());
			var loginName = $.trim($("#q_loginName").val());
			
			var param = {
					'index':index,
					'pageSize':6,
					'mobile':mobile,
					'loginName':loginName
					}; 
			
			$.get(url,param,function(data){
				var json = $.parseJSON(data);
				//加载表格
				var users = json.users;
				loadTable(users);
				
				//加载分页条
				$("#pagination2").jqPaginator('option',{
					currentPage : (json.index==0?1:json.index),
					totalPages : json.pageTotal
				});
			});
		 	
		}
		
		//加载表格
		function loadTable(users){
			$("#t_attrs_body").html("");
			if(users!=null){
				$.each(users,function(i,value){
					$("#t_attrs_body").append("<tr> <td id=\"td_"+i+"0\">"+value.loginName+"</td>"+
									"<td id=\"td_"+i+"1\">"+value.userName+"</td>"+
									"<td style='display:none;' id=\"td_"+i+"2\">"+value.userDesc+"</td>"+
									"<td id=\"td_"+i+"3\">"+(value.enabled==1?"可用":"不可用")+"</td>"+
									"<td id=\"td_"+i+"4\">"+(value.issys==1?"超级用户":"普通用户")+"</td>"+
									"<td style='display:none;' id=\"td_"+i+"5\">"+value.userDept+"</td>"+
									"<td style='display:none;' id=\"td_"+i+"6\">"+value.userDuty+"</td>"+
									"<td style='display:none;' id=\"td_"+i+"7\">"+value.email+"</td>"+
									"<td style='display:none;' id=\"td_"+i+"8\">"+value.mobileNum+"</td>"+
									"<td style='display:none;' id=\"td_"+i+"9\">"+value.systemId+"</td>"+
									"<td id=\"td_"+i+"11\"> </td>"+
									"<td style='display:none;' id=\"td_"+i+"10\">"+value.id+"</td>"+
									"<td ><button class='btn btn-sm btn-success' onclick='showsetRoleModal(\""+i+"\")'>设置角色</button>"
												+"<button class='btn btn-sm btn-warning' onclick='showchangeUserModal(\""+i+"\")'>编辑</button>"
												+"<button class='btn btn-sm btn-danger' onclick='deleteUser(\""+value.id+"\")'>删除</button>"
											+"</td></tr>"
									);
				});
			}
		}
		
		/*分页*/
		$.jqPaginator('#pagination2', {
	        visiblePages: 6,//设置最多显示的页码数
	        currentPage: 1,//设置当前激活的页码
	        totalPages:1,
	        prev: '<li class="prev"><a href="javascript:;">Previous</a></li>',
	        next: '<li class="next"><a href="javascript:;">Next</a></li>',
	        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
	        onPageChange: function (num, type) {
	            show(num);
	            index = num;
	        }
	    });
		
	</script>
	
</div>

		<!--创建用户模态框-->	
		<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
						  请填写以下信息
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="addUserForm">
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">登录名</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Login_name" type="text" name="login_name">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">用户姓名</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Name" type="text" name="name">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">用户密码</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Password" type="password" name="password">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">用户描述</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="Description" type="text" name="description">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否可用</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="是：1 否：0，默认可用（1）" type="text" name="available">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否超级用户</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="是：1 否：0，默认可用（0）" type="text" name="superUser">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所在单位</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="Company" type="text" name="company"> 
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">职位</label>
									<div class="col-lg-7">
										<select class="form-control" name="position">
											<option>经理</option>
											<option>主管</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">邮件</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="Email" type="text" name="email">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所属系统</label>
									<div class="col-lg-7">
										<select  id="add_systems" class="form-control" name="system">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">手机号码</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="Phone" type="text" name="phone">
									</div>
								</div>
							</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="addUserModalBtn">确认创建</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--创建用户模态框-->	

		<script type="text/javascript">
			$(document).ready(function() {
				//用来存放所有用户的信息
				var users = [];
				//表格中的姓名
				var tableName;
				function User(id,loginName,userName,userPassword,userDesc,enabled,issys,userDept,userDuty,email,systemId,mobileNum){
					this.id = id;
					this.loginName=loginName;
					this.userName=userName;
					this.userPassword=userPassword;
					this.userDesc=userDesc;
					this.enabled=enabled;
					this.issys=issys;
					this.userDept=userDept;
					this.userDuty=userDuty;
					this.email=email;
					this.systemId=systemId;
					this.mobileNum=mobileNum;
				}
				//表单必填参数验证
				function formValidation(login_name,password,email,phone){
					if(login_name == ''){
						showMsg("请填写登录名称");
						$("#addUserForm input[name='login_name']").focus();
						return false;
					}
					if(password == ''){
						showMsg("请填写用户密码");
						$("#addUserForm input[name='password']").focus();
						return false;
					}
					if(email!='' && !isEmail(email)){
						showMsg("邮箱格式有误");
						$("#addUserForm input[name='email']").focus();
						return false;
					}
					if(phone!='' && !isMobile(phone)){
						showMsg("手机号格式有误");
						$("#addUserForm input[name='phone']").focus();
						return false;
					}
					
					return true;
				}
	
				$("#addUserModalBtn").on("click",function(event){
					//将用户信息保存到数组中
					var login_name = $.trim($("#addUserForm input[name='login_name']").val());
					var name = $.trim($("#addUserForm input[name='name']").val());
					var password = $.trim($("#addUserForm input[name='password']").val());
					var description = $.trim($("#addUserForm input[name='description']").val());
					var available = $.trim($("#addUserForm input[name='available']").val());
					var superUser = $.trim($("#addUserForm input[name='superUser']").val());
					var company = $.trim($("#addUserForm input[name='company']").val());
					var position = $.trim($("#addUserForm select[name='position']").val());
					var email = $.trim($("#addUserForm input[name='email']").val());
					var system = $.trim($("#addUserForm select[name='system']").val());
					var phone = $.trim($("#addUserForm input[name='phone']").val());
					
					var flag = formValidation(login_name,password,email,phone);
					//表单验证通过
					if(flag){
						var user = new User(null,login_name,name,password,description,available,superUser,company,position,email,system,phone);
						var url = "<%=basePath %>user/add";
						$.post(url,user,function(data){
							var json = $.parseJSON(data);
							if(json.result=="SUCCESS"){
								//加载表格
								var users = json.users;
								loadTable(users);
								showMsg("添加成功");
								$("#addUserModal").modal("hide");
							}else{
								showMsg(json.result);
							}
							
						});
					}
				});
			});
		</script>

		<!--设置角色模态框-->	
		<div class="modal fade" id="setRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">
						  设置角色
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="setRoleForm">
								<div class="form-group">
									<label for="label" class="col-lg-3 control-label" >用户ID</label>
									<div class="col-lg-7">
										<label class="form-control" id="r_userId" style='border:0;'></label>
									</div>
								</div>
								<div class="form-group">
									<label for="label" class="col-lg-3 control-label" >登录名</label>
									<div class="col-lg-7">
										<label class="form-control" id="r_loginName" style='border:0;'></label>
									</div>
								</div>
								<div class="form-group">
									<label for="select" class="col-lg-3 control-label" >系统</label>
									<div class="col-lg-7">
										<select id="r_systems" class="form-control" name="system">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">角色</label>
									<div class="col-lg-9" style="margin-top:7px;">
										<div id="r_roles" class="row">
										</div>
									</div>
								</div>
								<div class="row">
									<label for="textarea" class="col-lg-3 control-label">所属系统——角色</label>
									<div id="r_sys_role" class="col-lg-7" style="margin-top:6px;">
									</div>
								</div>
							</form>	
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="setRoleBtn" data-dismiss="modal">确认设置</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--设置角色模态框-->	
		
		<script type="text/javascript">
			
			var systems = null;	//系统数组对象
			var addFlag = false;
			
			$("#addUser").click(function(){
				if(systems==null){
					var url = "<%=basePath %>sys/show";
					
					$.get(url,function(data){
						systems = data.systems;
						for (var j = 0; j < systems.length; j++) {
							$("#add_systems").append("<option value="+systems[j].id+">"+systems[j].name+"</option>");
						}
					});
				}else{
					$("#add_systems").html("");
					for (var j = 0; j < systems.length; j++) {
						$("#add_systems").append("<option value="+systems[j].id+">"+systems[j].name+"</option>");
					}
				}

				$("#addUserModal").modal("show");
			});
			
			//选中用户所拥有的角色
			function checkBoxChange(roles,userRoles){
				this.roles = roles;
				var systemName = $("#r_systems").find("option:selected").text();
				
				//加载角色checkBox
				for (var j = 0; j < roles.length; j++) {
					$("#r_roles").append(
							"<div class='col-lg-4'>"+
							"<input id='r_ck_"+roles[j].id+"' onclick='changeCheck(\""+roles[j].id+"\",\""+roles[j].roleName+"\")' type='checkbox' value='"+roles[j].roleName+"'>"+
							"<label for='high'>"+roles[j].roleName+"</label>"+  
							"</div>"
							);
				}
				
				//加载用户的checkBox
				for (var j = 0; j < roles.length; j++) {
					
					for (var y = 0; y < userRoles.length; y++) {
						
						if(roles[j].systemId==userRoles[y].systemId && $("#r_ck_"+roles[j].id).val()==userRoles[y].roleName){
							$("#r_ck_"+roles[j].id).attr("checked",true);
							//添加标签
							addTag(roles[j].id,userRoles[y].roleName,roles[j].systemId,systemName);
							break;
						}
					}
				}
				
			}
			
			//添加标签
			function addTag(roleId,roleName,sysId,sysName){
				$("#r_sys_role").append(
						"<div id='r_s_"+sysId+"_"+roleId+"' class='col-lg-7' style='margin-top:6px;'><span class='label label-info' id='r_"+sysId+"_"+roleId+"'>"+
						sysName+"-"+roleName+
						"</span></div>");
				
			}
			
			//checkbox单击事件
			function changeCheck(roleId,roleName){
				var systemId = $("#r_systems").find("option:selected").val();
				var systemName = $("#r_systems").find("option:selected").text();
				
				var url = "<%=basePath %>user/aod";
				var userId = $("#r_userId").text();
			
				
				if($("#r_ck_"+roleId).prop("checked")){
					addTag(roleId,roleName,systemId,systemName);
					var param = {"userId":userId,"roleId":roleId,"flag":"add"};
					
					$.post(url,param,function(data){
					});
				}else{
					$("#r_s_"+systemId+"_"+roleId).remove();
					var param = {"userId":userId,"roleId":roleId,"flag":"del"};
					$.post(url,param,function(data){
					});
				}
			}
			
			//设置角色下拉框change事件
			$("#r_systems").change(function(){
				$("#r_roles").html("");
				$("#r_sys_role").html("");
				
				var url = "<%=basePath %>sys/ssr";
				var systemId = $(this).val();
				var userId = $("#r_userId").text();
				var param = {"systemId":systemId,"userId":userId,"sysFlag":systems==null?true:false};
				
				$.get(url,param,function(data){
					var json = $.parseJSON(data);
					var roles = json.roles;
					var userRoles = json.userRoles;
					
					checkBoxChange(roles,userRoles);
					
					$("#setRoleModal").modal("show");
				});
			});
			
			//设置角色按钮单击事件
			function showsetRoleModal(i){
				$("#r_roles").html("");
				
				var loginName = $("#td_"+i+"0").text();
				$("#r_userId").text($("#td_"+i+"10").text());
				$("#r_loginName").text(loginName);
				
				if(systems==null){
					var url = "<%=basePath %>sys/ssr";
					var userId = $("#r_userId").text();
					var systemId = $("#td_"+i+"9").text();
					var param = {"systemId":systemId,"userId":userId,"sysFlag":systems==null?true:false};
					
					$.get(url,param,function(data){
						var json = $.parseJSON(data);
						systems = json.systems;
						var roles = json.roles;
						var userRoles = json.userRoles;
						
						//加载系统下拉框
						for (var j = 0; j < systems.length; j++) {
							$("#r_systems").append("<option value="+systems[j].id+">"+systems[j].name+"</option>");
						}
						sysFlag = true;
						$("#r_systems").val($("#td_"+i+"9").text());//选择系统下拉框
						checkBoxChange(roles,userRoles);
						$("#setRoleModal").modal("show");
					});
					
				}else{
					if(!sysFlag){
						for (var j = 0; j < systems.length; j++) {
							$("#r_systems").append("<option value="+systems[j].id+">"+systems[j].name+"</option>");
						}
						sysFlag = true;
					}
					$("#r_systems").val($("#td_"+i+"9").text());//选择系统下拉框
					$("#r_systems").change();
					$("#setRoleModal").modal("show");
				}
				
				
			}
			 
		</script>

		<!--编辑用户信息模态框-->	
		<div class="modal fade" id="changeUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">
						  修改用户信息
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="changeUserForm">
								<div style="display:none;" class="form-group">
									<label for="input" class="col-lg-3 control-label">登录名</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Login_name" type="hidden" id="e_id">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">登录名</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Login_name" type="text" id="e_loginName">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">用户姓名</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Name" type="text" id="e_userName">
									</div>
								</div>
								
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">用户描述</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="Description" type="text" id="e_userDesc">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否可用</label>
									<div class="col-lg-7">
										<select class="form-control" id="e_enabled">
											<option value="0">不可用</option>
											<option value="1">可用</option>						
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否超级用户</label>
									<div class="col-lg-7">
										<select class="form-control" id="e_issys">
											<option value="0">普通用户</option>
											<option value="1">超级用户</option>						
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所在单位</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="Company" type="text" id="e_userDept"> 
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">职位</label>
									<div class="col-lg-7">
										<select class="form-control" id="e_userDuty">
											<option value="0">经理</option>
											<option value="1">主管</option>						
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">邮件</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="Email" type="text" id="e_email">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">手机号码</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="Phone" type="text" id="e_mobile">
									</div>
								</div>
						</form>	
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="confirmSetting()" data-dismiss="modal">确认设置</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--编辑用户信息模态框-->	
<script type="text/javascript">

	//编辑按钮单击事件
	function showchangeUserModal(i){
		var loginName = $("#td_"+i+"0").text();
		var userName = $("#td_"+i+"1").text();
		var userDesc = $("#td_"+i+"2").text();
		var enabled = $("#td_"+i+"3").text()=="可用"?1:0;
		var issys = $("#td_"+i+"4").text()=="普通用户"?0:1;
		var userDept = $("#td_"+i+"5").text();
		var userDutyId = $("#td_"+i+"6").text()=='主管'?1:0;
		var email = $("#td_"+i+"7").text();
		var mobile = $("#td_"+i+"8").text();
		var id = $("#td_"+i+"10").text();
		
		//加载修改模态框
		$("#e_id").val(id);
		$("#e_loginName").val(loginName);
		$("#e_userName").val(userName);
		$("#e_userDesc").val(userDesc);
		$("#e_enabled").val(enabled);
		$("#e_issys").val(issys);
		$("#e_userDept").val(userDept);
		$("#e_userDuty").val(userDutyId);
		$("#e_email").val(email);
		$("#e_mobile").val(mobile);
		
		$("#changeUserModal").modal("show");
	}
	
	//编辑按钮单击事件
	function confirmSetting(){
		var id = $("#e_id").val();
		var loginName = $("#e_loginName").val();
		var userName = $("#e_userName").val();
		var userDesc = $("#e_userDesc").val();
		var enabled = $("#e_enabled").val();
		var issys = $("#e_issys").val();
		var userDept = $("#e_userDept").val();
		var userDuty = $("#e_userDuty").find("option:selected").text();
		var email = $("#e_email").val();
		var mobile = $("#e_mobile").val();
		
		var url = "<%=basePath %>user/update";
		var user = new EditUser(id,loginName,userName,userDesc,enabled,issys,userDept,userDuty,email,mobile,index);
		var param = {"user":user};
		
		$.post(url,user,function(data){
			var json = $.parseJSON(data);
			var result = json.result;
			if(result="SUCCESS"){
				//加载表格
				var users = json.users;
				loadTable(users);
				showMsg("修改成功");
				$("#addUserModal").modal("hide");
			}else{
				showMsg("修改失败");
			}
		});
	}
	
	 //删除操作
	function deleteUser(id){
		
		var r=confirm("确定要删除吗？");
		if (r){
	 		var url = "<%=basePath %>user/del/"+id;
		  	$.post(url,function(data){
		  		var json = $.parseJSON(data);
				if(json.result=="SUCCESS"){
					//加载表格
					var users = json.users;
					loadTable(users);
					showMsg("删除成功");
					$("#addUserModal").modal("hide");
				}else{
					showMsg("删除失败");
				}
		  	});
		}	
	}
 	
	//验证邮箱格式
	function isEmail(email){
		var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
		return reg.test(email);
	}
	
	//验证手机号格式
	function isMobile(mobile){
		var reg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
		return reg.test(mobile);
	} 
	
	//显示提示信息
	function showMsg(msg){
		$("#msg").removeClass('prompt_2');
		$("#msg").addClass('prompt_1');
		$("#msg").html(msg);
		$("#msg").css("display","block");
		$("#msg").fadeOut(6000);
	}

</script>

<!-- 提示框 -->
<div id="msg" class="prompt" style="z-index:99999"></div>

</body>
</html>
