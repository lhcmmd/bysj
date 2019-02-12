<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>

		<script type="text/javascript">
		$(function(){
		
			 //datagrid添加控件
  			 $("#showAllUserTable").datagrid({
  			 	url:"${pageContext.request.contextPath}/user/queryAll",
  			 	columns:[[
  			 		{title:"复选框",field:"fx",width:1,checkbox:true},
  			 		{title:"用户ID",field:"uid",width:1},
  			 		{title:"用户名",field:"username",width:1},
  			 		{title:"订单明细",field:"xxx",width:1,
  			 			formatter:function(value,row,index){
  			 				return "<a id='looklookorder' href='Javascript:void(0)' onclick='looklookorder("+row.uid+")'>订单明细</a>";
  			 			}
  			 		},
  			 		//自定义列显示操作的删除和修改
  			 		{title:"Operate",field:"cz",
  			 			//value：字段值。row：行记录数据  index: 行索引。
  			 			formatter:function(value,row,index){
  			 				return "<a id='delete' href='Javascript:void(0)' onclick='deleteUserByid("+1+",this)'>删除/</a>"+"<a  onclick='updateUserByid("+1+","+1+")' href='Javascript:void(0)'>修改</a>";
  			 			}
  			 		}
  			 	]],
  			 	rownumbers:true,
  			 	fitColumns:true,
  			 	toolbar:"#addbtnDiv,deleteBatchDiv", //将添加按钮添置表格上部工具栏
  			 	striped:true, //斑马线效果
  			 	title:"商品信息",
  			 	//iconCls:"icon-man",
  			 	pagePosition:"top",
  			 	pagination:true,
  			 	pageSize:3,
  			 	pageList:[3,6,9]
  			 });
			
			//安全退出
			$("#exit").linkbutton({
				plain:true,
				text:"退出",
				iconCls:"icon-back"
			});
			
			//添加联系人按钮
			$("#addbtn").linkbutton({
				text:"添加",
				//plain:true,
				iconCls:"icon-add",
				onClick:function(){
					$("#addDialog").dialog("open");
				}
			});
			//批量删除按钮
			$("#deleteBatchbtn").linkbutton({
				text:"批量删除",
				//plain:true,
				iconCls:"icon-remove",
				onClick:function(){
					//1.获取到选中的数据的id
					var allRows = $("#showAllUserTable").datagrid("getSelections");
					if(allRows.length==0){
						$.messager.alert("提示框","请选中要删除的行","warning");
					}else{
						$.messager.confirm("确认框","确定要删除选中的行？",function(r){
						if(r){
						//alert(allRows.length);
						var id = new Array(allRows.length);
						for(var i=0;i<allRows.length;i++){
							id[i]=allRows[i].id;
						}
						//2.带着id发送请求到后台
						$.ajax({
							url:"${pageContext.request.contextPath}/person/deletePersons",
							/* data:"id="+id, */
							
							data:{"id":id},
							//traditional:true,
							
							type:"post",
							success:function(data){
								//$.messager.alert("提示框",data.isDelete,"info");
								$("#showAllUserTable").datagrid("reload");
								$.messager.show({
									title:"提示",
									msg:"删除成功"
								});
							}
						});
					}
				});
			}
					
					
				}
			});
			
	 	//添加联系人对话框
	 	$("#addDialog").dialog({
	 		closed:true, 
	 		modal:true,
	 		cache:false,
	  		title:"添加联系人：",
	  		maximizable:true,
	  		minimizable:true,
	  		collapsible:true,
	  		//toolbar:"#navigation",
	  		width:400,
	  		height:200,
	  		href:"${pageContext.request.contextPath }/view/addOnePro.jsp"
	 		
	 	});
		
			//添加联系人按钮
			$("#updatebtn").linkbutton({
				text:"修改",
				//plain:true,
				//iconCls:"icon-add",
				onClick:function(){
					$("#updateDialog").dialog("open");
				}
			});
			
		
			
			//花式搜索框
			$("#searchPersons").searchbox({
				menu:"#searchMenu",
				searcher:function(val,name){
					if(name == "xm"){
						$("#showAllUserTable").datagrid("reload",{"name":$("#searchPersons").val()});
					}
					else if(name == "pid"){
					console.log(val);
						$("#showAllUserTable").datagrid("reload","${pageContext.request.contextPath }/person/getPersonByID?userid="+val);
					}else if(name=="sj"){
						$("#showAllUserTable").datagrid("reload","${pageContext.request.contextPath }/person/getPersonByMobile?mobile="+val);
					}
				}
			});
			
			
		//修改联系人对话框
	 	$("#updateDialog").dialog({
	 		closed:true, 
	 		modal:true,
	 		cache:false,
	  		title:"修改联系人：",
	  		maximizable:true,
	  		minimizable:true,
	  		collapsible:true,
	  		//toolbar:"#navigation",
	  		width:400,
	  		height:200,
	  		href:"${pageContext.request.contextPath }/view/updatePerson.jsp"
	 		
	 	});
		
			/* $.get("${pageContext.request.contextPath}/person/showAll",
			function(res){
			
				for(var i=0;i<res.length;i++){
				var pid = res[i].id;
					$("#showAllUserTable").append("<tr><td>"+res[i].id+"</td><td>"+res[i].name+"</td><td>"+res[i].mobile+"</td><td>"+res[i].birthday+"</td><td>"+"<a id='delete' href='Javascript:void(0)' onclick='deleteUserByid("+pid+",this)'>deleteOne/</a>"+"<a  onclick='updateUserByid("+pid+",this)' href='Javascript:void(0)'>updateOne</a>"+"</td></tr>");
				}
			},"json"); */
		
		});
		function looklookorder(uid){
			window.location.href="${pageContext.request.contextPath }/view/order2.jsp?uid="+uid;
		}
		
  	function deleteUserByid(pid,obj){
  		// alert(userid);
  		 $.messager.confirm("提示","确认删除吗？",function(is){
  		 	if(is){
  		 		$.get("${pageContext.request.contextPath }/pro/deleteOne","pid="+pid,
  		 			function(){
  		 				$("#showAllUserTable").datagrid("reload");
  		 			
						$.messager.show({
							title:"提示",
							msg:"删除成功"
						}); 
  		 			},"text");
  		 	}
  		 });
  		
  }
  
  function updateUserByid(userid,cid){

  	$("#updateDialog").dialog({
  	
  		href:"${pageContext.request.contextPath }/view/updatePerson.jsp?userid="+userid+"&cid="+cid
  	});
  	$("#updateDialog").dialog("open");
  	
  }
  
  //自定义状态列属性
 function myStatusFmt(value,row,index){
 	if (value == 0)
    		return "已下线";
    	else
    		return "销售中";
 }
  
