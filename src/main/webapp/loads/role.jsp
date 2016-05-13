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
<title>角色管理</title>
<script src="../js/jquery-1.8.0.js"></script>
<script src="../js/jquery.ztree.core.js"></script>
<script src="../js/jquery.ztree.excheck.js"></script>
<script src="../js/bootstrap.min.js"></script>	
<script src="../js/easypiechart.js"></script>
<script src="../js/easypiechart-data.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="<%=basePath %>js/jqPaginator.js"></script>

<script src="../js/daohang.js"></script> 
<script src="../js/jqPaginator.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/datepicker3.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">

	
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
			<li><a href="../loads/user.jsp"><span class="glyphicon glyphicon-home"></span></a> &nbsp/&nbsp <a href="../loads/user.jsp">权限管理</a> &nbsp/&nbsp <a href="../loads/role.jsp" class="role">角色管理</a></li>
			</ol>
	</div><!--/.row-->
		
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default" style="margin-top:20px;">
				<div class="panel-body">
                   	<div class="row">
						<div class="col-lg-2 col-sm-3 col-md-3">
							<div class="form-group">
								<label>所属系统</label>

								<select class="form-control" id="systemId">
<!-- 									<option name="a">运维平台</option> -->
								</select>
							</div>
						</div>
	<script type="text/javascript">
	
		var sysFlag = false;//公共变量
		$(function(){
			sysShow();
		});
	function sysShow(){
		
		var url = "<%=basePath %>sys/show";
		
		$.ajax({
			type:"get",
			url:url,
			dataType:"text",
			success:function(data){
				var json = $.parseJSON(data);
				
				var systems=json.systems;
				
//  				$("#systemId").append("<option value='0'></option>")
				
				$.each(systems,function(i,val){
					$("#systemId").append("<option value='" + val.id + "'>" + val.name + "</option>")
				});
				if(systems!=null){
					sysFlag =true;
				}
				
				if(sysFlag){
					show(1);
				}
			}
		})
	}
		
			
		
	</script>
						<div class="col-lg-3 col-sm-3 col-md-3">
							<div class="form-group">

								<label>用户角色</label>
								<input type="text" class="form-control" placeholder="角色名称" id="roleName">

							</div>
						</div>
						<div class="row" style="margin-top:24px">
							<div class="col-lg-2 col-sm-2 col-md-2">
								<button type="submit" class="btn btn-primary" onclick="showRole()">查询角色</button>
							</div>
							<div class="col-lg-2 col-lg-pull-1 col-sm-2 col-md-2">
								<button class="btn btn-primary" id="addRole">新增角色</button>
							</div>
						</div>
					</div>
						
					<div class="row" style="margin-top:20px">
                        <div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered" id="roleTable">
									<input type="hidden" value="" id="input"/>
									<thead>
									<tr class="active">
										<td>角色名</td>
										<td>所属系统</td>
										<td>是否可用</td>
										<td>是否超级角色</td>
										<td>权限</td>
										<td>操作</td>
									</tr>
									</thead>
									<tbody id="tbody">
									<!-- <tr style="display:none">
										
										<td>
											<button class="btn btn-sm btn-success"  onclick="showsetAccessModal()">设置权限</button>
											<button class="btn btn-sm btn-warning"  onclick="showchangeRoleModal()">编辑</button>
											<button class="btn btn-sm btn-danger" onclick="deleteRole()">删除</button>
										</td>
									</tr> -->
									</tbody>
								</table>
							</div>
						</div>
					</div><!--table-->
					
					<!--分页-->
					<div class="pull-right" >
						<ul class="pagination" id="pagination2"></ul>
					</div>
					
				    <script type="text/javascript">
				    function showRole(){
						show(1);
					}
					//显示角色
					function show(index){
						var url = "<%=basePath %>role/searchRole";
						
						var param={
								'index':index,
								'pageSize':5,
								'systemId':$("#systemId").val(),
								'roleName':$.trim($("#roleName").val())
								};

						$.get(url,param,function(data){
							var json = $.parseJSON(data);
							//加载列表
							var roles=json.roles;

							//清空列表
							$("#tbody tr").remove();
							$("#tbody td").remove();
							
							if(roles != null){
							$.each(roles,function(i,value){
								$("#tbody").append("<tr>"
										+"<td>"+value.roleName+"</td>"
										+"<td>"+value.sysName+"</td>"
										+"<td>"+value.enabled+"</td>"
										+"<td>"+value.issys+"</td>"
										+"<td></td>"
										+"<td>"
										+"<button class='btn btn-sm btn-success'  onclick='showsetAccessModal(\""+value.id+"\")'>设置权限</button>"
										+"<button class='btn btn-sm btn-warning'  onclick='showchangeRoleModal(\""+value.id+"\,"+value.roleName+"\,"+value.systemId+"\,"+value.roleDesc+"\,"+value.enabled+"\,"+value.issys+"\")'>编辑</button>"
										+"<button class='btn btn-sm btn-danger' onclick='deleteRole(\""+value.id+"\")'>删除</button>"
										+"</td>"
										+"</tr>");
							});
							}
							//加载分页条
							$("#pagination2").jqPaginator('option',{
								currentPage : json.index,
								totalPages : json.pageTotal
								
							});
						});
					};

					/*分页*/
					$.jqPaginator('#pagination2', {
				        totalPages: 1,//设置分页的总页数
				        visiblePages: 5,//设置最多显示的页码数
				        currentPage: 1,//设置当前激活的页码
				        prev: '<li class="prev"><a href="javascript:;">Previous</a></li>',
				        next: '<li class="next"><a href="javascript:;">Next</a></li>',
				        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
				        onPageChange: function (num, type) {
				        	if(sysFlag){
					        	show(num);
				        	}				      
				        }
				    });
					</script>

				</div>
			</div>
		</div>
	</div>
