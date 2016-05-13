<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>短信查询</title>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='mobilephone']").keyup(function(){
			var $mobile = $(this).val();
			var $temp = /[^\d]/g;
			var s = $mobile;
			if(!$temp.test($mobile)){
				$(this).val(s);
			}else{
				s = s.substring(0,s.length-1);
				$(this).val(s);
			}
		});
		//用于电话号的检查
		$("input[type='submit']").click(function(){
			var phone = /^1[3|4|5|7|8][0-9]{9}$/;
			var paras = $("input[name='mobilephone']").val();
			if (phone.test(paras)) {
				//$("#ff").action("../note/searchmess");
				window.location="../note/searchmess?mobilephone="+paras;
			}else{
				alert("请填写正确的手机号码格式!");
				//$("input[type='submit']").css("disabled","disabled");
			}
		});
		
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
					href="../loads/userSearch.jsp">IDM用户管理</a> &nbsp/&nbsp <a
					href="../note/searchmess" class="message">短信查询</a></li>
			</ol>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="margin-top: 20px;">
					<div class="panel-body">
						<div class="row">
							<!-- <form id="ff" method="post" name="f" > -->
								<div class="col-md-3">
									<div class="form-group">
										<label>手机号</label><input type="text" class="form-control"
											required maxlength="11" name="mobilephone" value="${mobilephone}">
									</div>
								</div>
								<div class="col-md-3">
									<input type="submit" class="btn btn-primary search_btn"
										style="margin-top: 24px;" value="查询" />
								</div>
<!-- 							</form> -->
						</div>

						<div class="row" style="margin-top: 20px">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered">
										<tr class="active">
											<th data-align="center">手机号</th>
											<th data-align="center">发送内容</th>
											<th data-align="center">发送时间</th>
											<th data-align="center">发送类型</th>
										</tr>
										<c:if test="${empty messageList}">
												<tr>  
												  <td colspan="4" style="color:red;font:12px">没有找到短信发送记录</td>  
												</tr> 
										</c:if>
										<c:forEach items="${messageList}" var="d">
											<tr>
												<td>${d.recivePhone}</td>
												<td>${d.sendContent}</td>
												<td>${d.sendDate}</td>
												<td>${d.sendType}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="fn-right mt10" id="applications-pagination">
						 第${currentPage}页||共${pagecount}页
						<c:choose>
							<c:when test="${mobilephone!='' && mobilephone!=null}">
								<c:if test="${pagecount!=1&&pagecount!=0 }">
									<a smartracker="on" seed="pageLink-pageNext" class="page-next" href="../note/searchmess?mobilephone=${mobilephone}&nowPage=1">&lt;&lt;首页</a>
								</c:if>	
								<c:if test="${currentPage>1 }">
							 	<a smartracker="on" seed="pageLink-pageNext" class="page-next" href="../note/searchmess?mobilephone=${mobilephone}&nowPage=${currentPage-1}">&lt;上一页</a>	
								</c:if>
								
								<c:if test="${currentPage<pagecount }">
								  	<a smartracker="on" seed="pageLink-pageNext" class="page-next" href="../note/searchmess?mobilephone=${mobilephone}&nowPage=${currentPage+1}">下一页&gt;</a>
								</c:if>
								<c:if test="${pagecount!=1&&pagecount!=0 }">
								  	<a smartracker="on" seed="pageLink-pageEnd" class="page-end" href="../note/searchmess?mobilephone=${mobilephone}&nowPage=${pagecount}">尾页&gt;&gt;</a>
								</c:if>	
							</c:when>
							<c:otherwise>
								<c:if test="${pagecount!=1&&pagecount!=0 }">
									<a smartracker="on" seed="pageLink-pageNext" class="page-next" href="../note/searchmess?nowPage=1">&lt;&lt;首页</a>
								</c:if>
								<c:if test="${currentPage>1 }">
								 	<a smartracker="on" seed="pageLink-pageNext" class="page-next" href="../note/searchmess?nowPage=${currentPage-1}">&lt;上一页</a>	
								</c:if>
								
								<c:if test="${currentPage<pagecount }">
								  	<a smartracker="on" seed="pageLink-pageNext" class="page-next" href="../note/searchmess?nowPage=${currentPage+1}">下一页&gt;</a>
								</c:if>
								<c:if test="${pagecount!=1&&pagecount!=0 }">
								  	<a smartracker="on" seed="pageLink-pageEnd" class="page-end" href="../note/searchmess?nowPage=${pagecount}">尾页&gt;&gt;</a>
								</c:if>
							</c:otherwise>
						</c:choose>
						</div>  
					</div>
						
				</div>
			</div>
		</div>
	</div>
</body>
</html>