<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>车辆加减</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.8.0.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/easypiechart.js"></script>
<script src="../js/easypiechart-data.js"></script>
<script src="../js/bootstrap-table.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/datepicker3.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<script src="../js/daohang.js"></script>
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
				<li><a href="../loads/carsManage.jsp"><span
						class="glyphicon glyphicon-home"></span></a> &nbsp/&nbsp <a
					href="../loads/carsManage.jsp">车辆管理</a> &nbsp/&nbsp<a class="carsManage">车辆加减</a></li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="margin-top:20px;">
					<div class="panel-body">
                    	<div class="row" id="msg">
							<div class="col-md-4">
								<div class="form-group">
									<label>手机号 &nbsp/&nbsp 会员卡号 &nbsp/&nbsp 微信号 &nbsp/&nbsp 用户标识</label>
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<button type="submit" class="btn btn-primary search_btn" style="margin-top:24px;">查询</button>
							</div>
						</div>
                        <hr />
                    	<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label>VIN号</label>
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-primary search_btn" style="margin-top:24px;">加车</button>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>VIN号</label>
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-primary search_btn" style="margin-top:24px;">减车</button>
							</div>
						</div>
						
						<div class="row"  style="margin-top:20px">
							<div class="col-md-12">
								<textarea name="textarea" id="textarea" cols="100" rows="15"></textarea>
							</div>
						</div>
                    
					</div>
				</div>
			</div>
		</div>
	
	</div>
	
</body>

</html>
