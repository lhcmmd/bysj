<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<title>emplist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<script src="${pageContext.request.contextPath}/jquery-1.8.3.js"></script>
		
		<script type="text/javascript">
		
		$(function(){
	 
			$.get("${pageContext.request.contextPath}/pro/querySale",
			function(res){
			
				for(var i=0;i<res.length;i++){
				/* var pid = res[i].id; */
					$("#showAllTable").append("<tr><td>"+res[i]+"</td></tr>");
				}
			
			},"json");
		
		});
		
		
  	function deleteUserByid(userid,obj){
  		 alert(userid);
  		 $.ajax({				 	
                type:"GET",
                url:"/ssmday2/person/deleteOne.do",
                data:"userid="+userid,
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
  
    function toUpdateUser(){
    
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
  }
  
  
  
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
								Name
							</td>
						</tr>
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
