<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
 function searchLabReserCheck(){
	 $("#dg").datagrid('load',{
		"labName":$("#s_labName").val() 
	 });
 }
 function openLabReserCheckDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的信息");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑审核信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/laboratoryReserCheck/check.do";
 }
 function saveLabReserCheck(){
	 $("#fm").form("submit",{
		url:"${pageContext.request.contextPath}/laboratoryReserCheck/check.do",
	    onSubmit:function(){
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
 function closeLabReserCheckDialog(){
	 $("#dlg").dialog("close");
     resetValue();
 }
 function resetValue(){
	 $("#proId").val("");
	 $("#proName").val("");
	 $("#checkByTeacher").val("");
	 $("#checkByDirector").val("");
	 $("#checkByCDirector").val("");
 }
 
 function displayProjectInfoDlg(value,row){
	 return '<a href="javascript:findProjectInfo('+row.proId+')">'+value+'</a>';
 }
 function findProjectInfo(id){
	  $.post("${pageContext.request.contextPath}/projectApply/findByProId.do",{id:id},function(result){
		  result=eval("("+result+")");
		  var pa=result.pa;
		  $("#projectId").val(""+pa.id);
		  $("#projectName").val(pa.proName);
		  $("#proApplicant").val(pa.proApplicant);
		  $("#proTeacher").val(pa.proTeacher);
		  $("#proGroupMember").val(pa.proGroupMember);
		  $("#proEquipment").val(pa.proEquipment);
		  $("#proStartTime").val(pa.proStartTime);
		  $("#proContent").val(pa.proContent);
		  $("#proAddress").val(pa.proAddress);
	  });
	 $("#dlg2").dialog("open").dialog("setTitle","查看实验室信息");
 } 
</script>
</head>
<body style="margin: 1px">
	<table id="dg" title="在审预约管理" class="easyui-datagrid" fitColunms="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/laboratoryReserCheck/list.do"
		fit="true" toolbar="#tb">
		<thead>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="resId" width="70" align="center">预约编号</th>
			<th field="labNmae" width="100" align="center"
				formatter="displayProjectInfoDlg">实验室名称</th>
			<th field="checkByTeacher" width="120" align="center">指导老师是否审阅</th>
			<th field="checkByDirector" width="120" align="center">实验主任是否审阅</th>
			<th field="checkByCDirector" width="150" align="center">实验室中心主任是否审阅</th>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openLabReserCheckDialog()"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true"> 审核项目
			</a>
		</div>
		<div>
			&nbsp;实验室名称：&nbsp;<input type="text" id="s_proName" size="20"
				onkeydown="if(event.keyCode==13) searchLabReserCheck()" /> <a
				href="javascript:searchLabReserCheck()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
		<div id="dlg" class="easyui-dialog"
			style="width: 620px; height: 400px; padding: 10px 20px" closed="true"
			buttons="#dlg-buttons">
			<form id="fm" method="post">
				<table cellspace="8px">
					<tr>
						<td>预约编号：</td>
						<td><input type="text" id="resId" name="proId"
							class="easyui-validatabox" readonly="true" required="true" />&nbsp;<font
							color="red">*</font></td>
					</tr>
					<tr>
						<td>实验室名称：</td>
						<td><input type="text" id="labName" name="proName"
							class="easyui-validatabox" readonly="true" required="true" />&nbsp;<font
							color="red">*</font></td>
					</tr>
					<shiro:hasPermission name="project:checkByT">
						<tr>
							<td>指导老师是否审核通过</td>
							<td><select class="easyui-combobox" name="checkByTeacher"
								style="width: 100px;">
									<option value="否">未通过审核</option>
									<option value="是">已通过审核</option>
							</select></td>
						</tr>
					</shiro:hasPermission>
					<shiro:hasPermission name="project:checkByD">
						<tr>
							<td>实验室主任是否审核通过</td>
							<td><select class="easyui-combobox" name="checkByDirector"
								style="width: 100px;">
									<option value="否">未通过审核</option>
									<option value="是">已通过审核</option>
							</select></td>
						</tr>
					</shiro:hasPermission>
					<shiro:hasPermission name="project:checkByCD">
						<tr>
							<td>实验室中心主任是否审核通过</td>
							<td><select class="easyui-combobox" name="checkByCDirector"
								style="width: 100px;">
									<option value="否">未通过审核</option>
									<option value="是">已通过审核</option>
							</select></td>
						</tr>
					</shiro:hasPermission>
				</table>
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="javascript:saveLabReserCheck()" class="easyui-linkbutton"
				iconCls="icon-ok">审查</a> <a
				href="javascript:closeLabReserCheckDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
</body>
</html>