</div>



		<!--创建用户模态框-->
		<div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  style="margin-top:100px">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
						  请填写以下信息
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="addRoleForm">
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">角色名</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="roleName" type="text" name="roleName">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所属系统</label>
									<div class="col-lg-7">
										<select class="form-control" name="module" id="AddsystemId" placeholder="请选择">
<!-- 											<option>运维平台</option> -->
<!-- 											<option>客服中心</option>						 -->
										</select>
									</div>
								</div>
						<script type="text/javascript">
							var url = "<%=basePath %>sys/show";
							$.ajax({
								type:"get",
								url:url,
								dataType:"text",
								success:function(data){
									var json = $.parseJSON(data);
// 									alert(json);
									var systems=json.systems;
// 									$("#systemId").append("<option value='0'></option>")
									$.each(systems,function(i,val){
										$("#AddsystemId").append("<option value='" + val.id + "'>" + val.name + "</option>")
									});
									
								}
							})
									
						</script>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">角色描述</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="roleDesc" type="text" name="roleDesc">
									</div>
								</div>
								
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否可用</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="enabled" type="text" name="enabled">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否超级角色</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="issys" type="text" name="issys">
									</div>
								</div>
							</form>	
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="addRoleModalBtn">确认创建</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--创建用户模态框-->


		<!--设置权限模态框-->	
		<div class="modal fade" id="setAccessModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:100px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">
						  设置权限
						</h4>
					</div>

					<div class="modal-body">
						<div class="form-group">
							<label for="label" class="col-lg-2 col-sm-2 col-md-2 control-label" >所属系统 : </label>
							<div class="col-lg-4 col-sm-4 col-md-4" >
								<label class="form-control" id="systemlabel" style='border:0;font-size:15px;margin:-6px 0 0 -30px'></label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-6 col-lg-pull-2" id="divv">
<!-- 								<div class="col-lg-12"> -->
<!-- 									<input type="checkbox" value="高级管理员" id="high"> -->
<!-- 									<label for="high"> 内容管理 </label> -->
									
