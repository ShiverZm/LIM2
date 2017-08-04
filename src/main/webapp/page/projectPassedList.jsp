<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
 function searchProjectPassed(){
	 $("#dg").datagrid('load',{
		"proName":$("#s_proName").val() 
	 });
 }
 function displayProjectInfoDlg(value,row){
	 return '<a href="#" onclick="findProjectInfo('+row.id+')">'+value+'</a>';
 }
 function findProjectInfo(id){
	 alert("对话框 id="+id);
 }
</script>
</head>
<body style="margin: 1px">
	<div class="easyui-panel" title="项目审核通过" iconCls="icon-search" collapsible="true" style="padding:5px;width:auto;height:300px;">
	<table id="dg" title="项目管理" class="easyui-datagrid" fitColunms="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/projectCheck/getFinishedPro.do" fit="true">
		<thead>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="70" align="center" >项目编号</th>
			<th field="proName" width="100" align="center" formatter="displayProjectInfoDlg">项目名称</th>
			<th field="proApplicant" width="70" align="center">项目申请人</th>
			<th field="proContent" width="70" align="center">项目内容</th>
			<th field="proGroupMember" width="100" align="center">项目成员</th>
			<th field="proStartTime" width="120" align="center">项目开始时间</th>
			<th field="proTeacher" width="100" align="center">项目指导老师</th>
		    <th field="proEquipment" width="120" align="center">所需设备</th>
		    <th field="proAddress" width="100" align="center">项目活动地点</th>
			<th field="proStartFile" width="100" align="center">项目申请报告</th>
			<th field="proEndFile" width="100" align="center">项目结题报告</th>
		</thead>
	</table>
	</div>
	<div class="easyui-panel" title="留言板" iconCls="icon-search" collapsible="true" style="padding:5px;width:auto;height:300px;">
	  <div class="easyui-layout" fit="true" pagination="true" style="padding:5px;width:auto;height:100px;">
	  <div region="west" class="p-left" style="width:200px;height:auto" >用户</div>
	  <div region="center" fit="true" style="width:100px;height:auto">
	       <div region="center" fit="true" style="width:100px;height:auto"> 
	       <p>留言内容留言内容留言内容留言内容</p></div>
	       <div region="south" fit="true" style="width:100px;height:auto">回复区</div>
	  </div>
	</div>
</body>
</html>
