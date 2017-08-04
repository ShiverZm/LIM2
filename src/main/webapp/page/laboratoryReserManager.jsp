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
 function searchLaboratoryReser(){
	 $("#dg").datagrid('load',{
		"labName":$("#s_labName").val() 
	 });
 }
 
 function openLaboratoryReserAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","添加实验室信息");
	 url="${pageContext.request.contextPath}/laboratoryReser/save.do";
 }
 function openLaboratoryReserModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的信息");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑实验室信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/laboratoryReser/save.do?id="+row.id;
 }
 function saveLaboratoryReser(){
	 $("#fm").form("submit",{
		url:url,
	    onSubmit:function(){
	    	if($("#laboratoryReserName").val()==""){
	    		$.messager.alert("系统提示","实验室名称不能为空");
	    		return false;
	    	}
	    	if($("#labResPerson").val()==0){
	    		$.messager.alert("系统提示","实验室预约人不能为空");
	    		return false;
	    	}
	    	if($("#labDutyPerson").val()==0){
	    		$.messager.alert("系统提示","实验室负责人不能为空");
	    		return false;
	    	}
	    	if($("#labReserTime").val()==0){
	    		$.messager.alert("系统提示","实验室预约时间不能为空");
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
	 $("#laboReserName").val("");
	 $("#labResPerson").val("");
	 $("#labDutyPerson").val("");
	 $("#labReserTime").val("");
 }
 function closeLaboratoryReserDialog(){
	 $("#dlg").dialog("close");
     resetValue();
 }
 function deleteLaboratoryReser(){
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
				$.post("${pageContext.request.contextPath}/laboratoryReser/delete.do",{ids:ids},function(result){
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
</script>
</head>
<body style="margin: 1px">
	<table id="dg" title="实验室预约管理" class="easyui-datagrid" fitColunms="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/laboratoryReser/list.do" fit="true"
		toolbar="#tb">
		<thead>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="50" align="center">编号</th>
			<th field="labName" width="70" align="center">实验室名称</th>
			<th field="labDutyPerson" width="100" align="center">实验室负责人</th>
			<th field="labResPerson" width="100" align="center">实验室预约人</th>
			<th field="labResTime" width="200" align="center">实验室预约时间</th>
		</thead>
	</table>
	<div id="tb">
	<div>
			<a href="javascript:openLaboratoryReserAddDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openLaboratoryReserModifyDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteLaboratoryReser()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
 	<div>
 		&nbsp;实验室名称：&nbsp;<input type="text" id="s_labName" size="20" onkeydown="if(event.keyCode==13) searchLaboratory()"/>
 		<a href="javascript:searchLaboratoryReser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	</div>
 	<div id="dlg" class="easyui-dialog"  style="width:620px;height:250px;padding: 10px 20px"
	 closed="true" buttons="#dlg-buttons">
	  <form id="fm"	method="post">
	   <table cellspace="8px">
	     <tr>
	       <td>实验室名称：</td>
	       <td><input type="text" id="labName" name="labName" class="easyui-validatabox" required="true"/>&nbsp;<font color="red">*</font></td>
	     <tr>
	         <td>实验室负责人：</td>
	       <td><input type="text" id="labDutyPerson" name="labDutyPerson" class="easyui-validatabox" required="true"/>&nbsp;<font color="red">*</font></td>
	     </tr>
	     <tr>
	         <td>实验室预约人：</td>
	       <td><input type="text" id="labResPerson" name="labResPerson" class="easyui-validatabox" required="true"/>&nbsp;<font color="red">*</font></td>
	     </tr>
	     <tr>
	         <td>实验室预约时间：</td>
	       <td><input type="text" id="labResTime" name="labResTime" class="easyui-validatabox" required="true"/>&nbsp;<font color="red">*</font></td>
	       <td>例:2017-10-31 下午 1、2节</td>
	     </tr>
	   </table>
	  </form>
	 </div>
	 <div id="dlg-buttons">
 	<a href="javascript:saveLaboratoryReser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeLaboratoryReserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
 </div>	
</body>
</html>