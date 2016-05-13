<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>小客测试</title>
<script src="../js/jquery-1.8.0.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/easypiechart.js"></script>
<script src="../js/easypiechart-data.js"></script>

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/datepicker3.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">

<style type="text/css">
.s1 {
	border: 0.5px solid white;
}

.s2 {
	border: 0.5px solid #30A5FF;
}

.b1 {
	color: white;
	background: white;
	border: white;
}

.b2 {
	background-color: #fff;
	background-image: url(images/btn-yes1.png);
	border: #30A5FF;
	height: 20px;
	width: 20px;
	position: relative;
	top: -6px;
	left: 2px;
}
li{
	list-style-type:none;}
</style>

<script>
	!function($) {
		$(document).on("click", "ul.nav li.parent > a > span.icon", function() {
			$(this).find('em:first').toggleClass("glyphicon-minus");
		});
		$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
	}(window.jQuery);

	$(window).on('resize', function() {
		if ($(window).width() > 768)
			$('#sidebar-collapse').collapse('show');
	});
	$(window).on('resize', function() {
		if ($(window).width() <= 767)
			$('#sidebar-collapse').collapse('hide');
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".main").load("../loads/userSearch.jsp");//登录后加载userSearch.jsp
		$(".a").each(function() {
			$(this).click(function showtext(topage) {
				//点谁获取到谁的链接地址
				var topage = $(this).attr("topage");

				$(".main").load(topage);
				return topage;
			});
		});
	});

	function showVINInfo() {
		$(".main").load("loads/VINInfo.jsp");

	}

	function showmemberInfo() {
		$(".main").load("loads/memberInfo.jsp");

	}
</script>

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>运维工具</span></a>
				<ul class="user-menu">
					<li class="dropdown pull-right"><a href="login.jsp"
						class="dropdown-toggle" data-toggle="dropdown"><span
							class="glyphicon glyphicon-user"></span> 用户名 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span>
									用户资料</a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu" style="margin-top: 42px;">
			<li class="parent "><a href="#"> <span
					class="glyphicon glyphicon-list"></span> IDM用户管理 <span
					data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em
						class="glyphicon glyphicon-s glyphicon-plus"></em></span>
			</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="a" href="#" topage="../loads/userSearch.jsp"> <span
							class="glyphicon glyphicon-search"></span> 用户查询
					</a>
					</li>
					<li><a class="a" href="#" topage="../loads/message.jsp"> <span
							class="glyphicon glyphicon-search"></span> 短信查询
					</a></li>
					<li><a class="a" href="#" topage="../loads/autoMerge.jsp">
							<span class="glyphicon glyphicon-log-in"></span> 合并用户
					</a>
						<ul>
							<li><a class="a" href="#" topage="../loads/autoMerge.jsp">
									<span class="glyphicon glyphicon-share-alt"></span>自动合并
							</a></li>
							<li><a class="a" href="#" topage="../loads/manualMerge.jsp">
									<span class="glyphicon glyphicon-share-alt"></span>手动合并
							</a></li>
						</ul></li>

				</ul></li>
			<!-- <li><a href=""><span class="glyphicon glyphicon-th"></span>
					功能链接</a></li>
			<li><a href=""><span class="glyphicon glyphicon-stats"></span>
					功能链接</a></li>
			<li><a href=""><span class="glyphicon glyphicon-list-alt"></span>
					功能链接</a></li>
			<li><a href=""><span class="glyphicon glyphicon-pencil"></span>
					功能链接</a></li>
			<li><a href=""><span class="glyphicon glyphicon-info-sign"></span>
					功能链接</a></li>
			<li class="parent "><a href="#"> <span
					class="glyphicon glyphicon-list"></span> 功能链接 <span
					data-toggle="collapse" href="#sub-item-2" class="icon pull-right"><em
						class="glyphicon glyphicon-s glyphicon-plus"></em></span>
			</a>
				<ul class="children collapse" id="sub-item-2">
					<li><a class="" href="#"> <span
							class="glyphicon glyphicon-share-alt"></span> 功能链接
					</a></li>
					<li><a class="" href="#"> <span
							class="glyphicon glyphicon-share-alt"></span> 功能链接
					</a></li>
					<li><a class="" href="#"> <span
							class="glyphicon glyphicon-share-alt"></span> 功能链接
					</a></li>
				</ul></li>
			<li role="presentation" class="divider"></li>
			<li><a href=""><span class="glyphicon glyphicon-user"></span>
					功能链接</a></li>-->
		</ul>
	</div>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

	</div>

</body>
</html>