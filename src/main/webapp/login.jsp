<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>计科实验室管理系统登录</title>
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

<STYLE type=text/css>
BODY {
	TEXT-ALIGN: center;
	PADDING-BOTTOM: 0px;
	BACKGROUND-COLOR: #ddeef2;
	MARGIN: 0px;
	PADDING-LEFT: 0px;
	PADDING-RIGHT: 0px;
	PADDING-TOP: 0px
}

A:link {
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:visited {
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #ff0000;
	TEXT-DECORATION: underline
}

A:active {
	TEXT-DECORATION: none
}

.input {
	BORDER-BOTTOM: #ccc 1px solid;
	BORDER-LEFT: #ccc 1px solid;
	LINE-HEIGHT: 20px;
	WIDTH: 182px;
	HEIGHT: 20px;
	BORDER-TOP: #ccc 1px solid;
	BORDER-RIGHT: #ccc 1px solid
}

.input1 {
	BORDER-BOTTOM: #ccc 1px solid;
	BORDER-LEFT: #ccc 1px solid;
	LINE-HEIGHT: 20px;
	WIDTH: 120px;
	HEIGHT: 20px;
	BORDER-TOP: #ccc 1px solid;
	BORDER-RIGHT: #ccc 1px solid;
}
</STYLE>
<script type="text/javascript">
	function login(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		var roleId=$("#roleId").val();
		if(userName==null||userName==""){
			alert("用户名不能为空！");
			return;
		}
		if(password==null||password==""){
			alert("密码不能为空！");
			return;
		}
		if(roleId==null||roleId==""){
			alert("请选择用户类型！");
			return;
		}
		$("#adminlogin").submit();			
		
	}
</script>
</head>
<body>
	<FORM id=adminlogin method=post name=adminlogin
		action="${pageContext.request.contextPath}/user/login.do">
		<DIV></DIV>
		<TABLE style="MARGIN: auto; WIDTH: 100%; HEIGHT: 100%" border=0
			cellSpacing=0 cellPadding=0>
			<TBODY>
				<TR>
					<TD height=150>&nbsp;</TD>
				</TR>
				<TR style="HEIGHT: 254px">
					<TD>
						<DIV style="MARGIN: 0px auto; WIDTH: 936px">
							<IMG style="DISPLAY: block"
								src="${pageContext.request.contextPath}/images/body_03.jpg">
						</DIV>
						<DIV style="BACKGROUND-COLOR: #278296">
							<DIV style="MARGIN: 0px auto; WIDTH: 936px">
								<DIV
									style="BACKGROUND: url(${pageContext.request.contextPath}/images/body_05.jpg) no-repeat; HEIGHT: 155px">
									<DIV
										style="TEXT-ALIGN: left; WIDTH: 265px; FLOAT: right; HEIGHT: 125px; _height: 95px">
										<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
											<TBODY>
												<TR>
													<TD style="HEIGHT: 45px"><INPUT type="text"
														class=input value="${user.userName }" name="userName"
														id="userName"></TD>
												</TR>
												<TR>
													<TD><INPUT type="password" class=input
														value="${user.password }" name="password" id="password" /></TD>
												</TR>
												<TR>
													<td><select id="roleId" name="roleId" class="input"
														style="margin-top: 15px; height: 24px">
															<option value="">请选择用户类型...</option>
															<option value="1">系统管理员</option>
															<option value="2">实验室中心主任</option>
															<option value="3">实验室主任</option>
															<option value="4">实验室责任人</option>
															<option value="5">教师</option>
															<option value="6">学生</option>
													</select></td>
												</TR>
											</TBODY>
										</TABLE>
									</DIV>
									<DIV style="HEIGHT: 1px; CLEAR: both"></DIV>
									<DIV style="WIDTH: 380px; FLOAT: right; CLEAR: both">
										<TABLE border=0 cellSpacing=0 cellPadding=0 width=300>
											<TBODY>

												<TR>
													<TD width=100 align=right><INPUT
														style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
														id=btnLogin
														src="${pageContext.request.contextPath}/images/btn1.jpg"
														type=image name=btnLogin
														onclick="javascript:login();return false;"></TD>
													<TD width=100 align=middle><INPUT
														style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
														id=btnReset
														src="${pageContext.request.contextPath}/images/btn2.jpg"
														type=image name=btnReset
														onclick="javascript:adminlogin.reset();return false;"></TD>
													<TD><a href="javascript:register()"><font
															color="red">注册</font></a></TD>
												</TR>
											</TBODY>
										</TABLE>
									</DIV>
								</DIV>
							</DIV>
						</DIV>
						<DIV style="MARGIN: 0px auto; WIDTH: 936px">
							<IMG src="${pageContext.request.contextPath}/images/body_06.jpg">
						</DIV>
					</TD>
				</TR>
				<TR style="HEIGHT: 30%">
					<TD>&nbsp;</TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
	<div id="dlg" class="easyui-dialog" title="新用户注册"
		style="width: 600px; height: 400px" closed="true">
		<div style="padding: 10px 0 10px 60px">
			<form id="ff" method="post">
				<table>
					<tr>
						<td>姓名:</td>
						<td><input id="realName" class="easyui-validatebox"
							type="text" name="realName" data-options="required:true"></input></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><input id="email" class="easyui-validatebox" type="text"
							name="email" data-options="required:true,validType:'email'"></input></td>
					</tr>
					<tr>
						<td>用户名:</td>
						<td><input id="userName2" class="easyui-validatebox"
							type="text" name="userName" data-options="required:true" /></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input type="password" id="password2"
							class="easyui-validatebox" name="password" /></td>
					</tr>
					<tr>
						<td>确认密码:</td>
						<td><input type="password" id="repassword"
							class="easyui-validatebox" name="repassword" /></td>
					</tr>
					<tr>
						<td>身份:</td>
						<td><select class="easyui-combobox" name="roleId"
							editable="false">
								<option value="6">学生</option>
								<!--  <option value="是"></option> -->
						</select></td>
					</tr>
					<tr>
						<td><span><font color="red">*身份默认为学生 请联系管理员更改身份</font></span></td>
					</tr>
				</table>
			</form>
		</div>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm()">提交</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="clearForm()">重置</a>
		</div>
	</div>

</body>
</html>
<script type=text/javascript>
	if('${errorMsg}'!=''){
		alert('${errorMsg}');
	}
function register(){
	$("#dlg").dialog("open");
	
}
function submitForm(){
	$("#ff").form("submit",{
	url:'${pageContext.request.contextPath}/user/save.do',
	onSubmit:function(){
		alert($("#userName").val());
		if($("#realName").val()==''){
			$.messager.alert("系统消息","真实姓名不能为空");
			return false;
		}if($("#email").val()==''){
			$.messager.alert("系统消息","邮箱不能为空");
			return false;
		}if($("#userName2").val()==''){
			$.messager.alert("系统消息","用户名不能为空");
			return false;
		}if($("#password2").val()==''){
			$.messager.alert("系统消息","密码不能为空");
			return false;
		}if($("#repassword").val()!=$("#password2").val()){
			$.messager.alert("系统消息","两次密码不一致");
			return false;
		}
		return $(this).form("validate");
	  },
	 success:function(result){
		 var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功");
				$('#dlg').dialog('close');
				clearForm();
				return;
			}
			else{
				$.messager.alert("系统提示","保存失败");
				return;
			}
	 }
	  }
	);
}
function clearForm(){
		$('#ff').form('clear');
}
</script>