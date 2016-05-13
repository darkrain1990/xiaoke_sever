<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>用户查询</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
$(document).ready(function(){
	$("#msg").css("display","none");
	var erroMsg = $("#erroMsg").val();
	if(erroMsg.length != 0)
	{
		$("#msg").html(erroMsg);
		$("#msg").css("display","block");
		$("#msg").fadeOut(13000);
		$("#bg_bottom").css("display","none");
	}else{
		$("#msg").css("display","none");
	}
	/*  */
	$('#sub-item-1 li a').first().css("background","#feeeed");
	
	//用于双击一个字段后出现input框
	$('input[name*="in"]').dblclick(function(){
		
		$(this).next('button').show();
		$(this).next('button').next('input').show();
		oldvalue=$(this).val();
		$(this).removeClass("save_input1");
		$(this).addClass("save_input2");
		$(this).next('button').removeClass("save_btn1");
		$(this).next('button').addClass("save_btn2");
		
		$(this).parent().children().eq(2).removeClass("restore_btn1");
		$(this).parent().children().eq(2).addClass("restore_btn2");
		
		
		//保存原本文本框内的值
		oldvalue=$(this).val();
		
		//点击叉号按钮内容清除恢复原状
		$(".restore_btn2").each(function(){
			$(this).click(function(){
				$(this).prev('input').val(oldvalue);
				$(this).hide();
				$(this).prev('button').hide();
			});
		});
	});

	//用于点击save后保存数据
	$('button[name*="save"]').click(function(){
		$(this).removeClass("save_btn2");
		$(this).addClass("save_btn1");
		$(this).next('button').removeClass("restore_btn2");
		$(this).next('button').addClass("restore_btn1");
		$(this).prev('input').removeClass("save_input2");
		$(this).prev('input').addClass("save_input1");
		
		//点击button按钮提交表单修改数据
		var upkey=$(this).next('input').next('input').val();
		var upname=$(this).prev('input').val();
		var searchFlag = $("input[name='searchFlag']").val();
		var clientId = $("#cli").val();
		var idpUserID1 = $("#idpUserID").val();
		var idpUserId1 = $("#idpUserId").val();
		var idpUserID=null;
		if(idpUserID1!=null){
			idpUserID = idpUserID1;
		}else{
			idpUserID = idpUserId1;
		}
		if(upkey=="email_addr"||upkey=="EMAIL_ADDR"){
			var s = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if(!s.test(upname)){
				erroMsg="您的邮箱格式不正确....";
				
				$(this).hide();
				$(this).next('input').hide();
				$(this).prev('input').val(oldvalue);
				
				$("#msg").html(erroMsg);
				$("#msg").css("display","block");
				$("#msg").fadeOut(20000);
				$("#bg_bottom").css("display","none");
			}else{
				window.location = "../searchuser/upbaseinfo?upkey="+upkey+"&upname="+upname+"&searchFlag="+searchFlag+"&clientId="+clientId+"&idpUserID="+idpUserID;
			}
		}else{
			window.location = "../searchuser/upbaseinfo?upkey="+upkey+"&upname="+upname+"&searchFlag="+searchFlag+"&clientId="+clientId+"&idpUserID="+idpUserID;
		}
		
	});

	//接入方查询
	$("#submitsearch").click(function(){
		var clientid = $("input[name='clientId']").val();
		var a = $("input[name='idpparam']").val();
		var b = $("input[name='idpUserID']").val();
		var idpUserID = "";
		//idpUserID
		if(a==null||a==""){
			idpUserID = b;
		}else{
			idpUserID = a;
		}
		$("#seachForm").submit();
	});
	$("#clientId").val();
	//接入方点击显示到右侧文本框内
	$("#clientOptions").click(function(){
		$("#clientId").val($(this).val());	
	}); 

	//VINInfo详情
	$("#showvin").click(function() {
		window.location = "../loads/VINInfo.jsp";
	});
	//memberInfo详情
	$("#showmember").click(function(){
		window.location = "../searchuser/memberinfo?clientId="+$("#clientId").val()+"&idpUserID="+$("input[name='idpUserID']").val();//VininfoDetails的controller
	});
});
</script>

