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
 function searchEquipment(){
	 $("#dg").datagrid('load',{
		"equipmentName":$("#s_equipmentName").val() 
	 });
 }
 
 function openEquipmentAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","添加设备信息");
	 url="${pageContext.request.contextPath}/equipment/save.do";
 }
 function openEquipmentModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的信息");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑设备信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/equipment/save.do?id="+row.id;
 }
 function saveEquipment(){
	 $("#fm").form("submit",{
		url:url,
	    onSubmit:function(){
	    	if($("#equipmentName").val()==""){
	    		$.messager.alert("系统提示","设备名称不能为空");
	    		return false;
	    	}
	    	if($("#model").val()==""){
	    		$.messager.alert("系统提示","型号不能为空");
	    		return false;
	    	}
	    	if($("#unit").val()==""){
	    		$.messager.alert("系统提示","单位不能为空");
	    		return false;
	    	}
	    	if($("#price").val()==0){
	    		$.messager.alert("系统提示","价格不能为空");
	    		return false;
	    	}
	    	if($("#store").val()==0){
	    		$.messager.alert("系统提示","库存不能为空");
	    		return false;
	    	}
	    	if($("#sum").val()==0){
	    		$.messager.alert("系统提示","总数不能为空");
	    		return false;
	    	}
	    	if($("#sum").val()<$("#store").val()){
	    		$.messager.alert("系统提示","库存不能大于总数");
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
	 $("#equipmentName").val("");
	 $("#model").val("");
	 $("#unit").val("");
	 $("#price").val("");
	 $("#store").val("");
	  $("#sum").val("");
	  $("#remark").val("");
	 
 }
 function closeEquipmentDialog(){
	 $("#dlg").dialog("close");
     resetValue();
 }
 function deleteEquipment(){
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
				$.post("${pageContext.request.contextPath}/equipment/delete.do",{ids:ids},function(result){
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
	<table id="dg" title="设备管理" class="easyui-datagrid" fitColunms="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/equipment/list.do" fit="true"
		toolbar="#tb">
		<thead>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="50" align="center">编号</th>
			<th field="equipmentName" width="70" align="center">设备名称</th>
			<th field="model" width="100" align="center">型号</th>
			<th field="unit" width="70" align="center">单位</th>
			<th field="price" width="120" align="center">价格</th>
			<th field="store" width="120" align="center">库存</th>
			<th field="sum" width="120" align="center">总数</th>
			<th field="remark" width="70" align="center">备注</th>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openEquipmentAddDialog()"
				class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openEquipmentModifyDialog()"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteEquipment()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;设备名称：&nbsp;<input type="text" id="s_equipmentName" size="20"
				onkeydown="if(event.keyCode==13) searchEquipment()" /> <a
				href="javascript:searchEquipment()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 620px; height: 250px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspace="8px">
				<tr>
					<td>设备名称：</td>
					<td><input type="text" id="equipmentName" name="equipmentName"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>型号：</td>
					<td><input type="text" id="model" name="model"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>单位：</td>
					<td><input type="text" id="unit" name="unit"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>价格：</td>
					<td><input type="text" id="price" name="price"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
				</tr>
				<tr>
					<td>库存：</td>
					<td><input type="text" id="store" name="store"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>总数：</td>
					<td><input type="text" id="sum" name="sum"
						class="easyui-validatabox" required="true" />&nbsp;<font
						color="red">*</font> &nbsp;<font color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveEquipment()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeEquipmentDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	</div>
</body>
</html>
