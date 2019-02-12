<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<title>Cart</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<script src="${pageContext.request.contextPath}/jquery-1.8.3.js"></script>
		
		<script type="text/javascript">
		
		$(function(){
	 
			$.get("${pageContext.request.contextPath}/cart/queryCart",
			function(res){
				var userid=$("#loginuserid").val();
				for(var i=0;i<res.length;i++){
				var pid = res[i].id;
					$("#showAllTable").append("<tr><td>"+res[i].pro.pid+"</td><td>"+res[i].pro.pname+"</td><td>"+res[i].count+"</td><td>"+res[i].price+"</td><td>"+"<a id='delete' href='Javascript:void(0)' onclick='deleteUserByid("+userid+","+res[i].pro.pid+")'>deleteOne/</a></td></tr>");
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
	<input type="text" hidden="hidden" id="loginuserid"  value="${ sessionScope.userid}" />
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
					
					<form id="updateform" style="display:none" action="" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table" >
							<tr>
								<td valign="middle" align="right">
									id:
								</td>
								<td valign="middle" align="left">
									<input id="idinput" type="text" class="inputgri" name="id" value="1" readonly="readonly"/>

								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input id="nameinput" type="text" class="inputgri" name="name" value="zhangshan"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									mobile:
								</td>
								<td valign="middle" align="left">
									<input id="mobileinput" type="text" class="inputgri" name="mobile" value="20000"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									telphone:
								</td>
								<td valign="middle" align="left">
									<input id="telphoneinput" type="text" class="inputgri" name="telphone" value="20"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									email:
								</td>
								<td valign="middle" align="left">
									<input id="emailinput" type="text" class="inputgri" name="email" value="20"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									city:
								</td>
								<td valign="middle" align="left">
									<input id="cityinput" type="text" class="inputgri" name="city" value="20"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									birthday:
								</td>
								<td valign="middle" align="left">
									<input id="birthdayinput" type="text" class="inputgri" name="birthday" value="20"/>
								</td>
							</tr>
							
						</table>
						<p>
							<input id="confirm" onclick="toUpdateUser()" type="submit" class="button" value="Confirm" />
						</p>
					</form>
				</div>
					
					
					<table id="showAllTable" class="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
								Name
							</td>
							<td>
								count
							</td>
							<td>
								price
							</td>
							<td>
								Operation
							</td>
						</tr>
						
			   
						
					</table>
					<p>
						<input type="button" class="button" value="提交订单" onclick="location='${pageContext.request.contextPath}/view/address.jsp'"/>
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
