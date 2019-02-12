<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>


  		
  	<script type="text/javascript">
  			
  		$(function(){
  			//分组下拉列表
				$("#group").combobox({
           			url:"${pageContext.request.contextPath }/category/queryAll",
           			editable:false,
           			textField:"cname",
           			valueField:"cid",
           			 onChange:function(cid){
           				$("#group").combobox("setValue",cid);
           				//alert(cid)
           			}, 
           			 onLoadSuccess:function(data){  // data -- [{},{}]
						console.log(data[0].cid);
						// 设置 省下拉列表 的第一项 默认选中
						$("#group").combobox("setValue", data[0].cid);
					}
           		});
  		
  		
  		
  				//id框
  				 				
  				//namek框
  				$("#addname").textbox({
  					required:true  					
  				});
  				//score
  				$("#addmobile").validatebox({
  					required:true,
  				    validType:"isLength[11]"
  				});
  				//验证手机号为数字11位
  				$.extend($.fn.validatebox.defaults.rules,{
  					//检查长度
  					isLength:{
  						validator:function(value,param){//param[0]:参数表制定下标，
  							if(value.length==param[0]&&!isNaN(value)){//isNaN:js函数判断是否为数字
  								return true;
  							}else{
  								return false;
  							}
  						},
  						message:"手机号必须为{0}位数字！" //{0}代表制定下标的参数
  					},
  				});	
  				
  				//telphone
  				$("#addtelphone").validatebox({
  					required:true  					
  				});
  				
  				//email
  				$("#addemail").validatebox({
  					required:true ,
  					validType:"email" 					
  				});
  				
  				//city
  				$("#addcity").validatebox({
  					required:true  					
  				});
  				//birtrhday
  				$("#addbirthday").datebox({
  					required:true  					
  				});
  				
  				
  				
  				$("#addConfirm").linkbutton({
  						text:"保存",
  						iconCls:"icon-save"	,
  						onClick:function(){
  							$("#addPersonForm").form("submit",{
  								url:"${pageContext.request.contextPath }/category/insertOne",
  								onSubmit:function(){
  								//alert($("#addname").val()+"test");
  								//return true;
  									return $("#addPersonForm").form("validate");
  								},
  								success:function(){
  								/*  var sex = $("input[type=radio]:checked").val();
   								 alert(sex); */
  									$.messager.show({
									title:"标题",
									msg:"保存成功！"
									});
									$("#addDialog").dialog("close");
									$("#showAllTable").datagrid("load");
  								}
  							});
  						}	
  				});
  			});
  		
  		</script>  	
				
					<form id="addPersonForm"  method="post" >
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addname" name="catename" />
								</td>
							</tr>
							
							 
							
							
							
						</table>
						<div align="center">
							<a  id="addConfirm">test</a>
						</div>
					</form>		

