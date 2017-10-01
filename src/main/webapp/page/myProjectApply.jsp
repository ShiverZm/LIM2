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
function openFileUpLoadDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 var row=selectedRows[0];
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择要上传文件的项目");
		 return false;
	 }
	 $("#dlg2").dialog("open").dialog("setTitle",row.proName+"上传文件");
	 
}
function saveFileUploadDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 var row=selectedRows[0];
	 var proId=row.id;
	 $("#fm").form("submit",{
			url:'${pageContext.request.contextPath}/proFile/upload.do?proId='+proId+'',
		    onSubmit:function(){
		    	
		    	return $(this).form("validate");
		    },
		    success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg2").dialog("close");
				}
				else{
					$.messager.alert("系统提示","保存失败");
					return;
				}
		    }
		   });
}
function closeFileUploadDialog(){
	$("#dlg2").dialog("close");
}
function resetValue(){
	$("#startFile").val('');
	$("#endFile").val('');
}
function downloadStartFile(val,row,index){
		
		return '<a href="${pageContext.request.contextPath}/proFile/download.do?proId='+row.id+'&&fileType=1" target="_blank"><font color="red">下载</font></a>';
}
function downloadEndFile(val,row,index){
		return '<a href="${pageContext.request.contextPath}/proFile/download.do?proId='+row.id+'&&fileType=2" target="_blank"><font color="red">下载</font></a>';
}
/* function download(proId,fileType){
	if(fileType==1){
		fileType="startFile";
	}else if(fileType==2){
		fileType="endFile";
	}
	$.post('${pageContext.request.contextPath}/proFile/download.do',{proId:proId,fileType:fileType});
} */
</script>
</head>
<body style="margin: 1px">
	<table id="dg" title="我的项目申请" class="easyui-datagrid" fitColunms="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/projectApply/findMyProject.do?realName=${currentUser.realName}"
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
			<th field="proStartFile" width="100" align="center"
				formatter="downloadStartFile">项目申请报告</th>
			<th field="proEndFile" width="100" align="center"
				formatter="downloadEndFile">项目结题报告</th>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openFileUpLoadDialog()" class="easyui-linkbutton"
				iconCls="icon-save" plain="true">文件上传</a>
		</div>
		<div>
			<div id="dlg2" class="easyui-dialog"
				style="width: 300px; height: 200px; padding: 10px 20px"
				closed="true" buttons="#dlg-buttons2">
				<form id="fm" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>项目申请文件:</td>
							<td><input class="easyui-filebox" id="startFile"
								name="startFile" /></td>
						</tr>
						<tr>
							<td>项目结题文件:</td>
							<td><input class="easyui-filebox" id="endFile"
								name="endFile" />
						</tr>
					</table>
				</form>
				<div id="dlg-buttons2">
					<a href="javascript:saveFileUploadDialog()"
						class="easyui-linkbutton" iconCls="icon-ok">保存</a> <a
						href="javascript:closeFileUploadDialog()"
						class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
				</div>
			</div>
</body>
</html>
