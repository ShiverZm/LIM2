<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script type="text/javascript">
 var url;
 function searchProjectApply(){
	 $("#dg").datagrid('load',{
		"proName":$("#s_proName").val() 
	 });
 }
 
 function openProjectApplyAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","申请项目");
	 url="${pageContext.request.contextPath}/projectApply/save.do";
 }
 
 function saveProjectApply(){
	 $("#fm").form("submit",{
		url:url,
	    onSubmit:function(){
	    	if($("#proName").val()==""){
	    		$.messager.alert("系统提示","项目名称不能为空");
	    		return false;
	    	}
	    	if($("#proApplicant").val()==""){
	    		$.messager.alert("系统提示","项目申请人不能为空");
	    		return false;
	    	}
	    	if($("#proTeacher").val()==""){5
	    		$.messager.alert("系统提示","指导老师不能为空");
	    		return false;
	    	}
	    	
	    	return $(this).form("validate");
	    },
	    success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}
			else{
				$.messager.alert("系统提示","保存失败");
				return;
			}
	    }

	 });
 }
 function resetValue(){
	 $("#id").val("");
	 $("#proName").val("");
	 $("#proApplicant").val("");
	 $("#proGroupMember").val("");
	 $("#proTeacher").val("");
	 $("#proGroupMember").val("");
	 $("#proStartTime").val("");
	 $("#proEquipment").val("");
	 $("#proAddress").val("");
	 $("#proStatus").val("");
 }
 
 function closeProjectApplyDialog(){
	 $("#dlg").dialog("close");
     resetValue();
 }
 
 

  
</script>
</head>
<body style="margin: 1px">
	<table id="dg" title="项目通过审核列表" class="easyui-datagrid"
		fitColunms="true" pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/projectApply/list.do"
		fit="true" toolbar="#tb">
		<thead>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="70" align="center">项目编号</th>
			<th field="proName" width="100" align="center">项目名称</th>
			<th field="proApplicant" width="70" align="center">项目申请人</th>
			<th field="proContent" width="70" align="center">项目内容</th>
			<th field="proGroupMember" width="100" align="center">项目成员</th>
			<th field="proStartTime" width="120" align="center">项目开始时间</th>
			<th field="proTeacher" width="100" align="center">项目指导老师</th>
			<th field="proEquipment" width="120" align="center">所需设备</th>
			<th field="proAddress" width="100" align="center">项目活动地点</th>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openProjectApplyAddDialog()"
				class="easyui-linkbutton" iconCls="icon-add" plain="true">项目申请</a>
		</div>
		<div>
			&nbsp;项目名称：&nbsp;<input type="text" id="s_proName" size="20"
				onkeydown="if(event.keyCode==13) searchProjectApply()" /> <a
				href="javascript:searchProjectApply()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 620px; height: 400px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspace="8px">
				<tr>
					<td>项目名称：</td>
					<td><input type="text" id="proName" name="proName"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>项目申请人：</td>
					<td><input type="text" id="proApplicant" name="proApplicant"
						class="easyui-validatabox" required="true"
						value="${currentUser.realName}" readonly="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>项目内容：</td>
					<td><input type="text" style="height: 50px" id="proContent"
						name="proContent" class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>项目成员：</td>
					<td><input type="text" id="proGroupMember"
						name="proGroupMember" class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>项目开始时间：</td>
					<td><input type="text" id="proStartTime" name="proStartTime"
						class="easyui-datebox" required="true" />&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
					<td>项目指导老师：</td>
					<td><input type="text" id="proTeacher" name="proTeacher"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>项目所需设备：</td>
					<td><input type="text" id="proEquipment" name="proEquipment"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>项目活动地点：</td>
					<td><input type="text" id="proAddress" name="proAddress"
						class="easyui-validatabox" required="false" />&nbsp;<font
						color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveProjectApply()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a
			href="javascript:closeProjectApplyDialog()" class="easyui-linkbutton"
			iconCls="icon-cancel">关闭</a>
	</div>
	<!-- <div id="dlg-buttons2">
 	<a href="javascript:saveFileUploadDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeFileUploadDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div> -->
	</div>
</body>
</html>
