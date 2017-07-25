<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script>
	function openTab(text, url, iconCls) {
		if ($("#tabs").tabs("exists", text)) {
			$("#tabs").tabs("select", text);
		} else {
			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/page/"
					+ url + "'></iframe>";
			$("#tabs").tabs("add", {
				title : text,
				iconCls : iconCls,
				closable : true,
				content : content
			});
		}
	}
	function logout() {
		$.messager.confirm("系统提示","您确定要退出系统吗？",function(r){
				if (r) {
						window.location.href = '${pageContext.request.contextPath}/user/logout.do';
				}
			});
	}
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height: 78px;background-color: #E0ECFF">
		<table style="padding: 5px" width="100%">
			<tr>
				<td width="50%"><img alt="logo"
					src="${pageContext.request.contextPath}/images/bglogo.png"></td>
				<td valign="bottom" align="right" width="50%"><font size="3">&nbsp;&nbsp;<strong>欢迎：
				<!--
				<shiro:hasRole name="admin">
				 管理员可见
				</shiro:hasRole>
				-->
				<!--
				<shiro:hasPermission name="permission:*">
				 仅有权限管理的权限的角色可见
				</shiro:hasRole>
				-->
				</strong>${currentUser.userName }</font>
				   
					<a href="javascript:logout()" style="width: 150px;">【安全退出】</a></td>
			</tr>
		</table>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top: 100px">
					<font color="red" size="10">欢迎使用</font>
				</div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 200px" title="导航菜单" split="true">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="预约使用" data-options="selected:true,iconCls:'icon-yxgl'"
				style="padding: 10px">
				<a
					href="javascript:openTab('预约使用','saleChanceManage.jsp','icon-yxjhgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-yxjhgl'"
					style="width: 150px">实验室预约</a> 
					
			</div>
			<div title="信息显示" data-options="iconCls:'icon-khgl'"
				style="padding:10px;">
				<a
					href="javascript:openTab('项目列表','projectApplyList.jsp','icon-khxxgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khxxgl'"
					style="width: 150px;">项目申请列表</a>
				<a
					href="javascript:openTab('实验室列表','laboratoryList.jsp','icon-fwgd')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-fwgd'" style="width: 150px;">实验室列表</a>
				<a
					href="javascript:openTab('实验室课表信息','customerServiceFeedback.jsp','icon-fwfk')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-fwfk'" style="width: 150px;">实验室课表信息</a>
			</div>
			<div title="预约审核" data-options="iconCls:'icon-tjbb'"
				style="padding:10px">
				<a href="javascript:openTab('实验室预约列表','khgxfx.jsp','icon-khgxfx')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khgxfx'"
					style="width: 150px;">实验室预约列表</a> <a
					href="javascript:openTab('项目申请列表','projectCheckManager.jsp','icon-khlsgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khlsgl'"
					style="width: 150px;">项目审阅列表</a>

			</div>
			<div title="信息管理" data-options="iconCls:'icon-fwgl'"
				style="padding:10px">
				<a
					href="javascript:openTab('实验室信息管理','laboratoryManager.jsp','icon-fwcj')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-fwcj'" style="width: 150px;">实验室信息管理</a>
				<a
					href="javascript:openTab('设备信息管理','equipmentManager.jsp','icon-cpxxgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-cpxxgl'"
					style="width: 150px;">设备信息管理</a>
				<a
					href="javascript:openTab('实验室课表管理','customerServiceFile.jsp','icon-fwgd')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-fwgd'" style="width: 150px;">实验室课表管理</a> 
               <a
					href="javascript:openTab('项目申请','projectApplyManager.jsp','icon-khkfjh')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khkfjh'"
					style="width: 150px">项目信息管理</a>
			</div>
			<div title="权限管理" data-options="iconCls:'icon-jcsjgl'"
				style="padding:10px">
				<a href="javascript:openTab('用户信息管理','userManage.jsp','icon-user')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-user'" style="width: 150px;">用户信息管理</a>
			</div>
			<div title="个人中心" data-options="iconCls:'icon-item'"
				style="padding:10px">
				<a
					href="javascript:openTab('我的实验室预约','myLabReservation.jsp','icon-yxjhgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-yxjhgl'"
					style="width: 150px">我的实验室预约</a>
				<a
					href="javascript:openTab('项目申请','myProjectApply.jsp','icon-khkfjh')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khkfjh'"
					style="width: 150px">我的项目申请</a>
				<a href="javascript:openPasswordModifyDialog()"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-modifyPassword'"
					style="width: 150px;">修改密码</a> <a
					href="javascript:modifyPersonMessage()" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">修改个人信息</a>
			</div>
		</div>
	</div>
	<div region="south" style="height:25px;padding:5px" align="center">
		版权所有归zsw QQ1113673178</a>
	</div>
</body>
</html>