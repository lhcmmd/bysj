<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>网上商城</title>
<link href="./css/common.css" rel="stylesheet" type="text/css">
<link href="./css/product.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		//获取地址栏请求参数
		var p = ${param.id};

        $(function(){
            //显示商品信息
            $("#proCoverImg").attr('src',"${pageContext.request.contextPath}/pro/proImg?id="+p);
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/pro/proDetail",
                data:"id="+p,
                success:function(result){
                    $("#proName").text(result.name);
                    $("#proId").text("编号： "+result.id);
                    $("#price").text("￥："+result.price);
                    $("#ckprice").text("￥："+result.ckprice);
                }
            });
            //加载商品图片
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/pro/detailImg",
                data:"id="+p,
                success:function(result){
                    $.each(result, function(i, value) {
                        $("#detailImg").append("<img src='${pageContext.request.contextPath}/pro/imgList?url="+ value.product_img + "' />")
                    });

                }
            });


            //添加购物车
            $("#addCart").click(function () {
                var userId = $("#loginuserid").val();
                var proId = ${param.id};
               window.location.href="${pageContext.request.contextPath}/cart/addCart?userId="+userId+"&proId="+proId;
            });

        });



    </script>

</head>
<body>
<!--获取userid-->
<input type="text" hidden="hidden" id="loginuserid"  value="${ sessionScope.userId}" />
<div class="container header">
	<div class="span5">
		<div class="logo">
			<a>
				<img src="./image/nyist.png" alt="传智播客">
			</a>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
					<img src="image\r___________renleipic_01/header.jpg" alt="正品保障" title="正品保障" height="50" width="320">
</div>	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<li style="display: list-item;" id="headerLogin" class="headerLogin">
					<a href="login.jsp">登录</a>|
				</li>
				<li style="display: list-item;" id="headerRegister" class="headerRegister">
					<a href="reg.jsp">注册</a>|
				</li>
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a href="./index.htm">[退出]</a>|
				</li>
						<li>
							<a>会员中心</a>
							|
						</li>
						<li>
							<a>购物指南</a>
							|
						</li>
						<li>
							<a>关于我们</a>
							
						</li>
			</ul>
		</div>
		<div class="cart">
			<a href="cart.jsp">购物车</a>
		</div>
			<div class="phone">
				客服热线:
				<strong>96008/53277764</strong>
			</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="./index.htm">首页</a>
						|
					</li>
					<li>
						<a href="product-category.jsp">定制套餐</a>
						|
					</li>
					<li>
						<a >安全频道</a>
						|
					</li>
					<li>
						<a>亿家卡</a>
						|
					</li>
					<li>
						<a >潮流基地</a>
						|
					</li>
					<li>
						<a>节气养生</a>
						|
					</li>
					<li>
						<a>便民服务</a>
						|
					</li>
		</ul>
	</div>

