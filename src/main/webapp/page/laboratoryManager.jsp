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
 function searchLaboratory(){
	 $("#dg").datagrid('load',{
		"labName":$("#s_labName").val() 
	 });
 }
 
 function openLaboratoryAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","添加实验室信息");
	 url="${pageContext.request.contextPath}/laboratory/save.do";
 }
 function openLaboratoryModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的信息");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑实验室信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/laboratory/save.do?id="+row.id;
 }
 function saveLaboratory(){
	 $("#fm").form("submit",{
		url:url,
	    onSubmit:function(){
	    	if($("#laboratoryName").val()==""){
	    		$.messager.alert("系统提示","实验室名称不能为空");
	    		return false;
	    	}
	    	if($("#labStatus").val()==""){
	    		$.messager.alert("系统提示","实验室状态不能为空");
	    		return false;
	    	}
	    	if($("#labCode").val()==""){
	    		$.messager.alert("系统提示","实验室代码不能为空");
	    		return false;
	    	}
	    	if($("#labAddress").val()==0){
	    		$.messager.alert("系统提示","实验室地址不能为空");
	    		return false;
	    	}
	    	if($("#labDutyPerson").val()==0){
	    		$.messager.alert("系统提示","实验室负责人不能为空");
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
	 $("#laboratoryName").val("");
	 $("#labStatus").val("");
	 $("#labCode").val("");
	 $("#labAddress").val("");
	 $("#labDutyPerson").val("");
 }
 function closeLaboratoryDialog(){
	 $("#dlg").dialog("close");
     resetValue();
 }
 function deleteLaboratory(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 var ids=strIds.join(",");
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",
	 function(r){
		 if(r){
				$.post("${pageContext.request.contextPath}/laboratory/delete.do",{ids:ids},function(result){
					if(result.success){
						 $.messager.alert("系统提示","数据已成功删除！");
						 $("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败，请联系系统管理员！");
					}
				},"json");
			} 
	 	
	 });
 }
 function openLabClassLoadDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 var row=selectedRows[0];
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择要上传课表的实验室");
		 return false;
	 }
	 $("#dlg2").dialog("open").dialog("setTitle",row.LabName+"上传文件");
	 
}
function saveLabClassDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 var row=selectedRows[0];
	 var labId=row.id;
	 $("#fm2").form("submit",{
			url:'${pageContext.request.contextPath}/laboratoryClass/upload.do?labId='+labId+'',
		    onSubmit:function(){
		    	/* if($("#file").val()==''){
		    		$.messager.alert("系统消息","上传不能为空");
		    		return false;
		    	} */
		    	return $(this).form("validate");
		    },
		    success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功");
					$("#dlg2").dialog("close");
					$("#fm2").form("clear");
				}
				else{
					$.messager.alert("系统提示","保存失败");
					return;
				}
		    }
		   });
}
function closeLabClassDialog(){
	$("#dlg2").dialog("close");
}
function download(val,row,index){
		return '<a href="${pageContext.request.contextPath}/laboratoryClass/download.do?labId='+row.id+'" target="_blank"><font color="red">下载</font></a>';
}
</script>
</head>
<body style="margin: 1px">
	<table id="dg" title="实验室管理" class="easyui-datagrid" fitColunms="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/laboratory/list.do" fit="true"
		toolbar="#tb">
		<thead>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="50" align="center">编号</th>
			<th field="labName" width="70" align="center">实验室名称</th>
			<th field="labStatus" width="100" align="center">实验室状态</th>
			<th field="labCode" width="70" align="center">实验室代码</th>
			<th field="labAddress" width="120" align="center">实验室地址</th>
			<th field="labDutyPerson" width="120" align="center">实验室负责人</th>
			<th field="labClassTable" width="120" align="center"
				formatter="download">课表</th>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openLaboratoryAddDialog()"
				class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openLaboratoryModifyDialog()"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteLaboratory()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a> <a
				href="javascript:openLabClassLoadDialog()" class="easyui-linkbutton"
				iconCls="icon-save" plain="true">上传课表</a>
		</div>
		<div>
			&nbsp;实验室名称：&nbsp;<input type="text" id="s_labName" size="20"
				onkeydown="if(event.keyCode==13) searchLaboratory()" /> <a
				href="javascript:searchLaboratory()" class="easyui-linkbutton"
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
					<td><input type="text" id="labName" name="labName"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>实验室状态：</td>
					<td><input type="text" id="labStatus" name="labStatus"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>实验室代码：</td>
					<td><input type="text" id="labCode" name="labCode"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>实验室地址：</td>
					<td><input type="text" id="labAddress" name="labAddress"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>实验室负责人：</td>
					<td><input type="text" id="labDutyPerson" name="labDutyPerson"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveLaboratory()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeLaboratoryDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	</div>
	<div id="dlg2" class="easyui-dialog"
		style="width: 300px; height: 200px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons2">
		<form id="fm2" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>课表上传:</td>
					<td><input class="easyui-filebox" id="file" name="file" /></td>
				</tr>
			</table>
		</form>
		<div id="dlg-buttons2">
			<a href="javascript:saveLabClassDialog()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeLabClassDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
	</div>
</body>
</html>
