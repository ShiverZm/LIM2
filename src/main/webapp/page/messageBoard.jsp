<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- easyui1.3 -->
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

<!-- boostrap3 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap3/css/bootstrap-theme.min.css">
<script
	src="${pageContext.request.contextPath}/bootstrap3/js/bootstrap.min.js"></script>

<!-- kindeditor -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/kindeditor/themes/default/default.css" />
<script charset="utf-8"
	src="${pageContext.request.contextPath}/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8"
	src="${pageContext.request.contextPath}/kindeditor/lang/zh_CN.js"></script>
<title>Insert title here</title>
</head>
<script>
var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="content"]', {
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : false,
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link']
	});
});
function submitMessage(){
			editor.sync();
			var content=$("#message").val();
			if(content==''){
				$.messager.alert("系统消息","留言内容不能为空");
				return false;
			}
			var proId=${project.id};
			$.post("${pageContext.request.contextPath}/message/add.do",
					{proId:proId,content:content,date:new Date(),speaker:'${currentUser.userName}'},
					function(result){
						var result=eval("("+result+")");
					    if(result.success){
					    	$.messager.alert("系统消息","留言成功");
					    	$("#message").val('');
					    	window.location.reload();
					    	return;
					    }else{
					    	$.messager.alert("系统消息","留言成功");
					    	return false;
					    }
					}
			)
		}		
</script>
<body>
	<div class="easyui-panel" title="项目信息"
		style="width: 1320px; height: 400px; padding: 10px;">
		<div align="center">
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" align="center">项目编号</td>
						<td colspan="2" align="left">${project.id}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">项目名称:</td>
						<td colspan="2" align="left">${project.proName}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">项目内容</td>
						<td colspan="2" align="left">${project.proContent}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">申请人</td>
						<td colspan="2" align="left">${project.proApplicant}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">指导老师</td>
						<td colspan="2" align="left">${project.proTeacher}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">使用设备</td>
						<td colspan="2" align="left">${project.proEquipment}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">项目成员</td>
						<td colspan="2" align="left">${project.proGroupMember}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">项目开始时间</td>
						<td colspan="2" align="left">${project.proStartTime}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">申请报告</td>
						<td colspan="2" align="left"><a
							href="${pageContext.request.contextPath}/proFile/download.do?proId=${project.id}&&fileType=1"><font
								color="red">下载</font></td>
					</tr>
					<tr>
						<td colspan="2" align="center">结题报告</td>
						<td colspan="2" align="left"><a
							href="${pageContext.request.contextPath}/proFile/download.do?proId=${project.id}&&fileType=2"><font
								color="red">下载</font></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="easyui-panel" title="留言 信息"
		style="width: 1320px; height: auto; padding: 10px;" toolbar="tb">
		<c:forEach items="${messages}" var="item" varStatus="var">
			<div class="easyui-panel"
				title="  ${var.index}楼            ${item.speaker} ${item.speakTime}">
				<div>${item.content}</div>
				<!-- 	         <a href="#">回复</a>
			 -->
			</div>
		</c:forEach>
	</div>
	<div class="easyui-panel" title="留言">
		<textarea id="message" name="content"
			style="width: 700px; height: 200px; visibility: hidden;"> </textarea>
		<div style="padding: 5px;">
			<button onclick="javascript:submitMessage()">提交</button>
		</div>
	</div>
</body>
</html>