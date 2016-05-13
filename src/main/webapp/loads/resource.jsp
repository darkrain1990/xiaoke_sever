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
<title>资源管理</title>
<script src="../js/jquery-1.8.0.js"></script>
<script src="../js/jquery.ztree.core.js"></script>
<script src="../js/jquery.ztree.excheck.js"></script>
<script src="../js/bootstrap.min.js"></script>	
<script src="../js/easypiechart.js"></script>
<script src="../js/easypiechart-data.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/daohang.js"></script> 

<script src="<%=basePath %>js/jqPaginator.js"></script>


<script src="../js/jqPaginator.js"></script>

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/datepicker3.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
</head>

<body>
<div>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="width: 100%; height: 20px">
	<jsp:include page="top.jsp"></jsp:include>
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<jsp:include page="left.jsp"></jsp:include>
</div>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row" id="yhcx">
		<ol class="breadcrumb">
			<li><a href="../loads/user.jsp"><span class="glyphicon glyphicon-home"></span></a> &nbsp/&nbsp <a href="../loads/user.jsp">权限管理</a> &nbsp/&nbsp <a href="../loads/resource.jsp" class="resource">资源管理</a></li>
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
								<select class="form-control" id="systemId" >
									<!-- <option name="a">运维平台</option>  -->
								
								</select>
							</div>
						</div>
