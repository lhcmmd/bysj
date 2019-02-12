<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>add addr</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css" />
			<script type="text/javascript">
				
			</script>
	</head>

	<body>
		<div id="wrap">
			<div id="top_content">
					<div id="header">
						<div id="rightheader">
							<p>
								2009/11/20
								<br />
							</p>
						</div>
						<div id="topheader">
							<h1 id="title">
								<a href="#">Main</a>
							</h1>
						</div>
						<div id="navigation">
						</div>
					</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						add address:
					</h1>
					<form action="${pageContext.request.contextPath}/order/insertOne" method="post" >
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="revName" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									moblie:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="tel" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									详细地址:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="detail" />
								</td>
							</tr>
							<tr>
								
								<td valign="middle" align="left">
									<input type="text" hidden="hidden" id="loginuserid" name="user.uid" value="${ sessionScope.userid}" />
								</td>
							</tr>
							
						</table>
						<p>
							<input type="submit" class="button" value="Confirm" />
						</p>
					</form>
					<input type="submit" class="button" value="我的订单" onclick="location='${pageContext.request.contextPath}/view/order.jsp'"/>
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
