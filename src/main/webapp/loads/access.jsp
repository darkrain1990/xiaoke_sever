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
<title>权限管理</title>
<script src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath %>js/jquery.ztree.core.js"></script>
<script src="<%=basePath %>js/jquery.ztree.excheck.js"></script>
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
<script type="text/javascript">

function sys(){
	var url = "<%=basePath %>sys/show";
	//js调用ajax方法
	$.ajax({
		type:"post",
		url:url,
		dataType:"text",
		success:function(data){			
		//将所有系统放入下拉列表框中
			var st = $.parseJSON(data);
			var syss = st.systems;
			$("#s").append("<option value=''></option>");
			$.each(syss,function(j,va){
				$("#s").append("<option value='"+va.id+"'>"+va.name+"</option>");
			});	
			$.each(syss,function(j,va){
				$("#ss").append("<option value='"+va.id+"'>"+va.name+"</option>");
			});
			$.each(syss,function(j,va){
				$("#sss").append("<option value='"+va.id+"'>"+va.name+"</option>");
			});
		}
	});
}

$(function(){
	sys();
})

</script>
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
			<li><a href="../loads/user.jsp"><span class="glyphicon glyphicon-home"></span></a> &nbsp/&nbsp <a href="../loads/user.jsp">权限管理</a> &nbsp/&nbsp <a href="../loads/access.jsp" class="access">权限管理</a></li>
			</ol>
	</div><!--/.row-->
		
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default" style="margin-top:20px;">
				<div class="panel-body">
                   	<div class="row">
						<div class="col-lg-2 col-sm-4 col-md-4">
							<div class="form-group" id="select">
								<label>所属系统</label>
								<select class="form-control" name="a" id="s">
								</select>
							</div>
						</div>
						<div class="col-lg-3 col-sm-3 col-md-4">
							<div class="form-group">
								<label>权限名称</label>
								<input type="text" class="form-control" placeholder="Search" id="findAccessInput">
							</div>
						</div>
						<div class="row" style="margin-top:24px">
							<div class="col-lg-2 col-sm-2 col-md-2">
								<button type="submit" class="btn btn-primary" onclick="showAccess()">查询权限</button>
							</div>
							<div class="col-lg-2 col-lg-pull-1 col-sm-2 col-md-2">
								<button class="btn btn-primary" id="addAccess">新增权限</button>
							</div>
						</div>
					</div>
						
					<div class="row" style="margin-top:20px">
                        <div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered" id="accessTable">
									<thead>
									<tr class="active">
										<td>权限名称</td>
										<td>所属系统</td>
										<td>权限描述</td>
										<td>是否可用</td>
										<td>是否超级权限</td>
										<td>资源</td>
										<td>操作</td>
									</tr>
									</thead>
									<tbody id="t_attr_body">
									</tbody>
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
</div>


<script type="text/javascript">	
	/*分页*/
	$.jqPaginator('#pagination2', {
	    totalPages: 1,//设置分页的总页数
	    visiblePages: 6,//设置最多显示的页码数
	    currentPage: 1,//设置当前激活的页码
	    prev: '<li class="prev"><a href="javascript:;">Previous</a></li>',
	    next: '<li class="next"><a href="javascript:;">Next</a></li>',
	    page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
	    onPageChange: function (num, type) {
	       show(num);
	    }
	});

		//单击事件
		function showAccess(){
			show(1);
		}
		//显示用户
		function show(i){
			var url = "<%=basePath %>sys_authorities/findAccessByInput";
			var sys = $("#select select[name='a']").val();
			if(sys == null || sys == ""){
				sys = 0;
			}
		 	var param = {
						'index':i,
						'pageSize':5,
						'value':$("#findAccessInput").val(),
						'sys':sys,
						}; 
			$.get(url,param,function(data){
				if(data.result == "NOT FOUND"){
					$("#msg").html(data.result);
					$("#msg").removeClass('prompt_2');
					$("#msg").addClass('prompt_1');
					$("#msg").css("display","block");
					$("#msg").fadeOut(3000);
				}
				//清空表格
				$("#t_attr_body > tr").remove();
				//加载表格
				var users = data.users;
				$.each(users,function(i,value){
					var enabled = null;
					var issys = null;
					if(value.enabled == "1"){
						enabled = "可用";
					}else if(value.enabled == "0"){
						enabled = "禁用";
					}
					if(value.issys == "1"){
						issys = "超级权限";
					}else if(value.issys == "0"){
						issys = "普通权限";
					}
					$("#t_attr_body").append("<tr>"
									+"<td>"+value.authority_name+"</td>"
									+"<td>"+value.systemId+"</td>"
									+"<td>"+value.authority_desc+"</td>"
									+"<td>"+enabled+"</td>"
									+"<td>"+issys+"</td>"
									+"<td></td>"
									+"<td>"
									+"<button class='btn btn-sm btn-success' onclick='showsetResourceModal("+value.system_id+","+value.id+")'>设置资源</button> "
									+"<button class='btn btn-sm btn-warning' onclick='showchangeAccessModal(\""+value.id+"\,"+value.authority_name+"\,"+value.systemId+"\,"+value.authority_desc+"\,"+enabled+"\,"+issys+"\")'>编辑</button> "
									+"<button class='btn btn-sm btn-danger' onclick='deleteAccess(\""+value.id+"\")'>删除</button> "
									+"</td>"
									+"</tr>");
				});
				//加载分页条
				$("#pagination2").jqPaginator('option',{
					currentPage : (data.index==0?1:data.index),
					totalPages : data.pageTotal
				});
			});
		}
