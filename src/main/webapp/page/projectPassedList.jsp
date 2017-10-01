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
 function searchProjectPassed(){
	 $("#dg").datagrid('load',{
		"proName":$("#s_proName").val() 
	 });
 }
 function openMessage(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择要查看的项目");
		 return;
	 }
	 var row=selectedRows[0];
	 
 }
 function openMessages(val,row,index){
	 return '<a href="#" onclick="viewMessage('+row.id+')"><font color="red">查看</font></a>';
 }
 function viewMessage(proId){
	 var url='${pageContext.request.contextPath}/projectApply/projectMessage.do?proId='+proId;
	 //window.open(url);
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	$('#tabs').tabs('add',{
					title:'项目编号'+proId+'',
					content:content,
					closable:true
	});
	 return ;
 }

</script>
</head>
<body style="margin: 1px">
	<div class="easyui-tabs" id="tabs" style="width: 1600px; height: 700px">
		<div title="项目审核通过列表">
			<table id="dg" title="项目管理" class="easyui-datagrid" fitColunms="true"
				pagination="true" rownumbers="true"
				url="${pageContext.request.contextPath}/projectCheck/getFinishedPro.do"
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
					<th field="message" width="100" align="center"
						formatter="openMessages">留言信息</th>
				</thead>
			</table>
		</div>
	</div>
	<div id="tb">
		<div>
			&nbsp;项目名称：&nbsp;<input type="text" id="s_proName" size="20"
				onkeydown="if(event.keyCode==13) searchEquipment()" /> <a
				href="javascript:searchProjectPassed" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
</body>
</html>
