<%@ page pageEncoding="utf-8"%>

[
	{
		"text":"功能菜单",
		"children":[
			{
				"text":"主页",
				"attributes":{
					"aaa":"xxx",
					"mypath":"${pageContext.request.contextPath}/index.jsp"
				}
			},{
				"text":"商品管理",
				"attributes":{
					"aaa":"bbb",
					"mypath":"${pageContext.request.contextPath}/view/productList.jsp"
				}
			},
			{
				"text":"类别管理",
				"attributes":{
					"aaa":"bbb",
					"mypath":"${pageContext.request.contextPath}/view/cateList.jsp"
				}
			},
			{
				"text":"用户管理",
				"attributes":{
					"aaa":"bbb",
					"mypath":"${pageContext.request.contextPath}/view/userList.jsp"
				}
			}
		]
	}
]