</script>

		<!-- 添加联系人对话框 -->
		<div id="addDialog"></div>
		
		
		<!-- 修改联系人对话框 -->
		<div id="updateDialog"></div>
		<!-- 删除联系人对话框 -->
		<div id="deleteDialog"></div>
		
		<!-- 添加联系人按钮 -->
		<div id="addbtnDiv" align="left">
			<a href="#" id="addbtn"></a>
			<!-- 批量删除按钮 -->
			<a href="#" id="deleteBatchbtn"></a>
		</div>
	
		<div id="wrap">
			<div id="top_content"> 
				<div id="header">
					<div id="rightheader">
						<p>
							2018/11/19
							<br />
						</p>
					</div>
					<div id="topheader">
					<!-- 	<h1 id="title">
							<a href="#">main</a>
						</h1> -->
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					
					<h1>
						欢迎您：${ sessionScope.name},<a id='exit' href="">安全退出</a>
					</h1>
				<!-- 	<img alt="" src="/file${ sessionScope.userimg}" width="30"> -->
					
		<!-- 条件搜索框 -->	
		<!-- <div align="center">用户名:<input id="searchPerson"/></div> -->
		<div align="center">按条件搜索:<input id="searchPersons"/></div>
		<div id="searchMenu">
			<div data-options="name:'xm'">姓名</div>
			<div data-options="name:'pid'">ID</div>
			<div data-options="name:'sj'">手机号</div>
		</div>					
				<div id="content">
				
			<!-- 查所有表格展示框 -->
				</div>
					<table id="showAllUserTable"></table>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
				lhc_hhh@126.com
				</div>
			</div>
		</div>

