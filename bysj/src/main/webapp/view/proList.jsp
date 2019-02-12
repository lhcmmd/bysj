<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<title>Prolist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<script src="${pageContext.request.contextPath}/jquery-1.8.3.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
  		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui-lang-zh_CN.js"></script>
	
		<script type="text/javascript">
		$(function(){
			//分类下拉菜单
			$("#group").combobox({
           			url:"${pageContext.request.contextPath }/category/queryAll",
           			editable:false,
           			textField:"catename",
           			valueField:"cateid",
           			onChange:function(cateid){
           				$("#group").combobox("setValue",cateid);
           				$.get("${pageContext.request.contextPath}/pro/queryAllProByCateid?cateid="+cateid,
							function(res){
							var userid=$("#loginuserid").val();
							console.log(userid+"登录的用户id");
							$("#showAllTable").html("");
							$("#showAllTable").append("<tr class='table_header'><td>图片</td><td>商品名</td><td>价格</td><td>剩余</td><td>添加购物车</td></tr>");
							for(var i=0;i<res.length;i++){
							console.log(res[i].pid)
								var pid = res[i].pid;
								$("#showAllTable").append("<tr><td><img width='60' src='${pageContext.request.contextPath}"+res[i].picture+"'></td><td>"+res[i].pname+"</td><td>"+res[i].price+"</td><td>"+res[i].leftcount+"</td><td>"+"<a id='delete' href='Javascript:void(0)' onclick='deleteUserByid("+pid+","+userid+")'>添加购物车</a></td></tr>");
							}
			
						},"json");
           			}, 
           			onLoadSuccess:function(data){  // data -- [{},{}]
						console.log(data[0].cateid);
						// 设置 下拉列表 的第一项 默认选中
						$("#group").combobox("setValue", data[0].cateid);
					}
           	});
	
		});
		
		
		function deleteUserByid(pid,userid){
  		 	$.get("${pageContext.request.contextPath }/cart/addToCart","pid="+pid+"&userid="+userid,
  		 		function(){
  		 			//$("#showAllTable").datagrid("reload");
						$.messager.show({
							title:"提示",
							msg:"添加成功"
						}); 
  		 	},"text");
  		 }
	
    /* function toUpdateUser(){
    
  		 $("#updateform").hide();
  		 //alert($("#idinput").val());
  		 alert($("#nameinput").val());
  		 $.ajax({				 	
                type:"POST",
                url:"/ssmday2/person/updateOne.do",
                data:"userid="+$("#idinput").val()+"&name="+$("#nameinput").val()+"&mobile="+$("#mobileinput").val()+"&telphone="+$("#telphoneinput").val()+"&email="+$("#emailinput").val()+"&city="+$("#cityinput").val()+"&birthday="+$("#birthdayinput").val(),
           			
              //  dataType:"JSON",
                success:function(result){                          	
               		$("#updatetr").first().text($("#idinput").val());
               		$("#updatetr").first().next().text($("#nameinput").val());
               		$("#updatetr").first().next().next().text($("#mobileinput").val());
                	$("#updatetr").first().next().next().next().text($("#telphoneinput").val());
                    $("#updatetr").first().next().next().next().next().text($("#emailinput").val());
                    $("#updatetr").first().next().next().next().next().next().text($("#cityinput").val());
                   $("#updatetr").first().next().next().next().next().next().next().text($("#birthdayinput").val());
                
                
                }                 	      
               });
              return false;//
  } */
  
  
  
</script>

	
	</head>
	<body>
	<input type="text" hidden="hidden" id="loginuserid"  value="${ sessionScope.userid}" />
	
		<div id="wrap">
			<div id="top_content"> 
				<div id="header">
					<div id="rightheader">
						<p>
							2018/12/07
							<br />
						</p>
					</div>
					<div id="topheader">
						<h1 id="title">
							<a href="#">main</a>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						欢迎您：${ sessionScope.userid},<a href="">安全退出</a>
					</h1>
					
					
				<%-- 	<img alt="" src="/file${ sessionScope.userimg}" width="30"> --%>
					<div align="center">
	<input type="button" class="button" value="查看购物车" onclick="location='${pageContext.request.contextPath}/view/cartShow.jsp'"/>
	<input type="button" class="button" value="查看销量榜" onclick="location='${pageContext.request.contextPath}/view/orderBySale.jsp'"/>				
					</div>
					
					<!-- 下拉分类菜单 -->
					<div align="right">
					<input id="group"  name=""/>
					</div>
					
					<div id="content">
					 <p id="whereami">
					</p> 
					<table id="showAllTable" class="table">
					</table>
					
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
