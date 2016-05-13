<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>VINinfo</title>
<script type="text/javascript" src="../js/jquery-1.8.0.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/easypiechart.js"></script>
<script src="../js/easypiechart-data.js"></script>
<script src="../js/bootstrap-table.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/datepicker3.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<script src="../js/daohang.js"></script>
<script>
$(document).ready(function(){
	$('#sub-item-1 li a').first().css("background","#feeeed");
	$.ajax({
		url:"../searchuser/vininfo",
		
		Type:"post",
		dateType:"json",
		async:false,
		success:function(data){
			var d = eval(data);
			//alert(d.length);
			var count = 0;
			for(var i = 0;i<d.length;i++){
				if(d[i].VIN!=null&&d[i].VIN!=""){
					count = count + 1;
					//alert(count);
					$(".nav-pills").append("<li name='tab' class='active'><a href='#VINInfo_"+count+"' data-toggle='tab'>VINInfo_"+count+"</a></li>");
					$("#myTabContent").append("<div name='vininfos' class='tab-pane fade active in' id='VINInfo_"+count+"'><div class='table-responsive'><table class='table table-bordered' id='tabvin"+count+"'><tr class='active'><th width='40%'>车架号属性名称</th><th width='60%'>车架号信息</th></tr></table></div></div>");
					for(var key in d[i]){
						
						$("#tabvin"+count+"").append("<tr><td>"+key+"</td><td>"+d[i][key]+"</td></tr>");
					}
				}
			}
		}
	});
	//aja加载后默认显示第一个,点击哪个显示那个
	$("li[name='tab']").each(function(){
		$(this).removeClass('active');
	});
	$("li[name='tab']").first().addClass('active');
	
	$("div[name='vininfos']").each(function(){
		$(this).removeClass('in');
	});
	$("div[name='vininfos']").first().addClass('tab-pane fade active in');
});
</script>
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
				<li><a href="../loads/userSearch.jsp"><span
						class="glyphicon glyphicon-home"></span></a> &nbsp/&nbsp <a
					href="javascript:history.go(-2);">IDM用户管理</a> &nbsp/&nbsp <a
					href="javascript:history.go(-1);" class="userSearch">用户查询</a> &nbsp/&nbsp <a
					href="#">车架号信息</a></li>
			</ol>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="margin-top: 20px;">
					<div class="panel-body">
						<div class="row" style="margin:-18px;">
							<div class="col-md-12">
								<ul class="nav nav-pills">
									
								</ul>
								<div>
									<a href="javascript:history.go(-1);" class="a"> 
										<button class="btn btn-primary pull-right" style="margin: -30px 20px 20px 0">返回</button>
									</a>
								</div>
								<div id="myTabContent" class="tab-content" style="margin:10px 0 0 30px;width:90%">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>