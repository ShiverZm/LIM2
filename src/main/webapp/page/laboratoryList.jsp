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
 var url;
 function searchLaboratory(){
	 $("#dg").datagrid('load',{
		"labName":$("#s_labName").val() 
	 });
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
		</thead>
	</table>
	<div id="tb">
 	  <div>
 		&nbsp;实验室名称：&nbsp;<input type="text" id="s_labName" size="20" onkeydown="if(event.keyCode==13) searchLaboratory()"/>
 		<a href="javascript:searchLaboratory()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	 </div>
 	</div>
</body>
</html>