</script>

		<!--创建用户模态框-->
		<div class="modal fade" id="addAccessModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  style="margin-top:100px">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
						  请填写以下信息
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="addAccessForm">
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">权限名称</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Access_name" type="text" name="access_name">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所属系统</label>
									<div class="col-lg-7">
										<select class="form-control" name="system" id="ss" placeholder="请选择">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">权限描述</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Description" type="text" name="description">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否可用</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="是/否" type="text" name="available">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否超级权限</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="是/否" type="text" name="superAccess">
									</div>
								</div>
							</form>	
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="addAccessModalBtn" data-dismiss="modal">确认创建</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--创建权限模态框-->


		<!--设置资源模态框-->	
		<div class="modal fade" id="setResourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:100px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">
						  设置资源
						</h4>
					</div>

					<div class="modal-body">
						<div class="ztree-div" style="margin:20px 0 0 130px;">
							<ul id="treeDemo" class="ztree"></ul>
						</div>				
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="setResourceBtn">确认设置</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--设置资源模态框-->


		<!--修改权限模态框-->
		<div class="modal fade" id="changeAccessModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  style="margin-top:100px">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
						  修改权限信息
						</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" role="form" id="changeAccessForm">			
								<input type="hidden" id="sysid"/>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">权限名称</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Access_name" id="an" type="text" name="access_name"/>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">所属系统</label>
									<div class="col-lg-7">
										<select class="form-control" name="system" id="sss" placeholder="请选择">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">权限描述</label>
									<div class="col-lg-7">
										<input class="form-control" placeholder="Description" id="dp" type="text" name="description">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否可用</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="" id="en" type="text" name="available">
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-lg-3 control-label">是否超级权限</label>
									<div class="col-lg-7">
										<input class="form-control"  placeholder="" id="iss" type="text" name="superAccess">
									</div>
								</div>
							</form>	
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="changeAccessBtn">确定修改</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" id="changeAccessBtn2">取消</button>
					</div>

				</div><!-- /.modal-content -->
			</div>
		</div><!--修改权限模态框-->


<script type="text/javascript">

