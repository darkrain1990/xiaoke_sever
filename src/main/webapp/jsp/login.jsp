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
<title>登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath %>js/jquery-1.8.0.js"></script>
<link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath %>css/datepicker3.css" rel="stylesheet">
<link href="<%=basePath %>css/styles.css" rel="stylesheet">
<script src="<%=basePath %>js/bootstrap-datepicker.js"></script>

<script type="text/javascript">
	$(function(){
		//登录默认用户名和喵喵验证
		$("input[type='submit']").click(function(){
			var name = $("input[name='username']").val();
			var pwd = $("input[name='password']").val(); 
			/* if(name==null||pwd==null){
				alert("用户名或密码不能为空~");
			} */
			var form = document.getElementById("form1");
			form.action="<%=basePath%>dl/login";
			form.submit();
		});
	});
</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#"><span> XIAOKE </span> Data </a>
					</div>
				</div>
			</nav>
		</div>
		<div class="row">
			<div
				class="col-xs-8 col-xs-offset-1 col-sm-6 col-sm-offset-4 col-md-4 col-md-offset-8">
				<div class="login-panel panel panel-default"
					style="margin-top: 30px;">
					<div class="panel-heading">登录</div>
					<div class="panel-body">
						<form id="form1" role="form" action=""
							method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="User-name"
										name="username" type="text" value="admin" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password" >
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div>
								<input type="submit" class="btn btn-primary" value="登录" />
								<font style="color:red;"> ${erroMsg}</font>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