<script type="text/javascript">
			var sysFlag = false;//公共变量
			$(function(){
				sysShow(1);
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
						<div class="col-lg-2 col-sm-3 col-md-3">
							<div class="form-group">
								<label>资源名称</label>
								<input type="text" class="form-control" placeholder="resourceName" id="resourceName">
							</div>
						</div>
						<div class="row" style="margin-top:24px">
							<div class="col-lg-2 col-sm-2 col-md-2">
								<button type="submit" class="btn btn-primary" onclick="showResource()">查询资源</button>
							</div>
							<div class="col-lg-2 col-lg-pull-1 col-sm-2 col-md-2">
								<button class="btn btn-primary" id="addResource">新增资源</button>
							</div>
							<div class="col-lg-2 col-lg-pull-2 col-sm-2 col-md-2">
								<button class="btn btn-primary" id="allResource" onclick="allResource()">资源预览</button>
							</div>
						</div>
					</div>
					
					<div class="row" style="margin-top:20px">
                        <div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered" id="resourceTable">
									<input type="hidden" value="" />
									<thead>
									<tr class="active">
										<td>资源名称</td>
										<td>所属系统</td>
										<td>资源类型</td>
										<td>资源位置</td>
										<td>是否可用</td>
										<td>是否超级资源</td>				
										<td>是否有子节点</td>
										<td>操作</td>
									</tr>
									</thead>
									<tbody id="tbody">
									<!-- <tr style="display:none" name="tbody">
										
										<td>
											<button class="btn btn-sm btn-warning" onclick="showchangeResourceModal()">编辑</button>
											<button class="btn btn-sm btn-danger" onclick="deleteResource()">删除</button>
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
					function showResource(){
						show(1);
					}
					function show(index){
						var url = "<%=basePath %>resource/searchResource";
						var param={
								'index':index,
								'pageSize':5,
								'systemId':$("#systemId").val(),
								'resourceName':$("#resourceName").val()
								};
						$.get(url,param,function(data){
							var json = $.parseJSON(data);
							//加载列表
							var resources=json.resources;
							
// 							alert(data);
							//清空列表
							$("#tbody tr").remove();
							$("#tbody td").remove();
							
							$.each(resources,function(i,value){
// 								alert(value.resourceName);
								$("#tbody").append("<tr>"
										+"<td>"+value.resourceName+"</td>"
										+"<td>"+value.sysName+"</td>"
										+"<td>"+value.resourceType+"</td>"
										+"<td>"+value.resourceString+"</td>"
										+"<td>"+value.enable+"</td>"
										+"<td>"+value.issys+"</td>"
										+"<td>"+value.isChild+"</td>"
										+"<td>"
										+"<button class='btn btn-sm btn-warning' onclick='showchangeResourceModal(\""+value.id+"\,"+value.resourceName+"\,"+value.sysName+"\,"+value.resourceDesc+"\,"+value.enable+"\,"+value.issys+"\")'>编辑</button>"
										+"<button class='btn btn-sm btn-danger' onclick='deleteResource(\""+value.id+"\")'>删除</button>"
										+"</td>"
										+"</tr>");
								
							});
							
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



		<!--创建资源模态框-->
		<div class="modal fade" id="addResourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
						  请填写以下信息
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="addResourceForm">
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">资源名称</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="resourceName" type="text" name="resourceName" >
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所属系统</label>
									<div class="col-lg-7">
										<select class="form-control" id="AddsystemId">
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
																				
											$.each(systems,function(i,val){
												$("#AddsystemId").append("<option value='" + val.id + "'>" + val.name + "</option>")
											});
										}
									})
						</script>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">资源描述</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="resourceDesc" type="text" name="resourceDesc" >
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">资源类型</label>
									<div class="col-lg-7">
										<select class="form-control" name="resourceType" >
											<option>xx</option>
											<option>xx</option>						
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">资源位置</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="resourceString" type="text" name="resourceString" >
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">优先级</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="priority" type="text" name="priority" >
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否可用</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="enable" type="text" name="enable">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否超级资源</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="issys" type="text" name="issys" >
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">父节点</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="parentId" type="text" name="parentId" >
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">根节点</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="rootId" type="text" name="rootId" >
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">显示顺序</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="sortIndex" type="text" name="sortIndex">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">图片地址</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="imgageUrl" type="text" name="imgageUrl">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否有子节点</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="isChild" type="text" name="isChild">
									</div>
								</div>
							</form>	
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="addResourceModalBtn">确认创建</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--创建资源模态框-->


		


		<!--修改权限模态框-->
		<div class="modal fade" id="changeResourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  style="margin-top:100px">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
						  修改权限信息
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="changeResourceForm">
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">资源名称</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="resourceName" type="text" name="resourceName" id="re">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所属系统</label>
									<div class="col-lg-7">
										<select class="form-control" name="systemId" id="mo">
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
																				
											$.each(systems,function(i,val){
												$("#mo").append("<option value='" + val.id + "'>" + val.name + "</option>")
											});
										}
								})
							</script>

								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">资源描述</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="resourceDesc" type="text" name="resourceDesc" id="de">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否可用</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="enable" type="text" name="enable" id="en">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否超级资源</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="issys" type="text" name="issys" id="is">
									</div>
								</div>
							</form>	
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="changeResourceBtn" data-dismiss="modal">确定修改</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--修改权限模态框-->
		<script type="text/javascript">
		//修改资源信息
		function showchangeResourceModal(value){
			var re=value.split(",");
			//alert(re[1]);
			//资源名称
			$("#re").val(re[1]);
			//所属系统
			var i;
			var options = $("#showchangeResourceModal select[name='systemId'] option");
// 			alert(options);
			for (i = 0; i < options.length; i++) {
				if(options.eq(i).val()==re[2]){
					$("#showchangeResourceModal select[name='systemId']").children('option').eq(i).attr("selected", true);
				}
			}
			//资源描述
			$("#de").val(re[3]);
			//是否可用
			$("#en").val(re[4]);
			//是否是超级资源
			$("#is").val(re[5]);
			
			$("#changeResourceModal").modal("show");
			
			$("#changeResourceBtn").click(function(){
				var url="<%=basePath %>resource/update";
// 				alert($("#en").val());
				
				var param={
						'id':re[0],
						'resourceName':$("#re").val(),
						'systemId':$("#mo").val(),
						'resourceDesc':$("#de").val(),
						'enable':$("#en").val(),
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

		<!--展示所有资源模态框-->
		<div class="modal fade" id="allResourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:100px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
						  资源显示
						</h4>
					</div>
					<div class="modal-body">
						<div class="ztree-div" style="width:500px;height:400px">
							<ul id="treeDemo" class="ztree"></ul>
						</div>				
					</div>
				</div><!-- /.modal-content -->
			</div>
		</div><!--展示所有资源模态框-->

<script type="text/javascript">

$("#allResource").click(function(){
	$("#allResourceModal").modal("show");
	
});
var setting = {
		view: {
			selectedMulti: false
		},
		check: {
			enable: true,
			chkDisabledInherit: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

// 		var zNodes =[
// 			{ id:1, pId:0, name:"内容管理"},
// 			{ id:2, pId:0, name:"账户管理"},		
// 			{ id:3, pId:0, name:"后台人员管理"},
// 			{ id:4, pId:0, name:"个人信息管理"}
			
// 		];

		function disabledNode(e) {
// 			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			disabled = e.data.disabled,
			nodes = zTree.getSelectedNodes(),
			inheritParent = false, inheritChildren = false;
			if (nodes.length == 0) {
				alert("请先选择一个节点");
			}
			if (disabled) {
				inheritParent = $("#py").attr("checked");
				inheritChildren = $("#sy").attr("checked");
			} else {
				inheritParent = $("#pn").attr("checked");
				inheritChildren = $("#sn").attr("checked");
			}

			for (var i=0, l=nodes.length; i<l; i++) {
				zTree.setChkDisabled(nodes[i], disabled, inheritParent, inheritChildren);
			}
		}
function allResource(){
	var param=$("#systemId").val();
// 	alert(param);
	var url = "<%=basePath %>resource/see/"+param;
	
// 	alert(url)
	$.get(url,function(data){
// 		alert(data);
		if(data!=null){
			var json=$.parseJSON(data);
			var nodes=json.nodes;
			var zNodes=nodes;
			var o=eval(zNodes);
			$.fn.zTree.init($("#treeDemo"), setting, o);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		}
	})

	
}

$(document).ready(function(){
	//$.fn.zTree.init($("#treeDemo"), setting, zNodes); 
	$("#disabledTrue").bind("click", {disabled: true}, disabledNode);
	$("#disabledFalse").bind("click", {disabled: false}, disabledNode);
	
	
	$("#addResource").click(function(){
		$("#addResourceModal").modal("show");
	});
	//用来存放所有角色的信息
	var resources = [];
	function Resource(resource_name,system,resource_type,resource_location,available,superResource,child_node){
		this.resource_name=resource_name;
		this.system=system;
		this.resource_type=resource_type;
		this.resource_location=resource_location;
		this.available=available;
		this.superResource=superResource;
		this.child_node=child_node;
	}

	$("#addResourceModalBtn").on("click",function(event){
		//将角色信息保存到数组中

		var resourceName = $("#addResourceForm input[name='resourceName']").val();	
		var systemId = $("#AddsystemId").val();
		var resourceDesc = $("#addResourceForm input[name='resourceDesc']").val();
		var resourceType = $("#addResourceForm select[name='resourceType']").val();
		var resourceString = $("#addResourceForm input[name='resourceString']").val();
		var enabled = $("#addResourceForm input[name='enabled']").val();
		var issys = $("#addResourceForm input[name='issys']").val();
		var isChild = $("#addResourceForm input[name='isChild']").val();
		
// 		alert($("#module").val());
		var param={
				'resourceName':$("#addResourceForm input[name='resourceName']").val(),
				'systemId':$("#AddsystemId").val(),
				'resourceDesc':$("#addResourceForm input[name='resourceDesc']").val(),
				'resourceType':$("#addResourceForm select[name='resourceType']").val(),
				'resourceString':$("#addResourceForm input[name='resourceString']").val(),
				'priority':$("#addResourceForm input[name='priority']").val(),
				'enable':$("#addResourceForm input[name='enable']").val(),
				'issys':$("#addResourceForm input[name='issys']").val(),
				'parentId':$("#addResourceForm input[name='parentId']").val(),
				 'rootId':$("#addResourceForm input[name='rootId']").val(),
				'sortIndex':$("#addResourceForm input[name='sortIndex']").val(),
				'imgageUrl':$("#addResourceForm input[name='imgageUrl']").val(),
				'isChild':$("#addResourceForm input[name='isChild']").val()
				};


		var resource = new Resource(resourceName,systemId,resourceDesc,resourceType,resourceString,enabled,issys,isChild);

		resources.push(resource);
		//将新添加的角色信息追加到table中
		
		var url = "<%=basePath %>resource/add";
		$.get(url,param,function(data){
			show(1);
		});
		
		var newTr= $("#resourceTable tbody tr:eq(0)").clone();
		newTr.css("display","table-row");
		//将值加入到新tr中
		

		newTr.find("td:eq(0)").html(resourceName);
		$("input:hidden").val(resourceName);
		newTr.find("td:eq(1)").html(systemId);	
		$("input:hidden").val(systemId);
		newTr.find("td:eq(2)").html(resourceDesc);
		newTr.find("td:eq(3)").html(resourceType);		
		newTr.find("td:eq(4)").html(resourceString);		
		newTr.find("td:eq(5)").html(enabled);		
		newTr.find("td:eq(6)").html(issys);
		newTr.find("td:eq(7)").html(isChild);		
		

		//清空
		$("#addResourceModal").find(":text").val("");
		$("#addResourceModal select[name='systemId']").val("");
		$("#addResourceModal select[name='resourceType']").val("");
		//追加
		$("#resourceTable").append(newTr); 
		event.preventDefault();
		$("#addResourceModal").modal("hide");
	});
	
	
	
})


 //删除操作
function deleteResource(id){
// 	 alert(id);
	var url = "<%=basePath %>resource/dele/"+id;
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