var setting = {
			view: {
				selectedMulti: true,
			},check: {
				enable: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "p", "N": "s" },
				autoChecTrigger:true,
				chkDisabledInherit: true,
				chkDisabled:true,
				enable:true,
				redioType:"all"
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

/*		function disabledNode(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			disabled = e.data.disabled,
			nodes = zTree.getSelectedNodes(),
			inheritParent = false, inheritChildren = false;
			if (nodes.length == 0) {
				alert("请先选择一个节点");
				alert("function 中 被选中的节点的值："+nodes);
			}
			alert("function 中 被选中的节点的值："+nodes);
			if (disabled) {
				alert("function 中 被选中的节点的值："+nodes);
				inheritParent = $("#py").attr("checked");
				inheritChildren = $("#sy").attr("checked");
			} else {
				alert("function 中 被选中的节点的值："+nodes);
				inheritParent = $("#pn").attr("checked");
				inheritChildren = $("#sn").attr("checked");
			}

			for (var i=0, l=nodes.length; i<l; i++) {
				zTree.setChkDisabled(nodes[i], disabled, inheritParent, inheritChildren);
			}
		}
*/
		//设置资源
		function showsetResourceModal(obj1,obj2){
			//系统
			var url = "../sys_authorities/searchResource";
			var param = {"systemId":obj1,"authorityId":obj2};
			$.ajax({
				type:"post",
				url:url,
				data:param,
				dataType:"json",
				success:function(data){
					if(data!=null){
						var zNodes = data;
						var o= eval(zNodes);
						$.fn.zTree.init($("#treeDemo"), setting, o);
						var zTree = $.fn.zTree.getZTreeObj("treeDemo");
						alert("所有的节点："+zTree.getNodes());
						
						//查本系统下的所有资源
						$("#setResourceModal").modal("show");
						//确认设置
						
						//alert("nodes:"+nodes);
						$("#setResourceBtn").click(function(){
							//var nos = zTree.getSelectedNodes();
							var chNodes = zTree.getCheckedNodes(true);
							var chNode = eval(chNodes);
							
							alert("选中的节点："+zTree.getCheckedNodes(true));
							alert("选中的节点："+chNode);
						});
						//获取当前被选中节点的父节点
						/* $(".node_name").each(function(){
							$(this).click(function(){
								alert("当前节点的值是--->"+$(this).html());
								alert($(this).parent('a').html());
								alert(parent);
							//	alert($(this).parent().html());
							});
						}); */
					}else{
						alert("返回失败....");
					}
				},
				error:function(data){
					alert("出错了....");
					//$("#setResourceModal").modal("show");
				}
			});
			//查本系统下的所有资源
			//$("#setResourceModal").modal("show");
		}
		/* function doClick(obj){
			alert("复选框中点击的对象是----->"+obj);
		} */
$(document).ready(function(){
	//$.fn.zTree.init($("#treeDemo"), setting, zNodes); 
	//$("#disabledTrue").bind("click", {disabled: true}, disabledNode);
	//$("#disabledFalse").bind("click", {disabled: false}, disabledNode); 


	$("#addAccess").click(function(){
		$("#addAccessModal").modal("show");
		
	});

	//用来存放所有角色的信息
	var accesses = [];
	function Access(access_name,system,description,available,superAccess){
		this.access_name=access_name;
		this.system=system;
		this.description=description;
		this.available=available;
		this.superAccess=superAccess;
	}

	//新增权限
	$("#addAccessModalBtn").on("click",function(event){
		//将角色信息保存到数组中
		var access_name = $("#addAccessForm input[name='access_name']").val();	
		var system = $("#addAccessForm select[name='system']").val();
		var description = $("#addAccessForm input[name='description']").val();
		var available = $("#addAccessForm input[name='available']").val();
		var superAccess = $("#addAccessForm input[name='superAccess']").val();
		
		if(access_name==""||access_name==null){
			alert("请正确填写权限名称");	
			
		}else{
			if(system == "" || system == null){
				alert("请选择所属系统");
			}else{
				if((available==""||available==null||available=="是"||available=="否")
						&&(superAccess==""||superAccess==null||superAccess=="是"||superAccess=="否")){
					var url = "<%=basePath %>sys_authorities/addAuthority";
				 	var param = {
									"authName":access_name,
									"sys":system,
									"authDesc":description,
									"enabled":available,
									"superAuth":superAccess
								}; 
					//js调用ajax方法
					$.ajax({
						type:"post",
						url:url,
						data:param,
						dataType:"text",
						success:function(data){
							$("#addAccessModal").modal("hide");
							//清空弹框中内容
	 						$("#addAccessModal").find(":text").val("");
	 	 					$("#addAccessModal select[name='system']").val("");
	 						if(data == 'SUCCESS'){
	 							$("#msg").html("数据保存成功!");
	 						}else{
	 							$("#msg").html(data);
	 							$("#msg").removeClass('prompt_2');
	 							$("#msg").addClass('prompt_1');
	 						}
	 						$("#msg").css("display","block");
	 						$("#msg").fadeOut(8000);
	 						show(1);
						}
					}); 
				}else{
					alert("是/否");
				}
			}
		}
	});

})
/*//设置资源
	$(".btn-success").each(function(){
		$(this).click(function(){
			alert("she zhi zi yuan ....");
			var authority_name = $(this).parent().child('td').eq(0);
			var systemId = $(this).parent().child('td').eq(1);
			alert("authority_name:"+authority_name+ "    ,systemId："+systemId);
		});
	});*/

 
//设置资源
function showsetResourceModal(obj){
	alert("点解设置资源--->"+obj);
	/* var strs = eval(obj);
	alert("strs.length:"+strs.length());
	for(var i=0;i<strs.length();i++){
		alert("第"+i+"位是："+strs[i]);
	} */
	//alert("obj de parent :"+obj.parent());
	var sa = this.val();
	alert("this.val():"+sa);
	
	var url = "../sys_authorities/searchResource";
	var param = {"systemId":obj};
	/* $.ajax({
		type:"post",
		url:url,
		data:param,
		//dataType:"text",
		dataType:"json",
		success:function(data){
			if(data!=null){
				alert("成功返回....");
				var zNodes = data;
				alert("zNodes:"+zNodes);
				var o= eval(zNodes);
				alert("obj："+o);
				$.fn.zTree.init($("#treeDemo"), setting, o);
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				//查本系统下的所有资源
				$("#setResourceModal").modal("show");
			}else{
				alert("返回失败....");
			}
			
		},
		error:function(data){
			alert("出错了....");
			//$("#setResourceModal").modal("show");
		}
	});   */
	//查本系统下的所有资源
	//$("#setResourceModal").modal("show");
}

//修改权限信息
function showchangeAccessModal(value){
	//给模态框赋值
	var v = value.split(",");
	//id
	$("#sysid").val(v[0]);
	//权限名称
	$("#an").val(v[1]);
	//所属系统
	var i;
	var options = $("#changeAccessForm select[name='system'] option");

	for (i = 0; i < options.length; i++) {
		if(options.eq(i).html()==v[2]){
			var a=$("#sss option").eq(i).html();
			$("#changeAccessForm select[name='system'] option").eq(i).selected = true;
		}	
	}
	//权限描述
	$("#dp").val(v[3]);
	//是否可用
	$("#en").val(v[4]);
	//是否超级权限
	$("#iss").val(v[5]);
	
	$("#changeAccessModal").modal("show");
}

$("#changeAccessBtn").click(function(){
	
	var name = $("#an").val();
	var desc = $("#dp").val();
	var mou = $("#changeAccessForm select[name='system']").val();
	var enab = $("#en").val();
	var iss = $("iss").val();
	
	if(name == null || name == ""){
		alert("请填写正确权限名称!");
	}else{
		if(mou == "" || mou == null){
			alert("请选择所属系统");
		}else{
			if((enab==""||enab==null||enab=="可用"||enab=="禁用")
					&&(iss==""||iss==iss||iss=="超级权限"||iss=="普通权限")){
				
				var r=confirm("确定要更新吗？");
				var url = "<%=basePath %>sys_authorities/updAuthority";
			 	var param = {
								"id":$("#sysid").val(),
								"sysname":name,
								"sysdesc":desc,
								"mou":mou,
								"enab":enab,
								"iss":iss
							}; 
				if (r==true)
				{
					//js调用ajax方法
					$.ajax({
						type:"post",
						url:url,
						data:param,
						dataType:"text",
						success:function(data){
							$("#changeAccessModal").modal("hide");
							if(data == 'SUCCESS'){
								$("#msg").html("成功更新该权限!");
							}else{
								$("#msg").html(data);
								$("#msg").removeClass('prompt_2');
								$("#msg").addClass('prompt_1');
							}
							$("#msg").css("display","block");
							$("#msg").fadeOut(10000);
							show(1);
						}
					});
				}
				
			}else{
				alert("请填写正确格式('可用/禁用'|'超级权限/普通权限')！");
			}
		}
	}
})

 //删除操作
function deleteAccess(id){
	var r=confirm("确定要删除吗？");
	var url = "<%=basePath %>sys_authorities/delAuthority";
 	var param = {
					"id":id
				}; 
	if (r==true)
	{
		//js调用ajax方法
		$.ajax({
			type:"post",
			url:url,
			data:param,
			dataType:"text",
			success:function(data){
				if(data == 'SUCCESS'){
					$("#msg").html("成功删除此权限!");
				}else{
					$("#msg").html(data);
					$("#msg").removeClass('prompt_2');
					$("#msg").addClass('prompt_1');
				}
				$("#msg").css("display","block");
				$("#msg").fadeOut(10000);
				show(1);
			}
		});
	}	
}

</script>
	<!-- 消息提示框 -->
	<div id="msg" class="prompt_2" style="z-index:99999">
	</div>
</body>
</html>
