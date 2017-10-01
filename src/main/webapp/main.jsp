<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.5.2/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.5.2/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
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
	function openPasswordModifyDialog(){
		 $("#dlg").dialog("open").dialog("setTitle","修改密码信息");
	}
	
	function closeDialog(){
		 $("#dlg").dialog("close");
	     resetValue();
	}
	function resetValue(){
		 $("#userName").val("");
		 $("#oldPassword1").val("");
		 $("#oldPassword2").val("");
		 $("#newPassword").val("");
	 }
	function validata(){
		
		if($("#oldPassword1").val()!=$("#oldPassword2").val()){
			$.messager.alert("系统提示","密码不一致");
		}
	}
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height: 108px;background-color: #E0ECFF">
		<table style="padding: 5px" width="100%">
			<tr>
				<td width="50%"><img alt="logo"
					src="${pageContext.request.contextPath}/images/logo.png"></td>
				<td valign="bottom" align="right" width="50%"><font size="3">&nbsp;&nbsp;
				<%--
				<shiro:hasRole name="admin">
				 管理员可见
				</shiro:hasRole>
				<shiro:hasPermission name="permission:*">
				 仅有权限管理的权限的角色可见
				</shiro:hasPermission>
				--%>
				<strong>欢迎：
				</strong>
				${currentUser.userName }  
				    <c:choose>
    					<c:when test="${currentUser.roleId==1}">
           									  【管理员】
 					   </c:when>
 					   <c:when test="${currentUser.roleId==2}">
           									  【实验中心主任】
 					   </c:when>
 					   <c:when test="${currentUser.roleId==3}">
           									  【实验室主任】
 					   </c:when>
 					   <c:when test="${currentUser.roleId==4}">
           									  【实验室负责人】
 					   </c:when>
 					   <c:when test="${currentUser.roleId==5}">
           									  【老师】
 					   </c:when>
       					<c:otherwise>
       					   【同学】
         			    </c:otherwise>
					</c:choose>
					<a href="javascript:logout()" style="width: 150px;">【安全退出】</a></td>
			</tr>
		</table>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'" >
				<div align="center" >
					<img alt="" src="${pageContext.request.contextPath}/images/bg.jpg" width="100%" height="600px"/>
				</div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 200px" title="导航菜单" split="true">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="预约使用" data-options="selected:true,iconCls:'icon-yxgl'"
				style="padding: 10px">
				<a
					href="javascript:openTab('实验室预约列表','laboratoryReserList.jsp','icon-yxjhgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-yxjhgl'"
					style="width: 150px">实验室预约列表</a>
				<a
					href="javascript:openTab('项目列表','projectApplyList.jsp','icon-khxxgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khxxgl'"
					style="width: 150px;">项目申请列表</a> 
				<a
					href="javascript:openTab('实验室列表','laboratoryList.jsp','icon-fwgd')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-fwgd'" style="width: 150px;">实验室列表</a>
				
				<!-- <a
					href="javascript:openTab('实验室课表信息','customerServiceFeedback.jsp','icon-fwfk')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-fwfk'" style="width: 150px;">实验室课表信息</a> -->
			</div>

			<div title="预约审核" data-options="iconCls:'icon-tjbb'"
				style="padding: 10px">
				<shiro:hasPermission name="check:*">
					<a
						href="javascript:openTab('项目在审列表','projectCheckList.jsp','icon-khlsgl')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-khlsgl'"
						style="width: 150px;">项目在审列表</a>
						<a
						href="javascript:openTab('实验室预约在审列表','laboratoryReserList.jsp','icon-khlsgl')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-khlsgl'"
						style="width: 150px;">实验室预约在审列表</a>
				</shiro:hasPermission>
				<a
					href="javascript:openTab('项目通过列表','projectPassedList.jsp','icon-yxjhgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-yxjhgl'"
					style="width: 150px">项目通过列表</a>
				<a
					href="javascript:openTab('实验室预约通过列表','projectPassedList.jsp','icon-yxjhgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-yxjhgl'"
					style="width: 150px">实验室预约通过列表</a>

			</div>

			<shiro:hasPermission name="manage:*">
				<div title="信息管理" data-options="iconCls:'icon-fwgl'"
					style="padding: 10px">
					<a
						href="javascript:openTab('实验室信息管理','laboratoryManager.jsp','icon-fwcj')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-fwcj'"
						style="width: 150px;">实验室信息管理</a> <a
						href="javascript:openTab('设备信息管理','equipmentManager.jsp','icon-cpxxgl')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-cpxxgl'"
						style="width: 150px;">设备信息管理</a>
					<!-- <a
					href="javascript:openTab('实验室课表管理','customerServiceFile.jsp','icon-fwgd')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-fwgd'" style="width: 150px;">实验室课表管理</a> -->
					<a
						href="javascript:openTab('实验室预约列表','laboratoryReserManager.jsp','icon-khgxfx')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-khgxfx'"
						style="width: 150px;">实验室预约管理</a>
				    <a
					 	href="javascript:openTab('项目信息管理','projectApplyManager.jsp','icon-khkfjh')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-khkfjh'"
						style="width: 150px">项目信息管理</a>
				    <a
						href="javascript:openTab('评论管理','messageManager.jsp','icon-lsdd')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-lsdd'"
						style="width: 150px;">评论管理</a>
				</div>
			</shiro:hasPermission>
			<shiro:hasRole name="admin">
				<div title="权限管理" data-options="iconCls:'icon-jcsjgl'"
					style="padding: 10px">
					<a
						href="javascript:openTab('用户信息管理','userManager.jsp','icon-user')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-user'"
						style="width: 150px;">用户信息管理</a>
				</div>
			</shiro:hasRole>
			<shiro:hasPermission name="personal:*">
				<div title="个人中心" data-options="iconCls:'icon-item'"
					style="padding: 10px">
					<a
						href="javascript:openTab('我的实验室预约','myLabReservation.jsp','icon-yxjhgl')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-yxjhgl'"
						style="width: 150px">我的实验室预约</a> <a
						href="javascript:openTab('项目申请','myProjectApply.jsp','icon-khkfjh')"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-khkfjh'"
						style="width: 150px">我的项目申请</a> <a
						href="javascript:openPasswordModifyDialog()"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-modifyPassword'"
						style="width: 150px;">修改密码</a>
					<!-- <a
					href="javascript:modifyPersonMessage()" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">修改个人信息</a> -->
				</div>
			</shiro:hasPermission>
		</div>
		<div id="dlg" class="easyui-dialog"
			style="width: 620px; height: 250px; padding: 10px 20px" closed="true">
			<form id="fm" method="post"
				action="${pageContext.request.contextPath}/user/modifyPassword.do">
				<table cellspace="8px">
					<tr>
						<td>账号：</td>
						<td><input type="text" id="userName" name="userName"
							class="easyui-validatabox" required="true" readonly="true"
							value="${currentUser.userName}" />&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td>旧密码：</td>
						<td><input type="text" id="oldPassword1" name="oldPassword1"
							class="easyui-validatabox" required="true" />&nbsp;<font
							color="red">*</font></td>
					</tr>
					<tr>
						<td>确认旧密码：</td>
						<td><input type="text" id="oldPassword2" name="oldPassword2"
							class="easyui-validatabox" required="true" onblur="validata()" />&nbsp;<font
							color="red">*</font></td>
					</tr>
					<tr>
						<td>新密码：</td>
						<td><input type="text" id="newPassword" name="newPassword"
							class="easyui-validatabox" required="true" />&nbsp;<font
							color="red">*</font></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="提交"></input></td>
					</tr>
				</table>
			</form>
		</div>
		<div region="south" style="height: 25px; padding: 5px" align="center">
			版权所有归zsw QQ1113673178</a>
		</div>
</body>
</html>