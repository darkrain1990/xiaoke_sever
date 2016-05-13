<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>导航菜单</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<script src="../js/bootstrap.min.js"></script>
<script src="../js/easypiechart.js"></script>
<script src="../js/easypiechart-data.js"></script>
<script src="../js/bootstrap-table.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/datepicker3.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<script>
$(document).ready(function() {

	$('#sub-item-1 li a').each(function(){
		if($($(this))[0].href==String(window.location)){	
			var left_val=$(this).attr('class');
			var right_val=$(".breadcrumb li a :eq(2)").attr('class');
			if(left_val==right_val){		
				$(this).css("background","#feeeed");	
			}
		}
	});
	$('#sub-item-2 li a').each(function(){
		if($($(this))[0].href==String(window.location)){	
			var left_val=$(this).attr('class');
			var right_val=$(".breadcrumb li a :eq(2)").attr('class');
			if(left_val==right_val){		
				$(this).css("background","#feeeed");
			}
		}
	});
	
	$("input[name='clientId']").val($("input[class='form-control i1']").val());
	var idpUserID = $("input[name='idpUserID']").val();
	var clientId = $("input[name='clientId']").val();
	
	$("a[class='userSearch']").click(function(){
		$(this).attr("href","../searchuser/finduserinfo?idpUserID="+idpUserID+"&clientId="+clientId);
		/* if(idpUserID!=null&&idpUserID!=""&&clientId!=null&&clientId!=""){
			
		}else{
			$(this).attr("href","../searchuser/finduserinfo?idpUserID="+idpUserID+"&clientId="+clientId);
		} */
	});
	
});
</script>
<body>
	<input type="hidden" name="idpUserID" class="idpUserID" value="${idpUserID}"/>
	<input type="hidden" name="clientId" value="${clientId}" class="clientId"/>
	<ul class="nav menu" style="margin-top: 42px;">
		<li class="parent">
			<a href="#">
				<span class="glyphicon glyphicon-briefcase">
				</span> 权限管理 <span data-toggle="collapse" href="#sub-item-2" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-minus"></em></span> 
			</a>
			<ul class="children collapse in" id="sub-item-2">
				<li>
					<a class="user" href="../loads/user.jsp">
						<span class="glyphicon glyphicon-bookmark"></span> 用户管理
					</a>
				</li>
				<li>
					<a class="role" href="../loads/role.jsp">
						<span class="glyphicon glyphicon-paperclip"></span> 角色管理
					</a>
				</li>
				<li>
					<a class="access" href="../loads/access.jsp">
						<span class="glyphicon glyphicon-asterisk"></span> 权限管理
					</a>
				</li>
				<li>
					<a class="resource" href="../loads/resource.jsp">
						<span class="glyphicon glyphicon-tree-deciduous"></span> 资源管理
					</a>
				</li>
			</ul>
		</li>

		<li class="parent">
			<a href="#" class="unbunding"><span class="glyphicon glyphicon-lock"></span> Test</a>
		</li>
	</ul>

<script type="text/javascript">
!function ($) {
	$(document).on("click","ul.nav li.parent > a > span.icon", function(){	
		$(this).find('em:first').toggleClass("glyphicon-minus");
		var ul=$(this).parent().parent().children('ul');
		if(($(this).find('em:first')).hasClass("glyphicon-plus")){
			ul.hide();
		}else{
			ul.show();
				
		}
	}); 
}(window.jQuery);
	
$(window).on('resize', function () {
	if ($(window).width() > 768) $('#sidebar-collapse').collapse('show');
	});
$(window).on('resize', function () {
	if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide');
	});
</script>
</body>

</html>