<!-- 								</div> -->
<!-- 								<div class="col-lg-12"> -->
<!-- 									<input type="checkbox" value="高级管理员" id="high"> -->
<!-- 									<label for="high"> 账户管理 </label> -->
<!-- 								</div> -->
<!-- 								<div class="col-lg-12"> -->
<!-- 									<input type="checkbox" value="高级管理员" id="high"> -->
<!-- 									<label for="high"> 后台人员管理 </label> -->
<!-- 								</div> -->
							</div>
						</div>				
					
			
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="setRoleBtn" data-dismiss="modal">确认设置</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div>
			</div>
		</div><!--设置权限模态框-->
<script type="text/javascript">
		
		var num=true;
		var roleid=0;//接收传递过来的roleid
		function showsetAccessModal(id){
			roleid=id;
			if(num){
				showset();
				$("#divv").html("");
				num=true;
			}
		}
		//设置权限
		function showset(){
			
			$("#setAccessModal").modal("show");
			var systemtab=$("#system").val();
			//将前面选择的系统值赋给设置权限框中的系统值
			$("#systemlabel").html(systemtab);
			
			var param=$("#systemId").val();
			var url = "<%=basePath %>role/show/"+param; 
			
			$.get(url,function(data){
				
				var json = $.parseJSON(data);
				var result=json.result;

				$.each(result,function(i,val){
					
					var url2="<%=basePath %>role/sel";
					
					var pare={
							'roleId':roleid,
							'authorityId':val.id
					}
					$.get(url2,pare,function(data){
						var json = $.parseJSON(data);
						var str=json.result;
						//alert(str);
						if(str){
// 							$("#addRoleForm input[name='roleName']")
							$("input[name='check"+i+"']").attr("checked",true);
						}
					})
					$("#divv").append("<div>"
							+"<input type='checkbox'  value='" + val.id + "' name='check"+i+"'  id=" + i + " >"
							+"</input>"
							+"<label for='" + val.id + "'>"+val.authority_name+"</label>"
							+"</div>");
				});
				
			});
			
			num=false;
			
			};
			  /* 需要角色id   权限id */
			$("#setRoleBtn").on("click",function(event){
				//alert(roleid);
				
				$("#high").val();
				
				$("input[type='checkbox']").prop("checked", function( i, val ) {
					if(val==true){
						
						var url="<%=basePath %>role/addordel"; 
						var param={
								'roleId':roleid,
								'authorityId':$("#"+i).val(),
								'flag':"add"
						}
						$.get(url,param,function(data){
							//alert(data);
						})
						
					}else{
						var url="<%=basePath %>role/addordel";
						var param={
								'roleId':roleid,
								'authorityId':$("#"+i).val(),
								'flag':"del"
						}
						$.get(url,param,function(data){
							
						})
					} 
				});
				
			})

</script>

		<!--修改角色模态框-->
		<div class="modal fade" id="changeRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  style="margin-top:100px">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
						  修改角色信息
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="changeRoleForm">
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">角色名</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="roleName" type="text" name="roleName" id="ro">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所属系统</label>
									<div class="col-lg-7">
										<select class="form-control" name="systemId"  placeholder="请选择" id="mo">