</head>
<body>
	<input type="hidden" id="erroMsg" name="erroMsg" value="${erroMsg}">
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
					href="../loads/userSearch.jsp">IDM用户管理</a> &nbsp/&nbsp<a class="userSearch">用户查询</a></li>
			</ol>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="margin-top: 20px;">
					<div class="panel-body">
						<form method="post" action="../searchuser/finduserinfo" id="seachForm">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>手机号 &nbsp/&nbsp 会员卡号 &nbsp/&nbsp 微信号 &nbsp/&nbsp 用户标识</label>
										<input type="text" class="form-control" id="p" required name="idpparam" value="${idpparam}">
										<input type="hidden" class="form-control" required name="idpUserID" value="${idpUserID}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>接入方</label> 
										<select id="clientOptions" class="form-control">
											<c:forEach items="${sessionScope.clientInfoList}" var="cli">
												<c:choose>
													<c:when test="${defaultClient.clientId eq cli.clientId}">
														<option selected="selected" value="${cli.clientId}">${cli.sysname}</option>
													</c:when>
													<c:otherwise>
														<option value="${cli.clientId}">${cli.sysname}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-6" class="ssID">
									<input type="text" name="clientId" id="clientId" class="form-control i1"
										style="margin-top: 25px; width: 500px" readOnly="readOnly"  value="${defaultClient.clientId}">
									<input type="hidden" name="idpUserID" id="id" readOnly="readonly" value="${idpUserID}" />
								</div>
								<div class="col-md-2">
									<input type="hidden" value="true" name="searchFlag"> 
									<input type="button" style="margin-top: 24px;" name="submitsearch" id="submitsearch"
										value="查询" class="btn btn-primary search_btn" />
								</div>
							</div>
						</form>
						<div class="row" style="margin-top: 20px">
							<div class="col-md-12">
								<div class="table-responsive">
								<!-- 	<form id="form2" method="POST"> -->
										<input type="hidden"id="cli" name="clientId" value="${defaultClient.clientId}" />
										<%-- <input type="hidden" name="idpUserID" id="id" readOnly="readonly" value="${idpUserID}" /> --%>
										<table id="infos" class="table table-bordered">
											<tr class="active">
												<!-- <th width="25%">接入方名称</th> -->
												<th width="40%">属性名称</th>
												<th width="60%">用户信息</th>
											</tr>
												<%-- <td rowspan="${usersize}" scope="col" name="jrf">ClientID</td> --%>
												<c:if test="${empty userattrList}">
													<tr>  
													  <td colspan="2" style="color:red;font:12px">无用户信息</td>  
													</tr> 
												</c:if>
												<c:forEach items="${userattrList}" var="attributeInfo">
													<tr>
														<c:choose>
															<c:when test="${attributeInfo.attributeKey=='MyLinkVINInfo' || attributeInfo.attributeKey=='member_info'}">
																	<c:if test="${attributeInfo.attributeKey=='MyLinkVINInfo'}">
																		<td scope="col" id="vinkey">${attributeInfo.attrCNName}</td>
																		<td scope="col" id="vinvalue" >
																			<a id="showvin" >${attributeInfo.attributeValue}</a>
																			<%-- <input type="hidden" value='${vinInfoArray}' id="vinInfo"> --%>
																		</td>
																	</c:if>
																	<c:if test="${attributeInfo.attributeKey=='member_info'}">
																		<td scope="col" id="memberkey">${attributeInfo.attrCNName}</td>
																		<td scope="col" id="memberValue"><a id="showmember">${attributeInfo.attributeValue}</a></td>
																	</c:if>
															</c:when>
															<c:otherwise>
																		<td scope="col" id="mpkey">${attributeInfo.attrCNName}</td>
																		<td scope="col" id="mpval">
																			<c:if test="${attributeInfo.editable==false}">
																				<input type="text" value="${attributeInfo.attributeValue}" readonly="readonly"class="save_input1"id="${attributeInfo.attributeKey}" name="${attributeInfo.attributeKey}" />
																				<input type="hidden" value="${attributeInfo.attributeKey}" name="upname">
																			</c:if>
																			<c:if test="${attributeInfo.editable==true}">
																				
																				<input type="text" value="${attributeInfo.attributeValue}" class="save_input1" name="in"/>
																				<button class="save_btn1" type="submit" name="save"></button>
																				<input type="reset"value="" class="restore_btn1" name="restore"/>
																				<input type="hidden" value="${attributeInfo.attributeKey}" name="upname">
																			</c:if>
																		</td>
															</c:otherwise>
														</c:choose>
													</tr>
											</c:forEach>
										</table>
									<!-- </form> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="msg" class="prompt_2" style="z-index:99999">
	</div>
</body>
</html>