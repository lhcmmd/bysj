<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>


  		
  	<script type="text/javascript">
  			
  		$(function(){
  			//分组下拉列表
				$("#group").combobox({
           			url:"${pageContext.request.contextPath }/category/queryAll",
           			editable:false,
           			textField:"catename",
           			valueField:"cateid",
           			 onChange:function(cateid){
           				$("#group").combobox("setValue",cateid);
           				//alert(cid)
           			}, 
           			 onLoadSuccess:function(data){  // data -- [{},{}]
						console.log(data[0].cateid);
						// 设置 省下拉列表 的第一项 默认选中
						$("#group").combobox("setValue", data[0].cateid);
					}
           		});
  		
  		
  		
  				//图片框
  				$("#addpicture").textbox({
  					required:true  					
  				});
  				 				
  				//namek框
  				$("#addname").textbox({
  					required:true  					
  				});
  				//score
  				$("#addmobile").validatebox({
  					required:true,
  				    //validType:"isLength[11]"
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
  					//validType:"email" 					
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
  								url:"${pageContext.request.contextPath }/pro/insertOne",
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
									商品名:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addname" name="pname" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									价格:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addmobile" class="inputgri" name="price" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									库存:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addemail" class="inputgri" name="leftcount" />
								</td>
							</tr>
						
							 <tr>
								<td valign="middle" align="right">
									销量:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addcity" class="inputgri" name="salecount" />
								</td>
							</tr> 
							<tr>
								<td valign="middle" align="right">
									上架时间:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addbirthday" class="inputgri" name="createTime" />
								</td>
							</tr>
							 <tr>
								<td valign="middle" align="right">
									类别:
								</td>
								<td valign="middle" align="left">
									<input id="group" name="cate.cateid"/>
								</td>
							</tr>
							
							<tr>
								<td valign="middle" align="right">
									图片路径:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addpicture" class="inputgri" name="picture" />
								</td>
							</tr>
							
							  
							
							
							
						</table>
						<div align="center">
							<a  id="addConfirm">test</a>
						</div>
					</form>		