<!-- 											<option>运维平台</option> -->
<!-- 											<option>客服中心</option>						 -->
										</select>
									</div>
								</div>
					<script type="text/javascript">
								var url = "<%=basePath %>sys/show";
								$.ajax({
									type:"get",
									url:url,
									dataType:"text",
									success:function(data){
										var json = $.parseJSON(data);
										
										var systems=json.systems;
										
// 										alert(systems);
// 										$("#systemId").append("<option value='0'></option>")
										$.each(systems,function(i,val){
											$("#mo").append("<option value='" + val.id + "'>" + val.name + "</option>")
										});
										
									}
								})
						</script>
									<%--  --%>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">角色描述</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="roleDesc" type="text" name="roleDesc" id="de">
									</div>
								</div>
								
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否可用</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="enable" type="text" name="enable" id="en">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否超级角色</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="issys" type="text" name="issys" id="is">
									</div>
								</div>
							</form>	
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="changeRoleBtn" data-dismiss="modal">确定修改</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--修改角色模态框-->
		<script type="text/javascript">
		//修改角色信息
		function showchangeRoleModal(value){
			var re=value.split(",");
			
			//roleName
			$("#ro").val(re[1]);
			//所属系统
			var i;
			var options = $("#changeRoleForm select[name='systemId'] option");
			for (i = 0; i < options.length; i++) {
				if(options.eq(i).val()==re[2]){
					$("#changeRoleForm select[name='systemId']").children('option').eq(i).attr("selected", true);
				}
			}
			//roleDesc角色描述
			$("#de").val(re[3]);
			//enabled
			$("#en").val(re[4]);
			//issys
			$("#is").val(re[5]);
			
 			$("#changeRoleModal").modal("show");
 			
 			$("#changeRoleBtn").click(function(){
 				var url="<%=basePath %>role/update"; 
 				alert($("#ro").val());
 				var param={
 						'id':re[0],
 						'roleName':$("#ro").val(),
 						'systemId':$("#mo").val(),
 						'roleDesc':$("#de").val(),
 						'enabled':$("#en").val(),
 						'issys':$("#is").val()
 				}
 				$.get(url,param,function(data){
 					var json = $.parseJSON(data);
 					if(json.result=="SUCCESS"){
 						//加载表格
 						show(1);
 					}
 				});
 			});
			
		}
		
		</script>
   		
<script type="text/javascript">


$(document).ready(function(){

	
	$("#addRole").click(function(){
		$("#addRoleModal").modal('show');
	});
	//用来存放所有角色的信息
	var roles = [];
	function Role(roleName,roleDesc,systemId,enabled,issys){
		this.roleName=roleName;
		this.roleDesc=roleDesc;
		this.systemId=systemId;
		this.enabled=enabled;
		this.issys=issys;
	}
	$("#addRoleModalBtn").on("click",function(event){
		//将角色信息保存到数组中
		var roleName = $("#addRoleForm input[name='roleName']").val();
		var systemId = $("#AddsystemId").val();
		var roleDesc = $("#addRoleForm input[name='roleDesc']").val();
		var enabled = $("#addRoleForm input[name='enabled']").val();
		var issys = $("#addRoleForm input[name='issys']").val();
		
		var param={
				'roleName':$("#addRoleForm input[name='roleName']").val(),
				'roleDesc':$("#addRoleForm input[name='roleDesc']").val(),
				'systemId':$("#AddsystemId").val(),
				'enabled':$("#addRoleForm input[name='enabled']").val(),
				'issys':$("#addRoleForm input[name='issys']").val()
				};
		
		var role = new Role(roleName,systemId,roleDesc,enabled,issys);
		roles.push(role);
		
		var url = "<%=basePath %>role/add";
		$.get(url,param,function(data){
			show(1);
		});
		 
		
		//将新添加的角色信息追加到table中
		var newTr= $("#roleTable tbody tr:eq(0)").clone();
		newTr.css("display","table-row");
		//将值加入到新tr中
		
		newTr.find("td:eq(0)").html(roleName);
		$("input:hidden").val(roleName);
		newTr.find("td:eq(1)").html(systemId);	
		$("input:hidden").val(systemId);
		newTr.find("td:eq(2)").html(roleDesc);	
		newTr.find("td:eq(3)").html(enabled);		
		newTr.find("td:eq(4)").html(issys);		
		//清空
		$("#addRoleModal").find(":text").val("");
		$("#addRoleModal select[name='systemId']").val("");
		//追加
		$("#roleTable").append(newTr); 
		event.preventDefault();
		$("#addRoleModal").modal('hide');
	});

	
})

 //删除操作
function deleteRole(id){
	var url = "<%=basePath %>role/dele/"+id;
	$.get(url,function(data){
		var json = $.parseJSON(data);
		if(json.result=="SUCCESS"){
			//加载表格
			show(1);
		}
	});

}

</script>

</body>
</html>
