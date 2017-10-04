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
 function searchLaboratoryReser(){
	 $("#dg").datagrid('load',{
		"labName":$("#s_labName").val() 
	 });
 }
 
 function openLaboratoryReserAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","预约实验室");
	 url="${pageContext.request.contextPath}/reservation/save.do";
 }
 function saveLaboratoryReser(){
	 $("#fm").form("submit",{
		url:url,
		onSubmit:function(){
	    	if($("#resLab").val()==""){
	    		$.messager.alert("系统提示","实验室名称不能为空");
	    		return false;
	    	}
	    	if($("#resName").val()==""){
	    		$.messager.alert("系统提示","实验室预约人不能为空");
	    		return false;
	    	} 
	    	if($("#reserTime").val()==""){
	    		$.messager.alert("系统提示","实验室预约时间不能为空");
	    		return false;
	    	}
	    	return $(this).form("validate");
	    },
	    success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","预约提交成功");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}
			else{
				$.messager.alert("系统提示","提交失败");
				return;
			}
	    }
	 });
 }
 function resetValue(){
	 $("#laboReserName").val("");
	 $("#resName").val("");
	 $("#labDutyPerson").val("");
	 $("#labReserTime").val("");
 }
 function closeLaboratoryReserDialog(){
	 $("#dlg").dialog("close");
     resetValue();
 }
</script>
</head>
<body style="margin: 1px">
	<table id="dg" title="实验室预约管理" class="easyui-datagrid"
		fitColunms="true" pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/reservation/list.do"
		fit="true" toolbar="#tb">
		<thead>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="resId" width="50" align="center">编号</th>
			<th field="resLab" width="70" align="center">实验室名称</th>
			<th field="resName" width="100" align="center">实验室预约人</th>
			<th field="resTime" width="200" align="center">实验室预约时间</th>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openLaboratoryReserAddDialog()"
				class="easyui-linkbutton" iconCls="icon-add" plain="true">预约实验室</a>
		</div>
		<div>
			&nbsp;实验室名称：&nbsp;<input type="text" id="s_labName" size="20"
				onkeydown="if(event.keyCode==13) searchLaboratory()" /> <a
				href="javascript:searchLaboratoryReser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 620px; height: 250px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspace="8px">
				<tr>
					<td>实验室名称：</td>
					<td>
					 <input class="easyui-combobox" name="resLab" id="resLab"  data-options="
						url:'${pageContext.request.contextPath}/laboratory/listLab.do',
						method:'get',
						valueField:'labName',
						textField:'labName',
						">
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>预约人：</td>
					<td><input type="text" id="resName" name="resName"
						class="easyui-textbox"   value="${currentUser.realName}" readonly="true"/>&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>预约时间：</td>
					<td><input type="text" id="resTime" name="resTime"
						class="easyui-textbox"   />&nbsp;<font
						color="red">*</font></td>
					<td>例:2017-10-31 下午 1、2节</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveLaboratoryReser()" class="easyui-linkbutton"
			iconCls="icon-ok">提交</a> <a
			href="javascript:closeLaboratoryReserDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>