</div><div class="container productContent">
		<div class="span6">
			<div class="hotProductCategory">
				<dl>
					<dt>
						<a href="./image/蔬菜 - Powered By Mango Team.htm">男装</a>
					</dt>
					<dd>
						<a >精选上装</a>
					</dd>
					<dd>
						<a >优质下装</a>
					</dd>
					<dd>
						<a >流行趋势</a>
					</dd>
					<dd>
						<a >精选大牌</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a>女装</a>
					</dt>
					<dd>
						<a >当季热卖</a>
					</dd>
					<dd>
						<a >女士上装</a>
					</dd>
					<dd>
						<a >优质下装</a>
					</dd>
					<dd>
						<a >精品热卖</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a >男鞋</a>
					</dt>
					<dd>
						<a >精品男鞋</a>
					</dd>
					<dd>
						<a >热卖推荐</a>
					</dd>
					<dd>
						<a >推荐品牌</a>
					</dd>
					<dd>
						<a >春冬上新</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a >女鞋</a>
					</dt>
					<dd>
						<a >热门推荐</a>
					</dd>
					<dd>
						<a >个性推荐</a>
					</dd>
					<dd>
						<a >大牌推荐</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a >内衣</a>
					</dt>
					<dd>
						<a >睡衣家居服</a>
					</dd>
					<dd>
						<a >运动背心</a>
					</dd>
					<dd>
						<a >热门推荐</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a >钟表</a>
					</dt>
					<dd>
						<a >瑞士名表</a>
					</dd>
					<dd>
						<a >大牌国表</a>
					</dd>
					<dd>
						<a >时尚潮表</a>
					</dd>
					<dd>
						<a >热门推荐</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a >珠宝</a>
					</dt>
					<dd>
						<a >流行饰品</a>
					</dd>
					<dd>
						<a >黄金珠宝</a>
					</dd>
					<dd>
						<a >礼品乐器</a>
					</dd>
					<dd>
						<a >推荐品牌</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a >箱包</a>
					</dt>
					<dd>
						<a >男包</a>
					</dd>
					<dd>
						<a >女包</a>
					</dd>
					<dd>
						<a >拉杆箱</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a >运动装</a>
					</dt>
					<dd>
						<a >运动鞋</a>
					</dd>
					<dd>
						<a >运动服</a>
					</dd>
					<dd>
						<a>户外运动</a>
					</dd>
					<dd>
						<a >运动大牌</a>
					</dd>
				</dl>
				<dl class="last">
					<dt>
						<a >商城卡</a>
					</dt>
					<dd>
						<a >商城卡</a>
					</dd>
				</dl>
			</div>
			

		</div>
		<div class="span18 last">
			
			<div class="productImage">
					<a title="" style="outline-style: none; text-decoration: none;" id="zoom" href="http://image/r___________renleipic_01/bigPic1ea8f1c9-8b8e-4262-8ca9-690912434692.jpg" rel="gallery">
						<div class="zoomPad"><img id="proCoverImg" style="opacity: 1;" title="" class="medium" src=""><div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;" class="zoomPup"></div><div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;" class="zoomWindow"><div style="width: 368px;" class="zoomWrapper"><div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div><div style="width: 0%; height: 0px;" class="zoomWrapperImage"><img src="%E5%B0%9A%E9%83%BD%E6%AF%94%E6%8B%89%E5%A5%B3%E8%A3%852013%E5%A4%8F%E8%A3%85%E6%96%B0%E6%AC%BE%E8%95%BE%E4%B8%9D%E8%BF%9E%E8%A1%A3%E8%A3%99%20%E9%9F%A9%E7%89%88%E4%BF%AE%E8%BA%AB%E9%9B%AA%E7%BA%BA%E6%89%93%E5%BA%95%E8%A3%99%E5%AD%90%20%E6%98%A5%E6%AC%BE%20-%20Powered%20By%20Mango%20Team_files/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg" style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;"></div></div></div><div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;" class="zoomPreload">Loading zoom</div></div>
					</a>
				
			</div>
			<div class="name" id="proName"></div>
			<div class="sn">
				<div id="proId">编号：</div>
			</div>
			<div class="info">
				<dl>
					<dt>亿家价:</dt>
					<dd>
						<strong id="price">￥：</strong>
							参 考 价：
							<del id="ckprice"></del>
					</dd>
				</dl>
					<dl>
						<dt>促销:</dt>
						<dd>
								<a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
						</dd>
					</dl>
					<dl>
						<dt>    </dt>
						<dd>
							<span>    </span>
						</dd>
					</dl>
			</div>
				<div class="action">
					
						<dl class="quantity">
							<dt>购买数量:</dt>
							<dd>
								<input id="quantity" name="quantity" value="1" maxlength="4" onpaste="return false;" type="text">
								<div>
									<span id="increase" class="increase">&nbsp;</span>
									<span id="decrease" class="decrease">&nbsp;</span>
								</div>
							</dd>
							<dd>
								件
							</dd>
						</dl>
					<div class="buy">
							<input id="addCart" class="addCart" value="加入购物车" type="button">
				
					</div>
				</div>
			<div id="bar" class="bar">
				<ul>
						<li id="introductionTab">
							<a href="#introduction">商品介绍</a>
						</li>
						
				</ul>
			</div>
				
				<div id="introduction" name="introduction" class="introduction">
					<div class="title">
						<strong>商品介绍</strong>
					</div>
					<div id="detailImg">

					</div>
				</div>
				
				
				
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
</div>
</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a href="#">关于我们</a>
						|
					</li>
					<li>
						<a href="#">联系我们</a>
						|
					</li>
					<li>
						<a href="#">诚聘英才</a>
						|
					</li>
					<li>
						<a href="#">法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >SHOP++官网</a>
						|
					</li>
					<li>
						<a>SHOP++论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
	</div>
</div>
</body>
</html>