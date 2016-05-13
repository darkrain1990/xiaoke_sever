<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath();
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>       
    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动合并用户</title>
<script type="text/javascript" src="<%=basePath %>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.0.js"></script>
<script src="<%=basePath %>/js/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/easypiechart.js"></script>
<script src="<%=basePath %>/js/easypiechart-data.js"></script>
<script src="<%=basePath %>/js/bootstrap-table.js"></script>
<script src="<%=basePath %>/js/json2.js"></script>
<link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath %>/css/datepicker3.css" rel="stylesheet">
<link href="<%=basePath %>/css/styles.css" rel="stylesheet">
<script src="<%=basePath %>/js/daohang.js"></script>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="width: 100%; height: 20px">
		<jsp:include page="top.jsp"></jsp:include>
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<jsp:include page="left.jsp"></jsp:include>
	</div>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row" id="yhcx">
			<ol class="breadcrumb">
				<li>
					<a href="../loads/userSearch.jsp"><span
						class="glyphicon glyphicon-home"></span></a> &nbsp/&nbsp <a
					href="../loads/userSearch.jsp">IDM用户管理</a> &nbsp/&nbsp <a
					href="../loads/autoMerge.jsp" class="autoMerge">自动合并用户</a>
				</li> 
			</ol>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="margin-top: 20px;">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label>原车主俱乐部用户</label> 
									<input id="mobile" type="text" class="form-control" name="tel" maxlength="11">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>目标用户</label> 
									<input id="mergeMobile" type="text" class="form-control" name="tel" maxlength="11">
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<button type="submit"
										class="pull-left btn btn-primary search_btn"
										style="margin-top: 24px; margin-left:50px" >查询</button>
								</div>
								<script type="text/javascript">
									
									var $tel = /^1[3|4|5|7|8][0-9]{9}$/;
									//var $tel = /^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$/;
									function isMobile(){
										//用于电话号的检查
										var $obj = $('input[name*="tel"]').val();
										var $mMobile = $("#mergeMobile").val();
										if ($tel.test($obj) && $tel.test($mMobile)) {
											$(this).val($obj);
											return true;
										} else {
											$("#msg").html("请输入正确的11位手机号");
											$("#msg").removeClass('prompt_2');
											$("#msg").addClass('prompt_1');
											$("#msg").css("display","block");
											$("#msg").fadeOut(20000);
											return false;									
										}
									}
									//关闭弹出层
									function CloseDiv(){
										$("#bg_bottom").css("display","none");
									};
								
									var isSearch = false; //是否点击查询标识
									var params = null;
									//查询按钮点击事件
									$(".search_btn").click(function() {
										if(isMobile() && !isSearch){
											$("#bg_bottom").css("display","block");
											params = {'mobile':$("#mobile").val(),'mergeMobile':$("#mergeMobile").val(),'isAuto':true};
											isSearch = true;
											var vin = null;
											$.get('<%=basePath%>/searchuser/attr',params,function(data){
												var result = data.result;
												var name = null;
												var oValue = null;
												var mValue = null;
												if(result=='SUCCESS'){
													var attrs = data.attrs;
													var flag = false;
													var isGetVIN = true;
													var vin = null;
													//清空表格
													$("#t_attrs_body > tr").remove();
													$("#t_mattrs_body > tr").remove();
													//遍历attrs，加载表格
													$.each(attrs,function(i,n){
														name = n.cnName;
														oValue = n.originalValue;	//原用户Value
														mValue = n.objectiveValue;	//目标用户Value
														if(name==null||name=='')
															name = n.name;
														$("#t_attrs_body").append("<tr> <td>"+name+"</td> <td style='width:40%'><div style='width:400px;layout:fixed;word-wrap:break-word;'>"+oValue+"</div></td> <td style='width:40%'><div style='width:400px;layout:fixed;word-wrap:break-word;'>"+mValue+"</div></td> </tr>");
																										
													}); 
													//预览窗口表格加载
													var pAttrs = data.pAttrs;
													$.each(pAttrs,function(i,n){
														name = n.cnName;
														if(name==null||name=='')
															name = n.name;
														$("#t_mattrs_body").append("<tr> <td>"+name+"</td> <td><div style='width:400px;layout:fixed;word-wrap:break-word;'>"+n.value+"</div></td>");
													});
													
												}else{
													$("#msg").html(result);
													$("#msg").removeClass('prompt_2');
													$("#msg").addClass('prompt_1');
													$("#msg").css("display","block");
													$("#msg").fadeOut(20000);
												}
												CloseDiv();
												isSearch = false;
											});
										}
									
									});
									//获得合并后的memberInfo
									function getMergeMemberInfo(oldMemberInfo,newMemberInfo){
										var autoVhInfos = null;
										if(newMemberInfo!=null&&newMemberInfo.trim()!=''){
											autoVhInfos = JSON.parse(newMemberInfo);
											if(oldMemberInfo!=null&&oldMemberInfo.trim()!=''){
												oldMemberInfo = oldMemberInfo.substring(1,oldMemberInfo.length-1);
												autoVhInfos[autoVhInfos.length] = JSON.parse(oldMemberInfo);
											}
											
										}else{
											if(oldMemberInfo!=null&&oldMemberInfo.trim()!=''){
												autoVhInfos = JSON.parse(oldMemberInfo);
											}
										}
										return JSON.stringify(autoVhInfos);
										
									} 
									function onSubmit(){
										var old = $("#mobile").val();
										var nw = $("#mergeMobile").val();
										var i = 0;
										//校验同一手机号码不能合并
										if(old == nw){
											i = 1;
										}
										if(i == 1){
											alert("同一手机号码不能进行合并!");
										}else{
											//弹出模态框之前校验
											$('#t_attrs_body tr').each(function(){
												var name = $(this).children('td:eq(0)').html();
												var oValue = $(this).children('td:eq(1)').find('div').html();
												var nValue = $(this).children('td:eq(2)').find('div').html();
												if(name == "凯迪会员卡号" || name == "别客会员卡号" || name == "雪佛兰会员卡号"){
													if(oValue != "" && oValue != "undefined" && nValue != "undefined" && nValue != ""){
														i = 1;
													}
												}
											});
											if(i == 0){
												$('#myModal').modal('show');
											}else{
												alert("需要合并的号码为同品牌的会员，请与运维人员确认后合并!");
											}
										}
									}
							</script>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<button type="submit" class="btn btn-primary" onclick="onSubmit()"
										style="margin-top: 24px">自动合并</button>
							</div>							
						</div>
						</div>
						<div class="row" style="margin-top: 20px">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" >
										<tr class="active">
										<th>attribute</th>
										<th>原用户value</th>
										<th>目标用户value</th>
										</tr>
										<tbody id="t_attrs_body">
										</tbody>
									</table>
								</div>
							</div>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content"
					style="width: 800px; height: auto; margin: 100px 0 0 -100px;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">自动合并</h4>
					</div>
					<div class="modal-body">
						<div class="row" style="margin: 20px 0 20px 0">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered">
										<th>
											<tr class="active">
												<th width="35%">attribute</th>
												<th width="63%">value</th>
											</tr>
										</th>
										<tbody id="t_mattrs_body">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
						
				</div>

				<div class="modal-footer">
					<button onclick="mergeUser()" type="button" class="btn btn-primary">提交更改</button>
					<script type="text/javascript">
						function mergeUser(){
							if(params==null || params.mobile==null || params.mobile==''){
								showMsg('请先输入手机号查询');
							}else{
								if($("#mergeMobile").val()==$("#mobile").val()){
									showMsg("无法将两个相同手机号进行合并");
									return;
								}else{
								$("#bg_bottom").css("display","block");
								$.ajax({
									type:"post",
									url:"<%=basePath%>/searchuser/merge",
									data:params,
									dataType:"text",
									success:function(data){
										//隐藏隐藏层
										$("#bg_bottom").css("display","none");
										
										$("#closeModal").click();
										$(".modal-backdrop").hide();
										$("myModal").modal('hide');
										if(data == 'SUCCESS'){
											$("#msg").html("数据保存成功!");
											$("#msg").removeClass('prompt_2');
											$("#msg").addClass('prompt_1');
										}else{
											$("#msg").html(data);
											$("#msg").removeClass('prompt_2');
											$("#msg").addClass('prompt_1');
										}
										$("#t_mattrs_body > tr").remove();
										$("#msg").css("display","block");
										$("#msg").fadeOut(20000);
										$("#bg_bottom").css("display","none");
									}
								}); }
							}
						}
						
						function showMsg(msg){
							$("#msg").html(msg);
							$("#msg").css("display","block");
							$("#msg").fadeOut(10000);
						}
					</script>
					<button id="closeModal" type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!--loading效果-->
	<div id="bg_bottom" class="bg_bottom" style="z-index:9999">
		<div class="spinner">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
			<p>数据加载中，请稍等</p>
		</div>
	</div>
	<div id="msg" class="prompt" style="z-index:99999">
	</div>  
</body>
</html>