<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>

<html>
	<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui-lang-zh_CN.js"></script>
	
<script type="text/javascript">
	$(function() {
		$("#txtUsername").validatebox({
			required:true
		});
		$("#txtPassword").validatebox({
			required:true
		});
		$("#loginBtn").linkbutton({
  						text:"登录",
  						iconCls:"icon-man"	,
  						onClick:function(){
  							$("#loginForm").form("submit",{
  								url:"${pageContext.request.contextPath }/user/checkLogin",
  								onSubmit:function(){
  									return $("#loginForm").form("validate");
  								},
  								success:function(){
  									$.messager.show({
									title:"标题",
									msg:"登录成功！"
									});
									 location.href="${pageContext.request.contextPath }/view/layout.jsp";
  								}
  							});
  						}	
  				});
	
	
	});
</script>	
		
	</head>

	<body>
		<div id="wrap">
			<div id="top_content">
					<div class="main">
						<form method="post"  id="loginForm" >			
							<ul>
								<li>
									<span>用户：</span>
									<input type="text" name="username" id="txtUsername" class="textbox" />
								</li>
								<li>
									<span class="blank">密码：</span>
									<input type="password" name="password" id="txtPassword"
										class="textbox" />
								</li>
								<li>
									<a id="loginBtn">登录</a>
								</li>
							</ul>
						</form>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
					ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>
