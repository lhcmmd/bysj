<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<title>order2</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<script src="${pageContext.request.contextPath}/jquery-1.8.3.js"></script>
		
		<script type="text/javascript">
		
		$(function(){
	 		
			$.get("${pageContext.request.contextPath}/order/queryByuserid",
			"userid="+$("#loginuserid").val(),
			function(res){
				var userid=$("#loginuserid").val();
				for(var i=0;i<res.length;i++){
				var pid = res[i].id;
					$("#showAllTable").append("<tr><td>"+res[i].oid+"</td><td>"+res[i].createTime+"</td><td>"+res[i].revName+"</td><td>"+res[i].detail+"</td><td>"+"<a id='delete' href='Javascript:void(0)' onclick='deleteUserByid("+1+","+1+")'>deleteOne/</a></td></tr>");
				}
			},"json");
		
		});
		
		
  	function deleteUserByid(userid,pid){
  		 //alert(userid);
  		 $.ajax({				 	
                type:"GET",
                url:"/myshop/cart/deleteOne",
                data:"userid="+userid+"&pid="+pid,
                success:function(result){            
                 if(result.trim()=="deleteok"){
                  	 $("#delete").parent().parent().remove();
                	}
                	else {alert("shanchushibai ");}
                }                 	      
               });
  }
  
  function updateUserByid(userid,obj){
  		 $("#updateform").show();
  		 $.ajax({				 	
                type:"POST",
                url:"/ssmday2/person/queryOne.do",
                data:"userid="+userid,
                dataType:"JSON",
                success:function(findUser){            
                console.log(findUser);
                	$("#idinput").prop("value",findUser.id);
 					$("#nameinput").prop("value",findUser.name);
 					$("#salaryinput").prop("value",findUser.salary);
 					$("#ageinput").prop("value",findUser.age);
 					
                }                 	      
               });
  }
  
   /*  function toUpdateUser(){
    
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
	<input type="text" hidden="hidden" id="loginuserid"  value="${param.uid}" />
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
						欢迎您：${ sessionScope.name},<a href="">安全退出</a>
					</h1>
				<%-- 	<img alt="" src="/file${ sessionScope.userimg}" width="30"> --%>
					
					<div id="content">
					 <p id="whereami">
					</p> 
					
					
				</div>
					
					
					<table id="showAllTable" class="table">
						<tr class="table_header">
							<td>
								订单号
							</td>
							<td>
								创建时间
							</td>
							<td>
								收货人
							</td>
							<td>
								详细地址
							</td>
							<td>
								操作
							</td>
						</tr>
						
			   
						
					</table>
					<p>
						<input type="button" class="button" value="返回主页" onclick="location='${pageContext.request.contextPath}/view/proList.jsp'"/>
					</p>
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
