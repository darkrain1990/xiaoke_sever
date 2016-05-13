<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>页面头部</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<script src="../js/bootstrap.min.js"></script>
<script src="../js/easypiechart.js"></script>
<script src="../js/easypiechart-data.js"></script>
<script src="../js/bootstrap-table.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/datepicker3.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>小客旅行客服管理系统</span></a>
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
</body>
</html>